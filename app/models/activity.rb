class Activity < ApplicationRecord
  belongs_to :club
  geocoded_by :address
  has_many :bookings
  after_validation :geocode, if: :will_save_change_to_address?
end
