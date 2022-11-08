require 'rails_helper'

RSpec.describe 'the mechanics show page' do
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

  it 'displays the name/years experiences/rides working on for a mechanic' do
    visit "/mechanics/#{@omar.id}"

    expect(page).to have_content("Name: #{@omar.name}")
    expect(page).to have_content("Years Experience: #{@omar.years_experience}")

    within "#rides_maintained" do
      expect(page).to have_content(@goliath.name)
      expect(page).to have_content(@superman.name)
      expect(page).to_not have_content(@viper.name)
    end
  end

  it 'has a form to add a ride to their workload' do
    visit "/mechanics/#{@omar.id}"

    within "add_ride_to_workload" do
      expect(page).to have_content('Add a ride to workload:')
      expect(page).to have_field('Ride Id:')
      expect(page).to have_button('Add Ride')
    end
  end
end