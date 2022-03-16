class MenuItem < ApplicationRecord
  belongs_to :store
  belongs_to :item
end
