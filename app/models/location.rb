class Location < ApplicationRecord
    has_many :user_locations
    has_many :stores
    validates :latitude, :longitude, :address_line, :city, :state, :pincode, presence: true
end