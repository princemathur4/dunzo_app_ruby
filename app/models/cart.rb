class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :cart_items
end
