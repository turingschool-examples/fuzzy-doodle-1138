class MechanicsController < ApplicationController
  def show 
    @mechanic = Mechanic.find(params[:id])
  end

  def create 
    @mechanic = Mechanic.find(params[:id])
    if params[:ride_id]
      MechanicRide.create!(mechanic: @mechanic, ride: Ride.find(params[:ride_id]))
    end
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end