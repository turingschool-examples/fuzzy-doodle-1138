require 'rails_helper'

RSpec.describe Ride, type: :model do
  let!(:nintendo) {AmusementPark.create!(name: 'Nintendo World', admission_cost: 130)}
  
  let!(:yoshi) {nintendo.rides.create!(name: "Yoshi's Adventure", thrill_rating: 0, open: true)}
  let!(:koopa) {nintendo.rides.create!(name: "Koopa's Challenge", thrill_rating: 1, open: true)}
  let!(:bowser) {nintendo.rides.create!(name: "Bowser Shadow Showdown", thrill_rating: 3, open: false)}

  let!(:naomi) {Mechanic.create!(name: 'Naomi', years_experience: 5)}
  let!(:khaela) {Mechanic.create!(name: 'Khaela', years_experience: 11)}
  let!(:tyler) {Mechanic.create!(name: 'Tyler', years_experience: 3)}

  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'class methods' do
    describe '#ordered_average_experience' do
      it 'returns the average years of experience for all mechanics' do
        MechanicRide.create!(mechanic: naomi, ride: yoshi)
        MechanicRide.create!(mechanic: naomi, ride: bowser)
        MechanicRide.create!(mechanic: khaela, ride: koopa)
        MechanicRide.create!(mechanic: khaela, ride: yoshi)
        
        expect(Ride.ordered_average_experience.first.name).to eq(koopa.name)
        expect(Ride.ordered_average_experience.second.name).to eq(yoshi.name)
        expect(Ride.ordered_average_experience.third.name).to eq(bowser.name)
      end
    end
  end
end