class Location < ApplicationRecord
    has_many :user_locations
    has_many :stores
    validates :latitude, presence: true
    validates :longitude, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :pincode, presence: true
    validates :address_line, presence: true
    
end