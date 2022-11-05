class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:format])
    new_ride = Ride.find(params[:ride_id])

    MechanicRide.create!(mechanic: mechanic, ride: new_ride)
    
    redirect_to mechanic_path(mechanic)
  end
end