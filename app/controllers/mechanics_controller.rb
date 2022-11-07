class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    mechanic.mechanic_rides.create!(mechanic_id: params[:id], ride_id: params[:ride].to_i)
    binding.pry
    redirect_to "/mechanics/#{mechanic.id}"
  end

end
