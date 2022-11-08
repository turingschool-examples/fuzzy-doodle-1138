require 'rails_helper'

RSpec.describe '/amusement_parks/show' do
  before :each do
    @carowinds = AmusementPark.create!(name: 'Carowinds', admission_cost: 5)

    @ride1 = Ride.create!(name: 'Intimidator', thrill_rating: 9, open: true, amusement_park_id: @carowinds.id)
    @ride2 = Ride.create!(name: 'Top Gun', thrill_rating: 7, open: true, amusement_park_id: @carowinds.id)
    @ride3 = Ride.create!(name: 'Borg', thrill_rating: 8, open: true, amusement_park_id: @carowinds.id)

    @mechanic1 = Mechanic.create!(name: 'William', years_experience: 2)
    @mechanic2 = Mechanic.create!(name: 'David', years_experience: 6)
    @mechanic3 = Mechanic.create!(name: 'Neel', years_experience: 4)


    @mr1 = MechanicRide.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
    @mr2 = MechanicRide.create!(ride_id: @ride2.id, mechanic_id: @mechanic1.id)
    @mr3 = MechanicRide.create!(ride_id: @ride3.id, mechanic_id: @mechanic2.id)

    @mr4 = MechanicRide.create!(ride_id: @ride1.id, mechanic_id: @mechanic2.id)
    @mr5 = MechanicRide.create!(ride_id: @ride2.id, mechanic_id: @mechanic3.id)
    @mr6 = MechanicRide.create!(ride_id: @ride3.id, mechanic_id: @mechanic3.id)

  end
  it 'lists name and admissions for park, lists all unique mechanics' do
    visit "/amusementparks/#{@carowinds.id}"
    save_and_open_page
  end
end