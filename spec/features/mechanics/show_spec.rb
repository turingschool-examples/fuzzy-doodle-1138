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
        #  save_and_open_page
        within("#information") do
          expect(page).to have_content("Name: Kara Smith")
          expect(page).to have_content("Years of Experience: 11")
        end

        within("#ride-#{@ride.id}") do
          expect(page).to have_content("The Hurler")
        end

      end

      it "I see a form to add a ride to their workload" do
        visit "/mechanics/#{@mechanic.id}"

        within("#add_ride") do
          expect(page).to have_content("Add a ride to workload:")
          expect(page).to have_content("Ride id")
          expect(page).to have_field(:ride_id)
          expect(page).to have_button("Submit")
        end

      end

      describe "When I fill in that with an id of an existing ride and click Submit" do
        it "Im taken back to that mechanic's show page and I see the name of that newly added ride on this mechanic's show page" do
          @ride2 = @amusement_park.rides.create!(name: "The Frog Hopper", thrill_rating: 5, open: false)
          visit "/mechanics/#{@mechanic.id}"
          # save_and_open_page

          within("#add_ride") do
            fill_in(:ride_id, with: @ride2.id)
            click_button("Submit")
          end

          expect(current_path).to eq("/mechanics/#{@mechanic.id}")
          expect(@mechanic.rides.count).to eq(2)
          # save_and_open_page
          within("#ride-#{@ride2.id}") do
            expect(page).to have_content("The Frog Hopper")
          end

        end
      end
    end
  end
end
