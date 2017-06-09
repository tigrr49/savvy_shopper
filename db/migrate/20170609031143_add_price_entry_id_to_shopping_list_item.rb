class AddPriceEntryIdToShoppingListItem < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_list_items, :price_entry_id, :integer
  end
end
