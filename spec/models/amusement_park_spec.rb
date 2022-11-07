require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end
  
  before :each do
    @mechanic = Mechanic.create!(name: 'Jim', years_experience: 5)
    @mike = Mechanic.create!(name: 'Mike', years_experience: 9)
    @adam = Mechanic.create!(name: 'Adam', years_experience: 3)
    @six_flags = AmusementPark.create!(name: 'Six Flags Great America', admission_cost: 20)
    @dejavu = @six_flags.rides.create!(name: 'DeJaVu', thrill_rating: 9, open: false)
    @raging_bull = @six_flags.rides.create!(name: 'Raging Bull', thrill_rating: 10, open: true)
    @dark_knight = @six_flags.rides.create!(name: 'Dark Knight', thrill_rating: 6, open: true)
    
    @mechanic.rides << @dejavu
    @mechanic.rides << @raging_bull
    @mike.rides << @raging_bull
  end
  
  describe 'instance methods' do
    it "#unique_mechanics returns unique mechanics that work on a ride
    belonging to the Amusement Park" do
      expect(@six_flags.unique_mechanics).to eq([@mechanic, @mike])
    end
    
    xit "#mech_avg_yrs_exp returns the average years of experience for
    mechanics of a ride" do
      expect(@six_flags.mech_avg_yrs_exp).to eq(@raging_bull, @dejavu)
    end
  end
end