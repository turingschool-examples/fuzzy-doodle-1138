class RideMechanicsController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    mechanic.add_ride(params[:ride_id])

    redirect_to mechanic_path(mechanic)
  end
end