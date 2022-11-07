class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end
  
  def new
    mechanic = Mechanic.find(params[:id])
    if Ride.exists?(params[:add_ride_id])
      ride = Ride.find(params[:add_ride_id])
      mechanic.rides << ride
    else
      flash.alert = "Please enter a valid ride ID"
    end
    redirect_to mechanic_path(mechanic)
  end
end