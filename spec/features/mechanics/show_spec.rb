require "rails_helper"

RSpec.describe "mechanics show page" do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Shawn", years_exp: 5)
    @mechanic_2 = Mechanic.create!(name: "Lee", years_exp: 10)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @ride_mechanic_1 = Ridemechanic.create!(mechanic: @mechanic_1, ride: @hurler)
    visit "/mechanics/#{@mechanic_1.id}"
  end

  it "shows mechanics name and years of exp" do
    expect(page).to have_content("Mechanic Show Page")
    expect(page).to have_content("Name: #{@mechanic_1.name}")
    expect(page).to have_content("Years_exp: #{@mechanic_1.years_exp}")
    expect(page).to_not have_content(@mechanic_2.name)
  end

  it "shows the ride the mechanic is working on" do
    expect(page).to have_content(@hurler.name)
  end

  it "has form add ride to workload" do
    fill_in :ride_id, with: @hurler.id
    click_button "Submit"
    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
    expect(page).to have_content(@hurler.name)
  end
end
