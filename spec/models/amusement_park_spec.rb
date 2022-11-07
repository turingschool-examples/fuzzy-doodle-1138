require 'rails_helper'

RSpec.describe AmusementPark, type: :model do

  before :each do
    @amusement_park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride = @amusement_park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    MechanicRide.create!(ride: @ride, mechanic: @mechanic)
  end

  describe 'relationships' do
    it { should have_many(:rides) }
    it {should have_many(:mechanics).through(:rides)}
  end
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:admission_cost)}
    it {should validate_numericality_of(:admission_cost)}
  end

  describe "instance methods" do
    describe "#park_mechanics" do
      it "lists all mechanics working on rides at the park" do
        expect(@amusement_park.park_mechanics).to eq([@mechanic])
      end
    end
  end
end
