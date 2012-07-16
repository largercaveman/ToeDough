#Schema
# completed:datetime
# content:text
# priority:integer
# status:integer
# title:string
# user_id:integer
# master_item_id:integer
# due:datetime

class Item < ActiveRecord::Base
  default_scope order('priority DESC, due ASC, title ASC')

  def self.public_name
    return "ToDo"
  end

  before_create :default_values

  attr_accessible :due, :completed, :content, :priority, :status, :title
  validates :title, :presence => true
  validates_associated :owner

#  #Item - Item relations
  has_many :subitems, :class_name => "Item", :foreign_key => "master_item_id"
  belongs_to :master_item, :class_name => "Item", :foreign_key => "master_item_id"

  #Item - User relations
  belongs_to :owner, :class_name => 'User'
  has_many :items_users_relations
  has_many :users, :through => :items_users_relations # users working on it

  #Item - Comment relations
  has_many :comments, :class_name => 'ItemComment'


  def self.gen_sorted(item_array)
    return {
        todo:  item_array.select { |i| i.todo?  },
        doing: item_array.select { |i| i.doing? },
        done:  item_array.select { |i| i.done?  }
      }
  end

  def self.gen_wheres_hash(wheres_in)
    wheres = {}
      if !wheres_in.nil?
        wheres[:user_id] = wheres_in[:user] if !wheres_in[:user].nil?
        wheres[:user_id] = wheres_in[:user_id] if !wheres_in[:user_id].nil?
        wheres[:master_item_id] = wheres_in[:item_id] if !wheres_in[:item_id].nil?
        wheres[:master_item_id] = wheres_in[:master_item] if !wheres_in[:master_item].nil?
        wheres[:status] = wheres_in[:status] if !wheres_in[:status].nil?
      end

    return wheres
  end

  def root_node?
    self.master_item_id.nil?
  end

  def todo?
    self.status == Item.todo
  end

  def doing?
    self.status == Item.doing
  end

  def done?
    self.status == Item.done
  end

  def self.todo
    return 0
  end

  def self.doing
    return 1
  end

  def self.done
    return 2
  end

  def status_text
    return Item.status_text(self)
  end

  def self.status_text(item_in)
    # if input type is an Item
    if item_in.kind_of? Item
      return "To Do" if item_in.status == Item.todo
      return "Doing" if item_in.status == Item.doing
      return "Done"  if item_in.status == Item.done
    end

    # if input type is an integer
    if item_in.kind_of? Integer
      return "To Do" if item_in == Item.todo
      return "Doing" if item_in == Item.doing
      return "Done"  if item_in == Item.done
    end
  end

  private
    def default_values
      self.priority ||= 0
      self.status ||= Item.todo
    end
end
