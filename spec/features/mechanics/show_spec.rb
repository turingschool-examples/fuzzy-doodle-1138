require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before(:each) do
    @park_1 = AmusementPark.create!(name: 'Cedar Point', admission_cost: 32)
    
    @mechanic_1 = Mechanic.create!(name: 'Abdul', years_experience: 17)
    @mechanic_2 = Mechanic.create!(name: 'Chris', years_experience: 12)
    
    @ride_1 = Ride.create!(name: 'Blue Streak', thrill_rating: 6, open: false, amusement_park_id: @park_1.id)
    @ride_2 = Ride.create!(name: 'Dragster', thrill_rating: 10, open: true, amusement_park_id: @park_1.id)
    @ride_3 = Ride.create!(name: 'Tower of Terror', thrill_rating: 7, open: false, amusement_park_id: @park_1.id)
    @ride_4 = Ride.create!(name: 'Millennium Force', thrill_rating: 5, open: true, amusement_park_id: @park_1.id)
    @ride_5 = Ride.create!(name: 'Maverick', thrill_rating: 6, open: false, amusement_park_id: @park_1.id)
    @ride_6 = Ride.create!(name: 'Gemini', thrill_rating: 5, open: true, amusement_park_id: @park_1.id)
    @ride_7 = Ride.create!(name: 'Bumper Cars', thrill_rating: 1, open: true, amusement_park_id: @park_1.id)

    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_3)
    MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_4)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_1)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_5)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_6)
    MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_7)
  end
  
  it 'shows the mechanic name, years of experience and all rides they are working on' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    
    within("#mechanic_rides") do
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
      expect(page).to have_content(@ride_3.name)
      expect(page).to have_content(@ride_4.name)
    end

    expect(page).to_not have_content(@ride_5.name)
    expect(page).to_not have_content(@ride_6.name)
    expect(page).to_not have_content(@ride_7.name)
  end
end