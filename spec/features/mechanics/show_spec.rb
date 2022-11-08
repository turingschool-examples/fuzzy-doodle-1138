require 'rails_helper'

RSpec.describe 'mechanics' do
  let!(:park1) { AmusementPark.create!(name: 'Bat World', admission_cost: 100) }

  let!(:mechanic1) { Mechanic.create!(name: 'Bruce Wayne', experience: 10) }

  let!(:ride1) { park1.rides.create!(name: 'Bat-Coaster', thrill_rating: 100, open: true) }
  let!(:ride2) { park1.rides.create!(name: 'Joker Spinning Thing', thrill_rating: 0, open: true) }
  let!(:ride3) { park1.rides.create!(name: 'Gotham Subway', thrill_rating: 20, open: false) }
  let!(:ride4) { park1.rides.create!(name: 'Riddler Fun House', thrill_rating: 80, open: true) }

  let!(:mechanic_ride1) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride1.id) }
  let!(:mechanic_ride2) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride2.id) }

  describe 'mechanics show page' do
    it 'has name, YOE, and names of all rides they are working on' do
      visit "/mechanics/#{mechanic1.id}"
      within '#mechanic_info' do
        expect(page).to have_content(mechanic1.name)
        expect(page).to have_content(mechanic1.experience)
      end

      within '#rides' do
        expect(page).to have_content(ride1.name)
        expect(page).to have_content(ride2.name)
        expect(page).to_not have_content(ride3.name)
      end
    end
  end
end
