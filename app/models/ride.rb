class Ride < ApplicationRecord
  belongs_to :amusement_park

  validates_presence_of :name
  validates_numericality_of :thrill_rating
  validates_presence_of :open
end