class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.references :store, foreign_key: true
      t.references :item, foreign_key: true
      t.float :item_price
      t.integer :available_quantity

      t.timestamps
    end
  end
end
