require 'rails_helper'

RSpec.describe "Amusement Park Show page" do

  before :each do
    @amusement_park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride = @amusement_park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    MechanicRide.create!(ride: @ride, mechanic: @mechanic)
  end

  describe "As a visitor," do
    describe "When I visit an amusement parks show page," do
      it "Then I see the name and price of admissions for that amusement park" do
        visit "/amusement_parks/#{@amusement_park.id}"
        # save_and_open_page
        expect(page).to have_content(@amusement_park.name)
        expect(page).to have_content("Admission Price: $#{@amusement_park.admission_cost}")
      end

      it "And I see the names of all mechanics that are working on that park's rides, and I see that the list of mechanics is unique" do
        visit "/amusement_parks/#{@amusement_park.id}"
        # save_and_open_page
        within("#mechanic-#{@mechanic.id}") do
          expect(page).to have_content(@mechanic.name)
        end
      end
    end
  end
end
