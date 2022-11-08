class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end
  def update
    mechanic = Mechanic.find(params[:id])
    RideMechanic.create!(mechanic: mechanic, ride: Ride.find(params[:ride_id]))
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
