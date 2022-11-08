require 'rails_helper'

RSpec.feature "Mechanic Show Page", type: :feature do
  describe 'when visiting the page' do
    before :each do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

      @kara = Mechanic.create!(name: 'Kara Smith', years_experience: 11)

      @mechanic_ride_1 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @hurler.id)
      @mechanic_ride_2 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @scrambler.id)
      @mechanic_ride_3 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @jaws.id)
    end
    it 'displays the mechanic name, years of experience, and the names of all rides the mechanic is working on' do
      visit mechanic_path(@kara)

      expect(page).to have_content('Kara Smith')
      expect(page).to have_content('Years of experience: 11')
      expect(page).to have_content('The Hurler')
      expect(page).to have_content('The Scrambler')
      expect(page).to have_content('Jaws')
    end
  end
end
