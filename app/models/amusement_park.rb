class AmusementPark < ApplicationRecord
  has_many :rides

  def self.mechanics_on_the_job(park)
    find_by_sql(["select distinct mechanics.name as mechanic_name, amusement_parks.name as park_name, rides.name as ride_name from amusement_parks join rides on rides.amusement_park_id = amusement_parks.id join ride_mechanics on rides.id = ride_mechanics.ride_id join mechanics on mechanics.id = ride_mechanics.mechanic_id where amusement_parks.id = ?", park.id])
  end

end