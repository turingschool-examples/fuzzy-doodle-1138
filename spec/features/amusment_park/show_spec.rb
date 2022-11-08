require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    
    @coaster = Ride.create!(name: "big roller coaster", thrill_rating: 3, open: true, amusement_park_id: @six_flags.id)
    @john = Mechanic.create!(name: "John", years_experience: 12)
    @john_ride = MechanicRide.create!(mechanic_id: @john.id, ride_id: @ferris.id )
    @john_ride = MechanicRide.create!(mechanic_id: @john.id, ride_id: @hurler.id )
    @bill = Mechanic.create!(name: "Bill", years_experience: 10)
    @bill_ride = MechanicRide.create!(mechanic_id: @bill.id, ride_id: @scrambler.id )
    @bobby = Mechanic.create!(name: "Bobby", years_experience: 19)
    @bobby_ride = MechanicRide.create!(mechanic_id: @bobby.id, ride_id: @jaws.id )
  end
  describe 'as a visitor' do
    it 'I see the name and pice of admissions for that amusement park' do
      visit amusement_park_path(@six_flags)
     

      expect(page).to have_content(@six_flags.name)
      expect(page).to have_content(@six_flags.admission_cost)
    end

    it 'it shows all the mechanics working at that park' do
      visit amusement_park_path(@six_flags)

      expect(page).to have_content(@john.name, count: 1)
      expect(page).to have_content(@bill.name)
      expect(page).to_not have_content(@bobby.name)
    end
  end
end