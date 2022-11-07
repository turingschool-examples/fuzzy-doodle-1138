require 'rails_helper'

RSpec.describe 'Amusement Park Show Page', type: :feature do
  before(:each) do
    @machanic_1 = Machanic.create!(name: "John", years_experience: 2)
    @machanic_2 = Machanic.create!(name: "Jake", years_experience: 4)
    @machanic_3 = Machanic.create!(name: "Sally", years_experience: 10)

    @park_1 = AmusementPark.create!(name: "Wisney Dorld", admission_cost: 900)
    @park_2 = AmusementPark.create!(name: "Local Studeo", admission_cost: 500)

    @ride_1 = @park_1.rides.create!(name: 'Thunder Dome', thrill_rating: 7, open: true)
    @ride_2 = @park_1.rides.create!(name: 'New Ride', thrill_rating: 2, open: true)
    @ride_3 = @park_1.rides.create!(name: 'Not on list', thrill_rating: 99, open: true)
    @ride_4 = @park_2.rides.create!(name: 'Different Park', thrill_rating: 1, open: true)

    @machanic_1.rides << @ride_1
    @machanic_2.rides << @ride_1

    @machanic_1.rides << @ride_2

    @machanic_2.rides << @ride_3

    @machanic_3.rides << @ride_4

    visit amusement_park_path(@park_1)
  end
  describe 'When I visit /amusement_parks/:id' do
    describe 'Then I see' do
      it 'name and price of admissions for that park' do
        within "#park-info" do
          expect(page).to have_content(@park_1.name, count: 1)
          expect(page).to have_content(@park_1.admission_cost)
        end
      end
      it 'a unique list of mechanic names that are working on that parks rides' do
        within "#machanics-list" do
          expect(page).to have_content(@machanic_1.name)
          expect(page).to have_content(@machanic_2.name)

          expect(page).to_not have_content(@machanic_3.name)
        end
      end
      it 'a list of all the parks rides' do
        within "#rides_list" do
          expect(page).to have_content(@ride_1.name)
          expect(page).to have_content(@ride_2.name)
          expect(page).to have_content(@ride_3.name)

          expect(page).to_not have_content(@ride_4.name)
        end
      end
      it 'next to each ride I see the average experience of the machanics working on that ride' do
        within "#rides_list" do
          expect(page).to have_content(4)
          expect(page).to have_content(3)
          expect(page).to have_content(2)
        end
      end
      it 'the list is ordered by average experience' do
        within "#rides_list" do
          expect(@ride_3.name).to appear_before(@ride_1.name)
          expect(@ride_1.name).to appear_before(@ride_2.name)
        end
      end
    end
  end
end