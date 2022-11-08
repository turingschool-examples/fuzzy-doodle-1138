class RideMechanicsController < ApplicationController
  def create
    # require "pry"; binding.pry
    mechanic = Mechanic.find(params[:id])
    RideMechanic.create!(mechanic: mechanic, ride: Ride.find(params[:ride_id]))
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
