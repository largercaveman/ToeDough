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

require 'test_helper'

class ItemsUsersRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
