require 'rails_helper'

RSpec.describe 'the mechanic show page' do
  before :each do
    @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride_1 = @park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride_2 = @park.rides.create!(name: "The Sleeper", thrill_rating: 1, open: true)
    @ride_3 = @park.rides.create!(name: "The Leaper", thrill_rating: 5, open: true)
    @ride_4 = @park.rides.create!(name: "The Reaper", thrill_rating: 10, open: false)

    RideMechanic.create!(mechanic: @mechanic, ride: @ride_1)
    RideMechanic.create!(mechanic: @mechanic, ride: @ride_2)
  end
  it "displays the mechanic's name, years of experience, and the names of all rides they are working on" do
    visit "/mechanics/#{@mechanic.id}"
    # save_and_open_page
    expect(page).to have_content("Mechanic: #{@mechanic.name}")
    expect(page).to have_content("Years of Experience: #{@mechanic.years_experience}")
    expect(page).to have_content("The Hurler")
    expect(page).to have_content("The Sleeper")
    expect(page).to_not have_content("The Leaper")
  end
  it "has a form to add a ride to their workload" do
    visit "/mechanics/#{@mechanic.id}"
    expect(page).to_not have_content(@ride_4.name)
    # save_and_open_page
    expect(page).to have_field('Ride ID:')
    fill_in :ride_id, with: "#{@ride_4.id}"
    click_button 'Submit'
    # save_and_open_page
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_4.name)
    expect(page).to_not have_content(@ride_3.name)
  end
end
