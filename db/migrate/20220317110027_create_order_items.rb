class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :menu_item, foreign_key: true
      t.integer :quantity
      t.float :discount_percentage
      t.integer :status

      t.timestamps
    end
  end
end
