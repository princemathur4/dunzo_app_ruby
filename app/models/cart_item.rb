class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :menu_item
  validates :quantity, presence: true
  validates :discount_percentage, presence: true
end
