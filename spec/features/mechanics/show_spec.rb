require "rails_helper"

RSpec.describe "the Mechanic show page" do 
  before(:each) do 
    park = AmusementPark.create!(name: "Six Flags", admission_cost: 25)
    sizzler = park.rides.create!(name: "Sizzler", thrill_rating: 2, open: true)
    swings = park.rides.create!(name: "Swings", thrill_rating: 1, open: true)
    @boat = park.rides.create!(name: "Pharoahs Boat", thrill_rating: 4, open: true)

    @mechanic = Mechanic.create!(name: "Haku Dog", years_experience: 3)

    RideMechanic.create!(mechanic: @mechanic, ride: sizzler)
    RideMechanic.create!(mechanic: @mechanic, ride: swings)
  end
  describe "As a user, when I visit /mechanics/:id" do 
    it "displays their name, years of experience, and the names of all rides they are working on" do 
      visit mechanic_path(@mechanic)

      expect(page).to have_content("Name: Haku Dog")
      expect(page).to have_content("Years Experience: 3")
      within "#rides" do 
        expect(page).to have_content("Sizzler")
        expect(page).to have_content("Swings")
      end
    end

    it "shows a form to add a ride, when submitted, show page reloads where ride has been added" do 
      visit mechanic_path(@mechanic)

      expect(page).to have_content("Add a ride to workload:")
      expect(page).to have_field("ride_id")
      expect(page).to_not have_content("Pharoahs Boat")

      fill_in("ride_id", with: @boat.id)
      click_button("Submit")

      expect(current_path).to eq(mechanic_path(@mechanic))
      within "#rides" do 
        expect(page).to have_content("Sizzler")
        expect(page).to have_content("Swings")
        expect(page).to have_content("Pharoahs Boat")
      end
    end
  end
end