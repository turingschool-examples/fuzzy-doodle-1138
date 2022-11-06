require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  before(:each) do
    @park1 = AmusementPark.create!(name: 'Foo Park', admission_cost: 100000)
    @mechanic = Mechanic.create!(name: 'Foo Bar', years_experience: 1)
    @ride1 = @park1.rides.create!(name: 'FooRide', thrill_rating: 1, open: false)
    @ride2 = @park1.rides.create!(name: 'BarRide', thrill_rating: 2, open: false)

    @mechanic.rides << @ride1
  end

  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'class methods' do
    it 'finds the mechanics working in that park' do
      result = AmusementPark.mechanics_on_the_job(@park1)
      result.each do |mechanic|
        expect(mechanic.mechanic_name).to eq(@mechanic.name)
      end
    end


  end

end