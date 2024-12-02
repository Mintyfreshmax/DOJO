class Activity < ApplicationRecord
  belongs_to :club
  has_one_attached :image
  geocoded_by :address
  has_many :bookings
  has_many :feedbacks
  after_validation :geocode, if: :will_save_change_to_address?
end
