class MechanicRidesController < ApplicationController
  def create
    require "pry"

    binding.pry
    mechanic = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params[:id])
    MechanicRide.create!(    mechanic: mechanic,     ride: ride)
    redirect_to("/mechanics/(#{mechanic.id}")
  end
end
