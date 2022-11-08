require 'rails_helper'

RSpec.describe 'mechanics' do
  let!(:park1) { AmusementPark.create!(name: 'Bat World', admission_cost: 100) }
  let!(:park2) { AmusementPark.create!(name: 'Krytpon', admission_cost: 10000) }

  let!(:mechanic1) { Mechanic.create!(name: 'Bruce Wayne', experience: 10) }
  let!(:mechanic2) { Mechanic.create!(name: 'Clark Kent', experience: 2) }
  let!(:mechanic3) { Mechanic.create!(name: 'Bob', experience: 100) }
  let!(:mechanic4) { Mechanic.create!(name: 'Robert Baratheon', experience: 7) }

  let!(:ride1) { park1.rides.create!(name: 'Bat-Coaster', thrill_rating: 100, open: true) }
  let!(:ride2) { park1.rides.create!(name: 'Joker Spinning Thing', thrill_rating: 0, open: true) }
  let!(:ride3) { park1.rides.create!(name: 'Gotham Subway', thrill_rating: 20, open: false) }
  let!(:ride4) { park1.rides.create!(name: 'Riddler Fun House', thrill_rating: 80, open: true) }
  let!(:ride5) { park1.rides.create!(name: 'The Rattler', thrill_rating: 90, open: true) }
  let!(:ride6) { park2.rides.create!(name: 'Giant Crater', thrill_rating: 1, open: true) }
  let!(:ride7) { park2.rides.create!(name: 'Radiation Fun House', thrill_rating: 60, open: true) }

  let!(:mechanic_ride1) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride1.id) }
  let!(:mechanic_ride2) { MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride2.id) }
  let!(:mechanic_ride3) { MechanicRide.create!(mechanic_id: mechanic2.id, ride_id: ride1.id) }
  let!(:mechanic_ride4) { MechanicRide.create!(mechanic_id: mechanic3.id, ride_id: ride7.id) }
  let!(:mechanic_ride5) { MechanicRide.create!(mechanic_id: mechanic4.id, ride_id: ride5.id) }

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

    it 'has a form to fill in with field of existing ride that can fill in ID and add ride to mechanic' do
      visit "/mechanics/#{mechanic1.id}"

      within '#rides' do
        expect(page).to have_content(ride1.name)
        expect(page).to have_content(ride2.name)
        expect(page).to_not have_content(ride3.name)
      end

      within '#new_ride' do
        expect(page).to have_selector(:css, 'form')
        expect(find('form')).to have_content('Ride id:')
        expect(page).to have_button('Add New Ride')

        fill_in('ride_id', with: ride3.id)
        click_button('Add New Ride')
      end

      expect(current_path).to eq("/mechanics/#{mechanic1.id}")

      within '#rides' do
        expect(page).to have_content(ride1.name)
        expect(page).to have_content(ride2.name)
        expect(page).to have_content(ride3.name)
      end
    end
  end
end
