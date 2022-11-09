require 'rails_helper'

RSpec.describe 'Amusement_parks' do
  before(:each) do
    @park1 = AmusementPark.create!(name: 'Foo Park', admission_cost: 100000)
    @mechanic = Mechanic.create!(name: 'Foo Bar', years_experience: 1)
    @ride1 = @park1.rides.create!(name: 'FooRide', thrill_rating: 1, open: false)
    @ride2 = @park1.rides.create!(name: 'BarRide', thrill_rating: 2, open: false)

    @mechanic.rides << @ride1
  end

  describe '#show' do
    it 'has some behaviour' do
      visit "/amusement_parks/#{@park1.id}"
      expect(page).to have_content(@park1.name)
      expect(page).to have_content(@park1.admission_cost)
      expect(page).to have_content(@mechanic.name)
      save_and_open_page
    end
  end
end
