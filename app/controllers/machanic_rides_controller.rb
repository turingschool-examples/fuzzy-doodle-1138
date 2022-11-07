class MachanicRidesController < ApplicationController
  def create
    machanic_ride = MachanicRide.new(machanic_ride_params)
    machanic_ride.save

    redirect_to machanic_path(params[:machanic_id])
  end

  private
  def machanic_ride_params
    params.permit(:id, :ride_id, :machanic_id)
  end
end