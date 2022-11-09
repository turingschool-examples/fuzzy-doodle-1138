require "rails_helper"

RSpec.describe "Amusement Park show page" do
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
    @ride_mechanic_1 = Ridemechanic.create!(mechanic: @mechanic_1, ride: @hurler)
    @ride_mechanic_2 = Ridemechanic.create!(mechanic: @mechanic_2, ride: @scrambler)

    visit "/amusement_parks/#{@six_flags.id}"
  end

  it "show price of admission for that amusement park" do
    expect(page).to have_content("Amusement Park Show Page")
    expect(page).to have_content("Name: #{@six_flags.name}")
    expect(page).to have_content("Cost: #{@six_flags.admission_cost}")
  end

  it "shows all name of mechanics working on ride" do
    expect(page).to have_content("Mechanics Working")
    expect(page).to have_content("Mechanic name: #{@mechanic_1.name}")
    expect(page).to have_content("Mechanic name: #{@mechanic_2.name}")
  end
end
