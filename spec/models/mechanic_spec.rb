require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "instance methods" do 
    describe "#add_ride" do 
      it "adds a ride to the mechanic's list of rides" do 
        park = AmusementPark.create!(name: "Six Flags", admission_cost: 25)
        sizzler = park.rides.create!(name: "Sizzler", thrill_rating: 2, open: true)
        swings = park.rides.create!(name: "Swings", thrill_rating: 1, open: true)
        boat = park.rides.create!(name: "Pharoahs Boat", thrill_rating: 4, open: true)
        mechanic = Mechanic.create!(name: "Haku Dog", years_experience: 3)
        RideMechanic.create!(mechanic: mechanic, ride: sizzler)

        expect(mechanic.rides).to eq([sizzler])

        mechanic.add_ride(swings.id)
        mechanic.add_ride(boat.id)
        mechanic.reload 

        expect(mechanic.rides).to eq([sizzler, swings, boat])
      end
    end
  end
end