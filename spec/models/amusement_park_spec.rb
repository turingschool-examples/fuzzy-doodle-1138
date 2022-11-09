require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides)}
  end

  describe "methods" do
    before :each do
      @mechanic_1 = Mechanic.create!(name: "Shawn", years_exp: 5)
      @mechanic_2 = Mechanic.create!(name: "Lee", years_exp: 10)

      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

      @ride_mechanic_1 = Ridemechanic.create!(mechanic: @mechanic_1, ride: @hurler)
      @ride_mechanic_1 = Ridemechanic.create!(mechanic: @mechanic_1, ride: @hurler)
      @ride_mechanic_2 = Ridemechanic.create!(mechanic: @mechanic_2, ride: @scrambler)
    end

    it "can show unique mechanics" do
      expect(@six_flags.show_unique).to eq([@mechanic_1, @mechanic_2])
    end
  end
end
