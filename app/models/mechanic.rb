class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def add_ride(ride_id)
    RideMechanic.create(mechanic_id: id, ride_id: ride_id)
  end
end