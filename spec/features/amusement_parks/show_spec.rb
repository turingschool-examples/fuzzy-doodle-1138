require 'rails_helper'

RSpec.describe "the amusement park's show page" do
  before :each do
    @sam = Mechanic.create!(name: "Sam", years_experience: 11)
    @abbas = Mechanic.create!(name: "Abbas", years_experience: 9)
    @third_wheel = Mechanic.create!(name: "Third Guy", years_experience: 9)
    @amusement_park = AmusementPark.create!(name: "Dreamland", admission_cost: 50)
    @amusement_park_2 = AmusementPark.create!(name: "Wonderland", admission_cost: 50)
    @ride_1 = @amusement_park.rides.create!(name: "Barf-a-lot", thrill_rating: 10, open: true)
    @ride_2 = @amusement_park.rides.create!(name: "Merry Go Round", thrill_rating: 10, open: false)
    @ride_3 = @amusement_park.rides.create!(name: "Gummi Coaster", thrill_rating: 8, open: true)
    @ride_4 = @amusement_park_2.rides.create!(name: "House of Heartless", thrill_rating: 6, open: false)
    @ride_5 = @amusement_park_2.rides.create!(name: "Blackpearl", thrill_rating: 7, open: true)
    @sam.rides << @ride_1
    @sam.rides << @ride_2
    @abbas.rides << @ride_3
    @sam.rides << @ride_4
    @third_wheel.rides << @ride_5
  end

  it "lists the amusement park's name, admission price, and the names of the mechanics that work on the park's rides" do
    visit amusement_park_path(@amusement_park)

    expect(page).to have_content("Amusement Park: Dreamland")
    expect(page).to have_content("Admission Price: 50")
    expect(page).to have_content("Mechanics:")
    expect(page).to have_content("Sam", count: 1)
    expect(page).to have_content("Abbas")
  end

  it "lists the rides in the amusement park along with their respective mechanics' average work experience" do
    frodo = Mechanic.create!(name: "Sam", years_experience: 9)
    hamada = Mechanic.create!(name: "Sam", years_experience: 5)
    
    frodo.rides << @ride_1
    hamada.rides << @ride_3
    @sam.rides << @ride_5
    @abbas.rides << @ride_5
    
    visit amusement_park_path(@amusement_park)

    expect(page).to have_content("Rides:")
    expect(page).to have_content("Name: Gummi Coaster, Average Work Experience of Mehcanics: 7.0")
    expect(page).to have_content("Name: Merry Go Round, Average Work Experience of Mehcanics: 11.0")

    expect("Name: Gummi Coaster, Average Work Experience of Mehcanics: 7.0").to appear_before("Name: Barf-a-lot, Average Work Experience of Mehcanics: 10.0")
    expect("Name: Barf-a-lot, Average Work Experience of Mehcanics: 10.0").to appear_before("Name: Merry Go Round, Average Work Experience of Mehcanics: 11.0")
  end
end