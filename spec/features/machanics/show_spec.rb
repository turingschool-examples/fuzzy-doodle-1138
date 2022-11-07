require 'rails_helper'

RSpec.describe 'Machanic Show Page', type: :feature do
  before(:each) do
    @machanic_1 = Machanic.create!(name: "John", years_experience: 2)
    @machanic_2 = Machanic.create!(name: "Jake", years_experience: 4)

    @park_1 = AmusementPark.create!(name: "Wisney Dorld", admission_cost: 900)

    @ride_1 = @park_1.rides.create!(name: 'Thunder Dome', thrill_rating: 7, open: true)
    @ride_2 = @park_1.rides.create!(name: 'New Ride', thrill_rating: 2, open: true)
    @ride_3 = @park_1.rides.create!(name: 'Not on list', thrill_rating: 99, open: true)

    @machanic_1.rides << @ride_1
    @machanic_1.rides << @ride_2
    @machanic_2.rides << @ride_3

    visit machanic_path(@machanic_1)
  end
  describe 'When I visit /machanics/:id' do
    describe 'Then I see' do
      it 'the machanics name and years of experience' do
        within "#machanic-info" do
          expect(page).to have_content(@machanic_1.name)
          expect(page).to have_content(@machanic_1.years_experience)

          expect(page).to_not have_content(@machanic_2.name)
          expect(page).to_not have_content(@machanic_2.years_experience)
        end
      end
      it 'the names of all the rides they are working on' do
        within "#rides-list" do
          expect(page).to have_content(@ride_1.name)
          expect(page).to have_content(@ride_2.name)

          expect(page).to_not have_content(@ride_3.name)
        end
      end
      it 'a form to add a ride to their workload'
      it 'when i fill in that field with an id of an existing ride and click "Submit"'
      it 'I am taken back to the machanics show page and I see the name of the ride added'
    end
  end
end