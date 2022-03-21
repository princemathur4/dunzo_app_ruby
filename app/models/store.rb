class Store < ApplicationRecord
  belongs_to :location
  has_many :menu_items
end
