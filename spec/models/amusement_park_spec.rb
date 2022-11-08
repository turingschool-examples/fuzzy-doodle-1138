require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:ride_mechanics).through(:rides) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  before :each do
    @six = AmusementPark.create!(name: 'Six Flags', admission_cost: 7500)
    @california = AmusementPark.create!(name: 'California Adventure', admission_cost: 12000)
    @goliath = @six.rides.create!(name: 'Goliath', thrill_rating: 5, open: true)
    @superman = @six.rides.create!(name: 'Superman', thrill_rating: 7, open: true)
    @viper = @six.rides.create!(name: 'Viper', thrill_rating: 9, open: true)
    @screamin = @california.rides.create!(name: 'California Screamin', thrill_rating: 4, open: true)
    @grizzly = @california.rides.create!(name: 'Grizzly River run', thrill_rating: 2, open: true)
    @galaxy = @california.rides.create!(name: 'Guardians of the Galaxy', thrill_rating: 6, open: true)
    @omar = Mechanic.create!(name: 'Omar Little', years_experience: 11)
    @stringer = Mechanic.create!(name: 'Stringer Bell', years_experience: 9)
    @jimmy = Mechanic.create!(name: 'Jimmy McNulty', years_experience: 7)
    @ride_mechanic1 = RideMechanic.create!(ride_id: @goliath.id, mechanic_id: @omar.id)
    @ride_mechanic2 = RideMechanic.create!(ride_id: @superman.id, mechanic_id: @omar.id)
    @ride_mechanic3 = RideMechanic.create!(ride_id: @viper.id, mechanic_id: @jimmy.id)
    @ride_mechanic3 = RideMechanic.create!(ride_id: @goliath.id, mechanic_id: @jimmy.id)
  end

  describe 'model methods' do
    describe '#unique_mechanics' do
      it 'returns a unique list of mechanics for a park' do
        expect(@six.unique_mechanics).to match([@omar, @jimmy])
      end
    end

    describe '#rides_sorted_by_exp' do
      it 'returns the rides at a park sorted by average experience of mechanics' do
        expect(@six.rides_sorted_by_exp).to match([@superman, @goliath, @viper])
      end
    end

  end

end