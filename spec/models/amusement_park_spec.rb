require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'methods' do
    before :each do
      @sam = Mechanic.create!(name: "Sam", years_experience: 11)
      @abbas = Mechanic.create!(name: "Abbas", years_experience: 9)
      @third_wheel = Mechanic.create!(name: "Third Guy", years_experience: 9)
      @amusement_park = AmusementPark.create!(name: "Dreamland", admission_cost: 50)
      @amusement_park_2 = AmusementPark.create!(name: "Wonderland", admission_cost: 50)
      @ride_1 = @amusement_park.rides.create!(name: "Barf-a-lot", thrill_rating: 10, open: true)
      @ride_2 = @amusement_park.rides.create!(name: "Merry Go Round", thrill_rating: 10, open: false)
      @ride_3 = @amusement_park.rides.create!(name: "Gummi Coaster", thrill_rating: 8, open: true)
      @ride_4 = @amusement_park_2.rides.create!(name: "House of Heartless", thrill_rating: 6, open: false)
      @ride_5 = @amusement_park_2.rides.create!(name: "Blackpearl", thrill_rating: 7, open: true)
      @sam.rides << @ride_1
      @sam.rides << @ride_2
      @abbas.rides << @ride_3
      @sam.rides << @ride_4
      @third_wheel.rides << @ride_5
    end

    describe '#mechanics_list' do
      it 'returns a list of the mechanics(distinct) that work for an amusement park' do
        expect(@amusement_park.mechanics_list).to include(@sam, @abbas)
        expect(@amusement_park.mechanics_list.length).to eq(2)
      end
    end
  end
end