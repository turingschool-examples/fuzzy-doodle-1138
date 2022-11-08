class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:mechanic][:ride_id])
    RideMechanic.create!(mechanic: mechanic, ride: ride)

    redirect_to "/mechanics/#{mechanic.id}"
  end
end