class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    @mechanic = Mechanic.find(params[:id])

    @mechanic.rides << Ride.find(params[:ride_id])

    redirect_to mechanic_path
  end
end
