class Feedback < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  validates :appreciation, inclusion: { in: [true, false] }
end
