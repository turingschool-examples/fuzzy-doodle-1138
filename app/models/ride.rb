class Ride < ApplicationRecord
  belongs_to :amusement_park

  validates_presence_of :name
  validates_numericality_of :thrill_rating
  validates :open, inclusion: { in: [true, false]}
end