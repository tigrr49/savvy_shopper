class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :category_id
      t.string :name
      t.string :brand
      t.float :size
      t.integer :unit_id

      t.timestamps

    end
  end
end
