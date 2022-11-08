class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides
  end

  def update
    mechanic = Mechanic.find(params[:id])
    mechanic.rides << Ride.find(params[:mechanic][:ride_id])

    redirect_to mechanic_path(mechanic)
  end
end