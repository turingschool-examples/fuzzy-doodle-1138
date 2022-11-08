class AmusementParksController < ApplicationController

  def show
    @amusement_park = AmusementPark.find(params[:amusement_park_id])
    @rides = Ride.all
  end
end