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

require 'test_helper'

class ItemCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
