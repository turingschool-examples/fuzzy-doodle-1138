require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before(:each) do
    @park_1 = AmusementPark.create!(name: 'Cedar Point', admission_cost: 32)
    @park_2 = AmusementPark.create!(name: 'Six Flags', admission_cost: 28)
    
    @mechanic_1 = Mechanic.create!(name: 'Abdul Redd', years_experience: 17)
    @mechanic_2 = Mechanic.create!(name: 'Chris Simmons', years_experience: 12)
    @mechanic_3 = Mechanic.create!(name: 'Erin Pintozzi', years_experience: 5)
    
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

  describe 'show page' do
    it 'shows the name, price of admission, unique list mechanics names' do
      visit "/amusement_parks/#{@park_1.id}"

      expect(page).to have_content(@park_1.name)
      expect(page).to have_content(@park_1.admission_cost)

      within("#mechanics") do
        expect(page).to have_content(@mechanic_1.name)
        expect(page).to have_content(@mechanic_2.name)
        expect(page).to_not have_content(@mechanic_3.name)
      end
    end
  end
end