class CreateItemsUsersRelations < ActiveRecord::Migration
  def change
    create_table :items_users_relations do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :importance

      t.timestamps
    end
  end
end
