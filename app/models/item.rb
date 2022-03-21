class Item < ApplicationRecord
    validates :name, presence: true, length: { maximum: 255, minimum: 2}
    validates :mrp
end
