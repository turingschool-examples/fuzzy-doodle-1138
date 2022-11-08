class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    # require 'pry'; binding.pry
  end

end