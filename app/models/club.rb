class Club < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :details, presence: true
  validates :address, presence: true
end
