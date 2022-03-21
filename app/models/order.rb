class Order < ApplicationRecord
  belongs_to :user
  belongs_to :store
  enum status: {
    PAYMENT_PENDING: 0,
    PAYMENT_FAILED: 1,
    CONFIRMATION_PENDING: 2,
    ITEMS_OUT_OF_STOCK: 3,
    ORDER_PLACED: 4,
    OUT_FOR_DELIVERY: 5,
    ORDER_DELIVERED: 6,
  }
  has_many :order_items
  belongs_to :assigned_delivery_person, class_name: 'User', foreign_key: 'assigned_delivery_person_id', optional: true
end
