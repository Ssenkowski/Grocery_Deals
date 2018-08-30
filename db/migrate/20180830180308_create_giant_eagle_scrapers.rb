class CreateGiantEagleScrapers < ActiveRecord::Migration[5.1]
  def change
    create_table :giant_eagle_scrapers do |t|
      t.string :name
      t.string :store
      t.integer :item_id
      t.integer :price
      t.timestamps
    end
  end
end
