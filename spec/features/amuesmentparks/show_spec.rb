require 'rails_helper'

RSpec.describe '/amuesmentparks/show' do
  before :each do
    @carowinds = AmusementPark.create!(name: 'Carowinds', admission_cost: 5)

    @ride1 = Ride.create!(name: 'Intimidator', thrill_rating: 9, open: true, amusement_park_id: @carowinds.id)
    @ride2 = Ride.create!(name: 'Top Gun', thrill_rating: 7, open: true, amusement_park_id: @carowinds.id)
    @ride3 = Ride.create!(name: 'Borg', thrill_rating: 8, open: true, amusement_park_id: @carowinds.id)

    @mechanic = Mechanic.create!(name: 'William', years_experience: 1)

    @mr1 = MechanicRide.create!(ride_id: @ride1.id, mechanic_id: @mechanic.id)
    @mr2 = MechanicRide.create!(ride_id: @ride2.id, mechanic_id: @mechanic.id)
    @mr3 = MechanicRide.create!(ride_id: @ride3.id, mechanic_id: @mechanic.id)

  end
  it 'lists name and admissions for park, lists all unique mechanics' do
    
  end
end