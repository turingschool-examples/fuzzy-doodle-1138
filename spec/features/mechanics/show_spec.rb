require 'rails_helper'

RSpec.describe 'the rails show page' do 
  before(:each) do 
    @park = AmusementPark.create!(name: 'Fun World 6000', admission_cost: 0)

    @mechanic = Mechanic.create!(name: 'Mechanic Mike', years_experience: 50)

    @ride1 = @park.rides.create!(name: 'Tilt-O-Spin-O-Rama', thrill_rating: 7, open: true)
    @ride2 = @park.rides.create!(name: 'Vomitron', thrill_rating: 10, open: true) 
    @ride3 = @park.rides.create!(name: 'Feed the Ducks', thrill_rating: -10, open: true)

    RideMechanic.create!(ride: @ride1, mechanic: @mechanic)
    RideMechanic.create!(ride: @ride2, mechanic: @mechanic)

    visit mechanic_path(@mechanic)
  end

  it 'lists mechanics attributes and rides they are working on' do 
    expect(page).to have_content(@mechanic.name)
    expect(page).to have_content(@mechanic.years_experience)
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to_not have_content(@ride3.name)
  end
end