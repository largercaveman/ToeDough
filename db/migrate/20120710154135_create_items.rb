class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :content
      t.datetime :completed
      t.integer :status
      t.integer :priority

      t.timestamps
    end
  end
end
