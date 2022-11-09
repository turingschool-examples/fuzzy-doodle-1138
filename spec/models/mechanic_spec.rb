require "rails_helper"


RSpec.describe(Mechanic, type: :model) do
  describe("relationships") do
    it { should(have_many(:rides)) }
    it { should(have_many(:mechanic_rides)) }
    it { should(have_many(:rides).through(:mechanic_rides)) }
  end

  describe("class method") do
    it(".average_experience") do
      @six_flags = AmusementPark.create!(      name: "Six Flags",       admission_cost: 75)
      @hurler = @six_flags.rides.create!(      name: "The Hurler",       thrill_rating: 7,       open: true)
      @scrambler = @six_flags.rides.create!(      name: "The Scrambler",       thrill_rating: 4,       open: true)
      @ferris = @six_flags.rides.create!(      name: "Ferris Wheel",       thrill_rating: 7,       open: false)
      @mec1 = Mechanic.create!(      name: "Alex",       years_experience: 1)
      @mec2 = Mechanic.create!(      name: "Milo",       years_experience: 3)
      @mec3 = Mechanic.create!(      name: "Bolt",       years_experience: 10)
      @mec1_ride1 = MechanicRide.create!(      mechanic: @mec1,       ride: @hurler)
      @mec1_ride3 = MechanicRide.create!(      mechanic: @mec1,       ride: @ferris)
      @mec2_ride2 = MechanicRide.create!(      mechanic: @mec2,       ride: @scrambler)
      @mec3_ride3 = MechanicRide.create!(      mechanic: @mec3,       ride: @ferris)
      expect(Mechanic.average_experience.to_i).to(eq(4))
    end
  end
end
