class MachanicsController < ApplicationController
  def show
    # binding.pry
    @machanic = Machanic.find(params[:id])
    @rides = @machanic.rides
  end
end