require 'rails_helper'

RSpec.describe 'AmusementParks Show Page', type: :feature do 
  describe 'when a user visits Amusement Park show page' do 
    before :each do 
      @park1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
      @spin = @park1.rides.create!(name: "Spin Around", thrill_rating: 5, open: true)
      @run = @park1.rides.create!(name: "Run", thrill_rating: 3, open: false)
      @coaster= @park1.rides.create!(name: "Coaster", thrill_rating: 8, open: true)
      @river = @park1.rides.create!(name: "Lazy River", thrill_rating: 2, open: false)
      @steve = Mechanic.create!(name: "Steve", years_experience: 4)
      @jim = Mechanic.create!(name: "Jim", years_experience: 8)
      @mary = Mechanic.create!(name: "Mary", years_experience: 6)
      MechanicRide.create!(mechanic: @steve, ride: @coaster)
      MechanicRide.create!(mechanic: @steve, ride: @river)
      MechanicRide.create!(mechanic: @jim, ride: @spin)

    end

    it 'i see name and price of admissions for that amusement park' do 
      visit amusement_park_path(@park1)
      expect(page).to have_content("Park Name: Six Flags")
      expect(page).to have_content("Admissions Price: $75")
      # require 'pry'; binding.pry


    end

    it 'i see names of all mechanics working on that parks rides and list is unique' do 
      visit amusement_park_path(@park1)
      expect(page).to have_content("Mechanics: Jim Steve")
      expect(page).to_not have_content("Mechanics: Mary")
      expect(page).to_not have_content("Mechanics: Jim Steve Steve")

    end
  end 
end 