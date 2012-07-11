class CreateGroupsUsersRelations < ActiveRecord::Migration
  def change
    create_table :groups_users_relations do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :role
      t.boolean :admin
      t.string :status

      t.timestamps
    end
  end
end
