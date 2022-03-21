class UserAvailability < ApplicationRecord
  belongs_to :user
  enum status: {
    NOT_AVAILABLE: 0,
    AVAILABLE: 1,
    ASSIGNED: 2
  }
end
