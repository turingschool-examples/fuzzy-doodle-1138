class Machanic < ApplicationRecord
  has_many :machanic_rides
  has_many :rides, through: :machanic_rides
end