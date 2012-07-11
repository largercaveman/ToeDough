class AddMasterItemIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :master_item_id, :integer
  end
end
