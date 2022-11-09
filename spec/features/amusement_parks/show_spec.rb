require 'rails_helper'

RSpec.describe 'amusement park show page (/amusement_parks/:id)', type: :feature do
  describe 'as a visitor' do
    describe 'when I visit an amusement parks show page' do
      before :each do
        @flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
        @white_water = AmusementPark.create!(name: "White Water", admission_cost: 40)

        @rupert = Mechanic.create!(name: "Rupert Denali", years_experience: 30)
        @kara = Mechanic.create!(name: "Kara Smith", years_experience: 11)
        @larry = Mechanic.create!(name: "Larry Quinn", years_experience: 3)

        @frog = @flags.rides.create!(name: "The Frog Hopper", thrill_rating: 7, open: false)
        @farenheit = @flags.rides.create!(name: "Farenheit", thrill_rating: 9, open: true)
        @kiss = @flags.rides.create!(name: "The Kiss Raise", thrill_rating: 4, open: true)
        @slide = @white_water.rides.create!(name: "Slide", thrill_rating: 3, open: true)
        @river = @white_water.rides.create!(name: "Lazy River", thrill_rating: 1, open: false)

        @kara.rides << @frog
        @kara.rides << @farenheit
        @kara.rides << @kiss
        @larry.rides << @farenheit
        @larry.rides << @kiss 
        @rupert.rides << @river
        @kara.rides << @slide
      end

      it '- shows the name and price of admissions for that amusement park' do
        visit amusement_park_path(@white_water)

        expect(page).to have_content("Name: White Water")
        expect(page).to have_content("Admission Cost: $40")
      end

      xit '- shows the names of all mechanics that are working on that parks rides.
      the list of mechanics is unique to the park' do
        visit amusement_park_path(@white_water)

        within "#park-mechanics" do
          expect(page).to have_content(@rupert.name)
          expect(page).to have_content(@kara.name)
        end
      end
    end
  end
end