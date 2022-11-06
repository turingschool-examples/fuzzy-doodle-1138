require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
  end
  describe "instance methods" do 
    before :each do 
        @disney = AmusementPark.create!(name: "Disney", admission_cost: 25)
        @wildwaves = AmusementPark.create!(name: "Wild Waves", admission_cost: 40)

        @coaster = @disney.rides.create!(name: "Classic Coaster", thrill_rating: 4, open: true)
        @whirl = @disney.rides.create!(name: "Whirlwind", thrill_rating: 7, open: true)
        @spin = @disney.rides.create!(name: "Tea Cups", thrill_rating: 3, open: true)
        
        @scream = @wildwaves.rides.create!(name: "Extreme Scream", thrill_rating: 8, open: true)
        @splash = @wildwaves.rides.create!(name: "Splash Mountain", thrill_rating: 6, open: true)
        @pool = @wildwaves.rides.create!(name: "Wave Pool", thrill_rating: 2, open: false)

        @ashley = Mechanic.create!(name: "Ashley", years_experience: 4)
        @abdul = Mechanic.create!(name: "Abdul", years_experience: 2)
        @alex = Mechanic.create!(name: "Alex", years_experience: 1)
        @kristen = Mechanic.create!(name: "Kristen", years_experience: 3)

        @ashley_coaster = MechanicRide.create!(mechanic_id: @ashley.id, ride_id: @coaster.id)
        @ashley_whirl = MechanicRide.create!(mechanic_id: @ashley.id, ride_id: @whirl.id)
        @abdul_spin = MechanicRide.create!(mechanic_id: @abdul.id, ride_id: @spin.id)
        @alex_scream = MechanicRide.create!(mechanic_id: @alex.id, ride_id: @scream.id)
        @kristen_splash = MechanicRide.create!(mechanic_id: @kristen.id, ride_id: @splash.id)
        @kristen_pool = MechanicRide.create!(mechanic_id: @kristen.id, ride_id: @pool.id)  
    end 

    it ".park_mechanics" do 
        expect(@disney.park_mechanics).to eq([@ashley, @abdul])
    end
  end 
end