class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    @mechanics_working = AmusementPark.mechanics_on_the_job(@park)
  end
end
