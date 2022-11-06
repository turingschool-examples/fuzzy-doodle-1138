class RideMechanicsController < ApplicationController
  def create
    @mechanic = Mechanic.find(params[:mechanic_id])
    @mechanic.rides << Ride.find(params[:ride_id])

    redirect_to "/mechanics/#{@mechanic.id}"
  end
end