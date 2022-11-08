require "rails_helper"


RSpec.describe("Mechanic Show page") do
  before(:each) do
    @six_flags = AmusementPark.create!(    name: "Six Flags",     admission_cost: 75)
    @hurler = @six_flags.rides.create!(    name: "The Hurler",     thrill_rating: 7,     open: true)
    @scrambler = @six_flags.rides.create!(    name: "The Scrambler",     thrill_rating: 4,     open: true)
    @ferris = @six_flags.rides.create!(    name: "Ferris Wheel",     thrill_rating: 7,     open: false)
    @mec1 = Mechanic.create!(    name: "Alex",     years_experience: 1)
    @mec2 = Mechanic.create!(    name: "Milo",     years_experience: 3)
    @mec3 = Mechanic.create!(    name: "Bolt",     years_experience: 2)
    @mec1_ride1 = MechanicRide.create!(    mechanic: @mec1,     ride: @hurler)
    @mec2_ride2 = MechanicRide.create!(    mechanic: @mec2,     ride: @scrambler)
    @mec3_ride3 = MechanicRide.create!(    mechanic: @mec3,     ride: @ferris)
  end

  describe("mechanic show page") do
    it("I see their name, years of experience, and the names of all rides they are working on") do
      visit(mechanic_path(@mec1.id))
      expect(page).to(have_content("Name:#{@mec1.name}"))
      expect(page).to(have_content("Years experience:#{@mec1.years_experience}"))
      expect(page).to(have_content("Names of rides being worked on:#{@hurler.name}"))
    end
  end
end
