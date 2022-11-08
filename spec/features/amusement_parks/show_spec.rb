require 'rails_helper'

RSpec.describe 'the amusement park show page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "Cheerios Oats", years_experience: 1)
    @mechanic_3 = Mechanic.create!(name: "Lower Cholesterol", years_experience: 8)
    @mechanic_4 = Mechanic.create!(name: "Average Park", years_experience: 5)
    @park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @park_2 = AmusementPark.create!(name: "Seven Flags", admission_cost: 80)
    @ride_1 = @park_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride_2 = @park_1.rides.create!(name: "The Sleeper", thrill_rating: 1, open: true)
    @ride_3 = @park_1.rides.create!(name: "The Leaper", thrill_rating: 5, open: true)
    @ride_4 = @park_2.rides.create!(name: "The Reaper", thrill_rating: 10, open: false)

    RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_1)
    RideMechanic.create!(mechanic: @mechanic_1, ride: @ride_2)
    RideMechanic.create!(mechanic: @mechanic_2, ride: @ride_3)
    RideMechanic.create!(mechanic: @mechanic_3, ride: @ride_1)
  end
  it "displays the park's name and price of admissions" do
    visit "/amusement_parks/#{@park_1.id}"
    # save_and_open_page
    expect(page).to have_content("Amusement Park: #{@park_1.name}")
    expect(page).to have_content("Admission Cost: #{@park_1.admission_cost}")
  end
  it "a unique list of the names of all mechanics that are working on that park's rides" do
    visit "/amusement_parks/#{@park_1.id}"
    # save_and_open_page
    expect(page).to have_content("Amusement Park: #{@park_1.name}")
    expect(page).to have_content("Admission Cost: #{@park_1.admission_cost}")
    #is there a better way to test that the list of mechanics is unique?
    expect(page).to have_content("Mechanics Working:\n#{@mechanic_1.name}\n#{@mechanic_2.name}\n#{@mechanic_3.name}")
    # expect(page).to have_content(@mechanic_1.name)
    # expect(page).to have_content(@mechanic_2.name)
    # expect(page).to have_content(@mechanic_3.name)
    expect(page).to_not have_content(@mechanic_4.name)
  end
end
