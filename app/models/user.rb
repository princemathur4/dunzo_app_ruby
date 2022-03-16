class User < ApplicationRecord
    validates :name, presence: true
    enum user_type: {CUSTOMER: 0, DELIVERY_PERSON: 1}
end
