class MechanicsController < ApplicationController 
  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = Ride.all
  end
end