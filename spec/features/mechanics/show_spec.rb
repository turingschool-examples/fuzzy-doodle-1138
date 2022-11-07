require 'rails_helper'

RSpec.describe 'Mechanics Show Page', type: :feature do 
  describe 'when a user visits show page' do 
    before :each do 
      @park1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
      @spin = @park1.rides.create!(name: "Spin Around", thrill_rating: 5, open: true)
      @coaster= @park1.rides.create!(name: "Coaster", thrill_rating: 8, open: true)
      @river = @park1.rides.create!(name: "Lazy River", thrill_rating: 2, open: false)
      @steve = Mechanic.create!(name: "Steve", years_experience: 4)
      @jim = Mechanic.create!(name: "Jim", years_experience: 8)
      @mary = Mechanic.create!(name: "Mary", years_experience: 6)
      MechanicRide.create!(mechanic: @steve, ride: @coaster)
      MechanicRide.create!(mechanic: @steve, ride: @river)
      MechanicRide.create!(mechanic: @jim, ride: @spin)

    end
    it 'i see name, years experience, and names of all rides they are working on' do 
      visit amusement_park_mechanic_path(@park1, @steve)
      expect(page).to have_content("Name: Steve")
      expect(page).to have_content("Years of Experience: 4")
      expect(page).to have_content("Rides Steve is working on: Coaster Lazy River")
      expect(page).to_not have_content("Rides Steve is working on: Spin Around")

    end
  end
end