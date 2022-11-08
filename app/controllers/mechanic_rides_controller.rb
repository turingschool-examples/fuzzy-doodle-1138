class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:format])
    ride = Ride.find(params[:ride_id])

    MechanicRide.create!(mechanic_id: mechanic.id, ride_id: ride.id)

    redirect_to mechanic_path(mechanic)
  end
end
