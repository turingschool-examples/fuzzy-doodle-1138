require "rails_helper"


RSpec.describe("AmusementPark Show page") do
  before(:each) do
    @six_flags = AmusementPark.create!(    name: "Six Flags",     admission_cost: 75)
    @hurler = @six_flags.rides.create!(    name: "The Hurler",     thrill_rating: 7,     open: true)
    @scrambler = @six_flags.rides.create!(    name: "The Scrambler",     thrill_rating: 4,     open: true)
    @ferris = @six_flags.rides.create!(    name: "Ferris Wheel",     thrill_rating: 7,     open: false)
    @mec1 = Mechanic.create!(    name: "Alex",     years_experience: 1)
    @mec2 = Mechanic.create!(    name: "Milo",     years_experience: 3)
    @mec3 = Mechanic.create!(    name: "Bolt",     years_experience: 2)
    @mec1_ride1 = MechanicRide.create!(    mechanic: @mec1,     ride: @hurler)
    @mec1_ride3 = MechanicRide.create!(    mechanic: @mec1,     ride: @ferris)
    @mec2_ride2 = MechanicRide.create!(    mechanic: @mec2,     ride: @scrambler)
    @mec3_ride3 = MechanicRide.create!(    mechanic: @mec3,     ride: @ferris)
  end

  describe(" I see a list of all of the park's rides,") do
    describe("And next to the ride name I see the average experience of the mechanics working on the ride,") do
      it("And I see the list of rides is ordered by the average experience of mechanics working on the ride.") do
        visit(amusement_park_path(@six_flags))
      end
    end
  end
end
