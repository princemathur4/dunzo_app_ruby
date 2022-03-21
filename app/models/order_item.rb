class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item
  enum status: {
    PENDING: 0,
    DELIVERED: 1,
    RETURNED: 2
  }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
