require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to :amusement_park }
    it {should have_many :mechanic_rides}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end
  before :each do 
    @park1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @spin = @park1.rides.create!(name: "Spin Around", thrill_rating: 5, open: true)
    @run = @park1.rides.create!(name: "Run", thrill_rating: 3, open: false)
    @coaster= @park1.rides.create!(name: "Coaster", thrill_rating: 8, open: true)
    @river = @park1.rides.create!(name: "Lazy River", thrill_rating: 2, open: false)
    @steve = Mechanic.create!(name: "Steve", years_experience: 4)
    @jim = Mechanic.create!(name: "Jim", years_experience: 8)
    @mary = Mechanic.create!(name: "Mary", years_experience: 6)
    MechanicRide.create!(mechanic: @steve, ride: @coaster)
    MechanicRide.create!(mechanic: @steve, ride: @river)
    MechanicRide.create!(mechanic: @jim, ride: @spin)

  end
  it 'can return a unique list of mechanics working on the parks rides' do 
    # require 'pry'; binding.pry
    expect(@park1.unique_mechanics).to eq([@steve, @jim])
  end
end