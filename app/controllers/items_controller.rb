class ItemsController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate_user!, :except => [:index, :show, :filter] 

  def index
    wheres = Item.gen_wheres_hash(params)

    if wheres.empty?
      items_unsorted = Item.all
    else
      if !params[:item_id].nil?
        @root_item = Item.find(params[:item_id])
      end

      items_unsorted = Item.where(wheres)
    end

    @items = Item.gen_sorted(items_unsorted)

    params[:chk] = @items
  end

  def show
    @item = Item.find_by_id(params[:id])
    params[:chk] = @item
  end


  def filter
    wheres = Item.gen_wheres_hash(params)

    items_unsorted = Item.where(wheres)

    @items = Item.gen_sorted(items_unsorted)

    render 'index'
  end

  def edit
    @item = Item.find_by_id(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if !params[:item].nil?
      @item.update_attributes(params[:item])
    end

    if !params[:status].nil?
      @item.update_attributes(status: params[:status])
    end

    respond_with @item
  end

  def new
    @item = Item.new()
    render 'edit'
  end

  def create
    @item = current_user.created_items.new(params[:item])

    if !params[:receiving_user_id].nil?
      @user = User.find_by_id(params[:receiving_user_id])
      if @user.nil?
        flash[:error] = "No Such User!"
        redirect_to 'index'
      end
    end

    if !params[:master_item_id].nil?
      params[:qrk] = "item not nil"
      master_item_in = Item.find_by_id(params[:master_item_id])
      if master_item_in.nil?
        flash[:error] = "No Such Item!"
        redirect_to 'index'
      else
        @item.master_item = master_item_in
        params[:ois] = @item
      end
    end

    params[:chk1] = @item
    params[:chk3] = @user
    params[:chk1] = @master_item

    if @item.save
      if !@user.nil?
        @user.items << @item
      end

      #redirect_to @item
      params[:saved] = true
      respond_with @item
    else
      render 'edit'
    end

  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "Item deleted"
    redirect_to items_path
  end

end
