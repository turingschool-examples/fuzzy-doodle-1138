require 'rails_helper'

RSpec.describe 'the mechanic show page' do
  it "displays the mechanic's name, years of experience, and the names of all rides they are working on" do
    mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    ride_1 = park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    ride_2 = park.rides.create!(name: "The Sleeper", thrill_rating: 1, open: true)
    ride_3 = park.rides.create!(name: "The Leaper", thrill_rating: 5, open: true)

    RideMechanic.create!(mechanic: mechanic, ride: ride_1)
    RideMechanic.create!(mechanic: mechanic, ride: ride_2)

    visit "/mechanics/#{mechanic.id}"
    save_and_open_page
    expect(page).to have_content("Name: #{mechanic.name}")
    expect(page).to have_content("Years of Experience: #{mechanic.years_experience}")
    expect(page).to have_content("The Hurler")
    expect(page).to have_content("The Sleeper")
    expect(page).to_not have_content("The Leaper")
  end
end
