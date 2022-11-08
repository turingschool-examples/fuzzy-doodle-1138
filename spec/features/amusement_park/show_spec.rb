require "rails_helper"

RSpec.describe "Amusement Park Show Page" do

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
    @mechanic_4 = Mechanic.create!(name: "New Person", experience: 0)

    @ride_mechanic_1 = RideMechanic.create!(ride: @hurler, mechanic: @mechanic_1)
    @ride_mechanic_2 = RideMechanic.create!(ride: @hurler, mechanic: @mechanic_2)
    @ride_mechanic_3 = RideMechanic.create!(ride: @scrambler, mechanic: @mechanic_1)
    @ride_mechanic_4 = RideMechanic.create!(ride: @scrambler, mechanic: @mechanic_2)
    @ride_mechanic_5 = RideMechanic.create!(ride: @scrambler, mechanic: @mechanic_3)
    @ride_mechanic_6 = RideMechanic.create!(ride: @ferris, mechanic: @mechanic_2)
    @ride_mechanic_7 = RideMechanic.create!(ride: @ferris, mechanic: @mechanic_3)
    @ride_mechanic_8 = RideMechanic.create!(ride: @jaws, mechanic: @mechanic_2)
  end

  it "has the name and price of admissions for the specified amusement park" do
    visit "/amusement_park/#{@six_flags.id}"

    within("#park") do
      expect(page).to have_content(@six_flags.name)
      expect(page).to have_content(@six_flags.admission_cost)
    end
  end

  it "shows the names of all of the mechanics working on rides that the park has, and the
    name list is unique" do
    visit "/amusement_park/#{@six_flags.id}"

    within("#park-mechanics") do
      expect(page).to have_content(@mechanic_1.name, count: 1)
      expect(page).to have_content(@mechanic_2.name, count: 1)
      expect(page).to have_content(@mechanic_3.name, count: 1)
      expect(page).to have_no_content(@mechanic_4.name)
    end
  end
end