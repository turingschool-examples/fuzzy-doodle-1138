# Story 1 - Mechanic Show Page

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they are working on
require 'rails_helper'

RSpec.describe "Mechanic Show Page" do

  before :each do
    @amusement_park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride = @amusement_park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    MechanicRide.create!(ride: @ride, mechanic: @mechanic)
  end

  describe "As a user" do
    describe "When I visit mechanic show page" do
      it "I see their name, years of experience, and the names of all rides they are working on" do
        visit "/mechanics/#{@mechanic.id}"
        # save_and_open_page
        within("#information") do
          expect(page).to have_content("Name: Kara Smith")
          expect(page).to have_content("Years of Experience: 11")
        end

        within("#ride-#{@ride.id}") do
          expect(page).to have_content("The Hurler")
        end

      end
    end
  end
end
