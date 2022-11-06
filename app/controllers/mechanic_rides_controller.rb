class MechanicRidesController < ApplicationController
  def create 
    @mechanic = Mechanic.find(params[:id])
    @mechanic_ride = MechanicRide.create!(ride_id: mech_ride_params[:ride_id], mechanic_id: @mechanic.id) #need mechanic and ride id..?
     
    redirect_to "/mechanics/#{@mechanic.id}" #get me back to where I need to go! 
  end

  private
  def mech_ride_params
    params.permit(:ride_id, :id) #tying the mechanics and the ride together, methinks...???!?!??!?? 
  end #but what is actually happening here. hmmm.
end