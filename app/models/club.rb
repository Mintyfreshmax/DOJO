class Club < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
