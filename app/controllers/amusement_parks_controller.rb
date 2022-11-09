class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
    @mechanics = @amusement_park.mechanics_list
    @rides = @amusement_park.rides_by_average_mechanics_experience
  end
end