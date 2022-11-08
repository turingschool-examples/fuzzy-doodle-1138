class RideMechanicsController < ApplicationController

  def update
    @ride = Ride.find(params[:ride_id])
    @mechanic = Mechanic.find(params[:mechanic_id])

    @ride_mechanic = RideMechanic.create!(ride: @ride, mechanic: @mechanic)
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end