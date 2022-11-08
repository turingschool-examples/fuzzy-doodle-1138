require "rails_helper"

RSpec.describe "Mechanic Show Page" do

  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mechanic_1 = Mechanic.create!(name: "Mike Vueller", experience: 4)
    @mechanic_2 = Mechanic.create!(name: "Austin Shell", experience: 7)
    @mechanic_3 = Mechanic.create!(name: "Freida Moren", experience: 2)

    @ride_mechanic_1 = RideMechanic.create!(ride: @hurler, mechanic: @mechanic_1)
    @ride_mechanic_2 = RideMechanic.create!(ride: @hurler, mechanic: @mechanic_2)
    @ride_mechanic_3 = RideMechanic.create!(ride: @scrambler, mechanic: @mechanic_1)
    @ride_mechanic_4 = RideMechanic.create!(ride: @scrambler, mechanic: @mechanic_2)
    @ride_mechanic_5 = RideMechanic.create!(ride: @scrambler, mechanic: @mechanic_3)
    @ride_mechanic_6 = RideMechanic.create!(ride: @ferris, mechanic: @mechanic_2)
    @ride_mechanic_7 = RideMechanic.create!(ride: @ferris, mechanic: @mechanic_3)
    @ride_mechanic_8 = RideMechanic.create!(ride: @jaws, mechanic: @mechanic_2)
  end

  it "shows the mechanics name, years of experience and the names of all
    of the rides they are working on" do
      visit "/mechanics/#{@mechanic_1.id}"

      within("#mechanic") do
        expect(page).to have_content(@mechanic_1.name)
        expect(page).to have_content(@mechanic_1.experience)
        expect(page).to have_no_content(@mechanic_2.name)
      end

      within("#mechanic-rides") do
        expect(page).to have_content(@scrambler.name)
        expect(page).to have_content(@hurler.name)
        expect(page).to have_no_content(@jaws.name)
      end
    end

  it "has a form to add a ride to the specified mechanics work load" do
    visit "/mechanics/#{@mechanic_1.id}"

    within("#add_ride") do
      expect(page).to have_field("ride_id")
      expect(page).to have_button("Add Ride")
    end
  end

  it "when the field is filled in with a rides id, and the submit button is clicked, the used
    is taken back to the mechanic's show page and the new ride is on the mechanics who page" do
      visit "/mechanics/#{@mechanic_1.id}"

      within("#mechanic-rides") do
        expect(page).to have_no_content(@jaws.name)
      end 

      fill_in :ride_id, with: @jaws.id
      click_button "Add Ride"

      expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
      
      within("#mechanic-rides") do
        expect(page).to have_content(@jaws.name)
      end 
  end
end