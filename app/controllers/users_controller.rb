class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])

    @user_items = @user.items
    
    @items = Item.gen_sorted(@user_items)
  end

end
