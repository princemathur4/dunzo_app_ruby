class AddDiscountPercentageToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :discount_percentage, :float
  end
end
