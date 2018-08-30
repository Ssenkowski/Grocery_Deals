class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :store
      t.integer :item_id
      t.integer :price

      t.timestamps
    end
  end
end
