class CreatePriceEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :price_entries do |t|
      t.integer :item_id
      t.integer :store_id
      t.float :price

      t.timestamps

    end
  end
end
