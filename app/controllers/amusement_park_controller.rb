class AmusementParkController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
    @mechanic = Mechanic.all
  end
end
