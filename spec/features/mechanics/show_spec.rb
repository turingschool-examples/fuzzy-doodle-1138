require 'rails_helper'

RSpec.describe 'mechanics show page (/mechanics/:id)' do
  describe 'as a user' do
    describe 'when I visit the mechanic show page' do
      before :each do
        @flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)

        @kara = Mechanic.create!(name: "Kara Smith", years_experience: 11)
        @larry = Mechanic.create!(name: "Larry Quinn", years_experience: 3)

        @frog = @flags.rides.create!(name: "The Frog Hopper", thrill_rating: 7, open: false)
        @farenheit = @flags.rides.create!(name: "Farenheit", thrill_rating: 9, open: true)
        @kiss = @flags.rides.create!(name: "The Kiss Raise", thrill_rating: 4, open: true)

        @kara.rides << @frog
        @kara.rides << @farenheit
        @kara.rides << @kiss
        @larry.rides << @farenheit
        @larry.rides << @kiss 
      end

      it '- shows their name, years of experience, and the names of all the rides they are working on' do
        visit mechanic_path()
      end
    end
  end
end
