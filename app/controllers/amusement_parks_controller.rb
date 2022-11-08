class AmusementParksController < ApplicationController 

  def show 
    @amusementpark = AmusementPark.find(params[:id])
  end
end