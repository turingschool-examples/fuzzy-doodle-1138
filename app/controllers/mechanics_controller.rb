class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    @mechanic = Mechanic.find(params[:id])
    @ride = Ride.find(params[:ride_id])
    MechanicRide.create!(    mechanic: @mechanic,     ride: @ride)
    redirect_to("/mechanics/#{@mechanic.id}")
  end
end
