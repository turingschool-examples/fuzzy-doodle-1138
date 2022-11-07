require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
  end
  before(:each) do
    @machanic_1 = Machanic.create!(name: "John", years_experience: 2)
    @machanic_2 = Machanic.create!(name: "Jake", years_experience: 4)
    @machanic_3 = Machanic.create!(name: "Sally", years_experience: 10)

    @park_1 = AmusementPark.create!(name: "Wisney Dorld", admission_cost: 900)
    @park_2 = AmusementPark.create!(name: "Local Studeo", admission_cost: 500)

    @ride_1 = @park_1.rides.create!(name: 'Thunder Dome', thrill_rating: 7, open: true)
    @ride_2 = @park_1.rides.create!(name: 'New Ride', thrill_rating: 2, open: true)
    @ride_3 = @park_1.rides.create!(name: 'Not on list', thrill_rating: 99, open: true)
    @ride_4 = @park_2.rides.create!(name: 'Different Park', thrill_rating: 1, open: true)

    @machanic_1.rides << @ride_1
    @machanic_1.rides << @ride_2

    @machanic_2.rides << @ride_1
    @machanic_2.rides << @ride_3

    @machanic_3.rides << @ride_4
  end
  describe 'instance methods' do
    describe '#machanics_at_park' do
      it 'returns an arry of distinct names of machanics working at a given park' do
        expect(@park_1.machanics_at_park).to eq(["Jake", "John"])
      end
    end
    describe '#rides_and_mechs' do
      it 'returns an array of rides and average years of experience of workers working on that ride' do
        expect(@park_1.rides_and_mechs).to eq([@ride_3, @ride_1, @ride_2])
        expect(@park_1.rides_and_mechs[0].avg_exp).to eq(4)
        expect(@park_1.rides_and_mechs[-1].avg_exp).to eq(2)
      end
    end
  end
end