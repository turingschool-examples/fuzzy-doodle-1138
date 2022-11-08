require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :admission_cost}
  end
  
  before(:each) do  
    @park_1 = AmusementPark.create!(name: 'Cedar Point', admission_cost: 32)
    @park_2 = AmusementPark.create!(name: 'Six Flags', admission_cost: 28)
    
    @mechanic_1 = Mechanic.create!(name: 'Abdul', years_experience: 17)
    @mechanic_2 = Mechanic.create!(name: 'Chris', years_experience: 12)
    @mechanic_3 = Mechanic.create!(name: 'Erin', years_experience: 5)
    
    @ride_1 = Ride.create!(name: 'Blue Streak', thrill_rating: 6, open: false, amusement_park_id: @park_1.id)
    @ride_2 = Ride.create!(name: 'Dragster', thrill_rating: 10, open: true, amusement_park_id: @park_1.id)
    @ride_3 = Ride.create!(name: 'Tower of Terror', thrill_rating: 7, open: false, amusement_park_id: @park_1.id)
    @ride_4 = Ride.create!(name: 'Millennium Force', thrill_rating: 5, open: true, amusement_park_id: @park_1.id)
    @ride_5 = Ride.create!(name: 'Maverick', thrill_rating: 6, open: false, amusement_park_id: @park_1.id)
    @ride_6 = Ride.create!(name: 'Gemini', thrill_rating: 5, open: true, amusement_park_id: @park_1.id)
    @ride_7 = Ride.create!(name: 'Bumper Cars', thrill_rating: 1, open: true, amusement_park_id: @park_1.id)
    @ride_8 = Ride.create!(name: 'Goliath', thrill_rating: 7, open: true, amusement_park_id: @park_2.id)

    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_4)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_5)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_6)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_7)
    MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_8)
  end

  describe 'instance methods' do
    describe '#list_mechanics' do
      it 'returns a unique list of mechanics for that park' do
        expect(@park_1.list_mechanics).to eq([@mechanic_1, @mechanic_2])
      end
    end
  end
end