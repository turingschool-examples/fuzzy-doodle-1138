require 'rails_helper'

RSpec.describe 'the amusement parks show page' do
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
  end

  it 'displays the name and price of admissions for that park' do
    visit "/amusement_parks/#{@six.id}"

    within "#amusement_park_info" do
      expect(page).to have_content("Park Name: #{@six.name}")
      expect(page).to have_content("Price of Admission: $75.00")
    end
  end
end