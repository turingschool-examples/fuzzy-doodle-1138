class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :machanic_rides
  has_many :machanics, through: :machanic_rides
end