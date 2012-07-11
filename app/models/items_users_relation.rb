# == Schema Information
#
# Table name: items_users_relations
#
#  id         :integer         not null, primary key
#  item_id    :integer
#  user_id    :integer
#  importance :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class ItemsUsersRelation < ActiveRecord::Base
  attr_accessible :importance

  belongs_to :item
  belongs_to :user
end
