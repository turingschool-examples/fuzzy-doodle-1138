require 'rails_helper'

RSpec.describe "Story 1 - Mechanic Show Page" do
  before(:each) do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
    
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @chris = Mechanic.create!(name: "Chris", yrs_of_experience: 7)
    @abdul = Mechanic.create!(name: "Abdul", yrs_of_experience: 9)
    @tom = Mechanic.create!(name: "Tom", yrs_of_experience: 3)
  
    @shift1 = RideMechanic.create!(ride_id: @jaws, mechanic_id: @chris)
    # require 'pry';binding.pry
  end

  it "displays the mechanic name, years of experience, and the names of all rides they are working on" do
    @chris.rides

    visit ("/mechanics/#{@chris.id}")
    require 'pry';binding.pry
    expect(page).to have_content("#{@chris.name}")
    expect(page).to have_content("#{@chris.yrs_of_experience}")
  end
end
