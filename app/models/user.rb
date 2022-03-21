class User < ApplicationRecord
    validates :name, presence: true
    enum user_type: {CUSTOMER: 0, DELIVERY_PERSON: 1}
    has_many :user_availabilities
    has_many :user_locations
end
