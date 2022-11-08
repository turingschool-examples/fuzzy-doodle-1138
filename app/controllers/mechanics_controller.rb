class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides
  end

  def new 
    RideMechanic.create(ride_id: params[:ride], mechanic_id: params[:id]) #able to call through to ride id  and mechanic id
    redirect_to "/mechanics/#{params[:id]}"
  end
end