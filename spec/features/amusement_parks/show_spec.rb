require 'rails_helper'

RSpec.feature "Amusement Park Show Page", type: :feature do
  describe 'when visiting the page' do
    before :each do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

      @kara = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
      @ted = Mechanic.create!(name: 'Ted Redd', years_experience: 6)
      @maria = Mechanic.create!(name: 'Maria Black', years_experience: 8)

      @mechanic_ride_1 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @hurler.id)
      @mechanic_ride_2 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @scrambler.id)
      @mechanic_ride_3 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @jaws.id)
      @mechanic_ride_4 = MechanicRide.create!(mechanic_id: @ted.id, ride_id: @ferris.id)
      @mechanic_ride_5 = MechanicRide.create!(mechanic_id: @maria.id, ride_id: @jaws.id)
    end
    it 'displays the name and admission price of the amusement park' do
      visit amusement_park_path(@six_flags)

      expect(page).to have_content('Six Flags')
      expect(page).to have_content('Admission cost: $75')
    end
    it 'has the names of all mechanics working on the rides of that park with no repeats' do
      visit amusement_park_path(@six_flags)

  
      expect(page).to have_content('Kara Smith', count: 1)
      expect(page).to have_content('Ted Redd'), count: 1
    end
  end
end
