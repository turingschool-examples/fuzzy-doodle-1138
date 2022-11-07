class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
    @machanics = @amusement_park.machanics_at_park
    @rides = @amusement_park.rides_and_mechs
  end
end