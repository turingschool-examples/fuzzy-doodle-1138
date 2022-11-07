require 'rails_helper'

RSpec.describe 'the Amusement Park show page' do 
  before(:each) do 
    @park = AmusementPark.create!(name: 'Fun World 6000', admission_cost: 0)

    @mechanic1 = Mechanic.create!(name: 'Mechanic Mike', years_experience: 50)
    @mechanic2 = Mechanic.create!(name: 'Mechanic Melinda', years_experience: 10)
    @mechanic3 = Mechanic.create!(name: 'Mechanic Martha', years_experience: 20)

    @ride1 = @park.rides.create!(name: 'Tilt-O-Spin-O-Rama', thrill_rating: 7, open: true)
    @ride2 = @park.rides.create!(name: 'Vomitron', thrill_rating: 10, open: true) 
    @ride3 = @park.rides.create!(name: 'Feed the Ducks', thrill_rating: -10, open: true)

    RideMechanic.create!(ride: @ride1, mechanic: @mechanic1)
    RideMechanic.create!(ride: @ride2, mechanic: @mechanic2)
    RideMechanic.create!(ride: @ride2, mechanic: @mechanic3)
    RideMechanic.create!(ride: @ride3, mechanic: @mechanic1)
    RideMechanic.create!(ride: @ride3, mechanic: @mechanic2)

    visit amusement_park_path(@park)
  end

  it 'shows name of park and price of admissions' do 
    within '#title' do 
      expect(page).to have_content(@park.name)
      expect(page).to have_content(@park.admission_cost)
    end
  end

  it 'shows names of all mechanics working on each ride' do
    within "#mechanics" do 
      expect(page).to have_content(@mechanic1.name, count: 1)
      expect(page).to have_content(@mechanic2.name, count: 1)
      expect(page).to have_content(@mechanic3.name, count: 1)
    end
  end

  it 'shows all parks rides' do 
    within '#rides' do 
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
      expect(page).to have_content(@ride3.name)
    end
  end

  it 'shows avg experience of mechanics working on each ride' do 
    within "#ride-#{@ride1.id}" do 
      expect(page).to have_content('50 years')
    end
    within "#ride-#{@ride2.id}" do 
      expect(page).to have_content('15 years')
    end
    within "#ride-#{@ride3.id}" do 
      expect(page).to have_content('30 years')
    end
  end

  it 'orders rides by avg experience of mechanics' do 
    within '#rides' do 
      expect(@ride1.name).to appear_before(@ride3.name)
      expect(@ride3.name).to appear_before(@ride2.name)
      save_and_open_page
    end
  end
end