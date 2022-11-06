require 'rails_helper'

RSpec.describe 'Mechanics' do
  before(:each) do
    @park1 = AmusementPark.create!(name: 'Foo Park')
    @mechanic = Mechanic.create!(name: 'Foo Bar', years_experience: 1)
    @ride1 = @park1.rides.create!(name: 'FooRide', thrill_rating: 1, open: false)
    @ride2 = @park1.rides.create!(name: 'BarRide', thrill_rating: 2, open: false)

    @mechanic.rides << @ride1
  end

  describe "#show" do
    it 'lists mechanic details' do
      visit "/mechanics/#{@mechanic.id}"
      expect(page).to have_content(@mechanic.name)
      expect(page).to have_content(@mechanic.years_experience)
      @mechanic.rides.each do |ride|
        expect(page).to have_content(ride.name)
      end
    end

    it 'can add a ride to mechanic workload' do
      visit "/mechanics/#{@mechanic.id}"
      fill_in "ride_id",	with: @ride2.id
      click_button('add job')
      expect(current_path).to eq("/mechanics/#{@mechanic.id}")
      expect(page).to have_content(@ride2.name)
    end

  end

end