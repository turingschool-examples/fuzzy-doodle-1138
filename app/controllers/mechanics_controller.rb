class MechanicsController < ApplicationController 

  def show 
    binding.pry
    @mechanic = Mechanic.find(params[:id])
  end
end