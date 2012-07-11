class CreateItemComments < ActiveRecord::Migration
  def change
    create_table :item_comments do |t|
      t.string :content
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
