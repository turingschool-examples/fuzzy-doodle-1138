require "rails_helper"


RSpec.describe(AmusementPark, type: :model) do
  describe("relationships") do
    it { should(have_many(:rides)) }
  end

  describe("class method") do
    it(".mech names") do
      @six_flags = AmusementPark.create!(      name: "Six Flags",       admission_cost: 75)
      @universal = AmusementPark.create!(      name: "Universal Studios",       admission_cost: 80)
      @hurler = @six_flags.rides.create!(      name: "The Hurler",       thrill_rating: 7,       open: true)
      @scrambler = @six_flags.rides.create!(      name: "The Scrambler",       thrill_rating: 4,       open: true)
      @ferris = @six_flags.rides.create!(      name: "Ferris Wheel",       thrill_rating: 7,       open: false)
      @jaws = @universal.rides.create!(      name: "Jaws",       thrill_rating: 5,       open: true)
      @mec1 = Mechanic.create!(      name: "Alex",       years_experience: 1)
      @mec2 = Mechanic.create!(      name: "Milo",       years_experience: 3)
      @mec3 = Mechanic.create!(      name: "Bolt",       years_experience: 2)
      @mec4 = Mechanic.create!(      name: "Kit Kat",       years_experience: 5)
      @mec1_ride1 = MechanicRide.create!(      mechanic: @mec1,       ride: @hurler)
      @mec1_ride3 = MechanicRide.create!(      mechanic: @mec1,       ride: @ferris)
      @mec2_ride2 = MechanicRide.create!(      mechanic: @mec2,       ride: @scrambler)
      @mec3_ride3 = MechanicRide.create!(      mechanic: @mec3,       ride: @ferris)
      @mec4_ride4 = MechanicRide.create!(      mechanic: @mec4,       ride: @jaws)
      expect(@six_flags.mech_names).to(eq([@mec1, @mec2, @mec3]))
    end
  end
end
