class MachanicsController < ApplicationController
  def show
    @machanic = Machanic.find(params[:id])
    @rides = @machanic.rides
    @machanic_ride = MachanicRide.new
  end
end