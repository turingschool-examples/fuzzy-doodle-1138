require 'rails_helper'

RSpec.describe '/mechanics/show' do
  before :each do
    @carowinds = AmusementPark.create!(name: 'Carowinds', admission_cost: 5)

    @ride1 = Ride.create!(name: 'Intimidator', thrill_rating: 9, open: true, amusement_park_id: @carowinds.id)
    @ride2 = Ride.create!(name: 'Top Gun', thrill_rating: 7, open: true, amusement_park_id: @carowinds.id)
    @ride3 = Ride.create!(name: 'Borg', thrill_rating: 8, open: true, amusement_park_id: @carowinds.id)

    @mechanic = Mechanic.create!(name: 'William', years_experience: 1)

    @mr1 = MechanicRide.create!(ride_id: @ride1.id, mechanic_id: @mechanic.id)
    @mr2 = MechanicRide.create!(ride_id: @ride2.id, mechanic_id: @mechanic.id)
    @mr3 = MechanicRide.create!(ride_id: @ride3.id, mechanic_id: @mechanic.id)

    @ride4 = Ride.create!(name: 'Dropzone', thrill_rating: 8, open: true, amusement_park_id: @carowinds.id)
  end
  it 'has mechanic name, experience and names of rides they work on' do
    visit "/mechanics/#{@mechanic.id}"

    expect(page).to have_content('Name: William')
    expect(page).to have_content('Years of Experience: 1')
    expect(page).to have_content('Intimidator')
    expect(page).to have_content('Top Gun')
    expect(page).to have_content('Borg')
  end
  it 'can update rides from a text field' do
    visit "/mechanics/#{@mechanic.id}"

    fill_in :ride, with: @ride4.id
    click_on 'Update'
    save_and_open_page
    expect(page).to have_content('Dropzone')
  end
end
