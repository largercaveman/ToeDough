#Schema
# completed:datetime
# content:text
# priority:integer
# status:string
# title:string
# user_id:integer
# master_item_id:integer

class Item < ActiveRecord::Base
  attr_accessible :completed, :content, :priority, :status, :title

#  #Item - Item relations
  has_many :subitems, :class_name => "Item", :foreign_key => "master_item_id"
  belongs_to :master_item, :class_name => "Item", :foreign_key => "master_item_id"

  #Item - User relations
  belongs_to :owner, :class_name => 'User'
  has_many :items_users_relations
  has_many :users, :through => :items_users_relations # users working on it

  #Item - Comment relations
  has_many :comments
end
