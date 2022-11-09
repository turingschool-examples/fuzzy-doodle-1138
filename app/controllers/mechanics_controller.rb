class MechanicsController < ApplicationController 
  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = Ride.all
  end

  def new
    MechanicRide.create(ride_id: params[:ride_id])
    @mechanic = Mechanic.find(params[:id])
    redirect_to mechanic_path(@mechanic)
  end
end