require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  before(:each) do 
    @park = AmusementPark.create!(name: 'Fun World 6000', admission_cost: 0)

    @mechanic1 = Mechanic.create!(name: 'Mechanic Mike', years_experience: 50)
    @mechanic2 = Mechanic.create!(name: 'Mechanic Melinda', years_experience: 10)
    @mechanic3 = Mechanic.create!(name: 'Mechanic Martha', years_experience: 20)
    @mechanic4 = Mechanic.create!(name: 'Mechanic Molly', years_experience: 21000)

    @ride1 = @park.rides.create!(name: 'Tilt-O-Spin-O-Rama', thrill_rating: 7, open: true)
    @ride2 = @park.rides.create!(name: 'Vomitron', thrill_rating: 10, open: true) 
    @ride3 = @park.rides.create!(name: 'Feed the Ducks', thrill_rating: -10, open: true)

    RideMechanic.create!(ride: @ride1, mechanic: @mechanic1)
    RideMechanic.create!(ride: @ride2, mechanic: @mechanic2)
    RideMechanic.create!(ride: @ride2, mechanic: @mechanic3)
    RideMechanic.create!(ride: @ride3, mechanic: @mechanic1)
    RideMechanic.create!(ride: @ride3, mechanic: @mechanic2)
  end

  describe 'instance methods' do 
    describe '#unique_mechanics' do 
      it 'returns all unique mechanics working on a parks rides' do 
        expect(@park.unique_mechanics).to eq([@mechanic1, @mechanic2, @mechanic3])
      end
    end

    describe '#rides_by_mechanic_experience' do 
      it 'returns all rides ordered by average exp of mechanics working on them' do 
        expect(@park.rides_by_mechanic_experience).to eq([@ride1, @ride3, @ride2])
      end
    end
  end 
end