class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.references :cart, foreign_key: true
      t.references :menu_item, foreign_key: true

      t.timestamps
    end
  end
end
