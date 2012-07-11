# == Schema Information
#
# Table name: item_comments
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  item_id    :integer
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class ItemComment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :item
  belongs_to :user
end
