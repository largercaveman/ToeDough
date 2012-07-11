class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :content
      t.datetime :completed
      t.string :status
      t.integer :priority

      t.timestamps
    end
  end
end
