class CreateShoppingListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_list_items do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :quantity

      t.timestamps

    end
  end
end
