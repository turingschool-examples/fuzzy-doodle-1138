class MechanicRide < ApplicationRecord
  belongs_to :mechanic
  belongs_to :ride
  belongs_to :amusement_park
end