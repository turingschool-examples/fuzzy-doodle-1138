require 'rails_helper'

RSpec.describe "the mechanic's show page" do
  before :each do
    @sam = Mechanic.create!(name: "Sam", years_experience: 11)
    @abbas = Mechanic.create!(name: "Abbas", years_experience: 9)
    @amusement_park = AmusementPark.create!(name: "Dreamland", admission_cost: 50)
    @ride_1 = @amusement_park.rides.create!(name: "Barf-a-lot", thrill_rating: 10, open: true)
    @ride_2 = @amusement_park.rides.create!(name: "Merry Go Round", thrill_rating: 10, open: false)
    @ride_3 = @amusement_park.rides.create!(name: "Gummi Coaster", thrill_rating: 8, open: true)
    @ride_4 = @amusement_park.rides.create!(name: "House of Heartless", thrill_rating: 6, open: false)
    @ride_5 = @amusement_park.rides.create!(name: "Blackpearl", thrill_rating: 7, open: true)
    @sam.rides << @ride_1
    @sam.rides << @ride_2
    @abbas.rides << @ride_3
  end

  it "lists the mechanic's name, years of experience, and the names of the rides they are working on " do
    visit mechanic_path(@sam)

    expect(page).to have_content("Mechanic: Sam")
    expect(page).to have_content("Years of Experience: 11")
    expect(page).to have_content("Rides Working On:")
    expect(page).to have_content("Merry Go Round")
    expect(page).to have_content("Barf-a-lot")
    expect(page).to_not have_content("Abbas")
    expect(page).to_not have_content("Gummi Coaster")
  end

  it "has a field and a button to add a ride to a mechanic" do
    visit mechanic_path(@sam)
    
    expect(page).to have_content("Add a ride to workload:")
    expect(page).to have_selector(:css, "form")
    expect(page).to have_field("mechanic_ride_id")
    
    fill_in "mechanic_ride_id", with: "#{@ride_4.id}"
    click_on "Submit"

    expect(current_path).to eql(mechanic_path(@sam))
    expect(page).to have_content("House of Heartless")
  end
end