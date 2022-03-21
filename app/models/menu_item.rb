class MenuItem < ApplicationRecord
  belongs_to :store
  belongs_to :item
  has_many :cart_items
end
 