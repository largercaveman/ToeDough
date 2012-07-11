class GroupsUsersRelation < ActiveRecord::Base
  attr_accessible :admin, :role, :status

  belongs_to :group
  belongs_to :user
end
