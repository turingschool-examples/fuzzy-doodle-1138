require 'rails_helper'


RSpec.describe 'mechanics show page' do
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
  end

  describe 'as a user, when I visit a mechanic show page' do
    it 'I see their name, years of experience, and the names of all the rides they work on' do
      visit mechanic_path(@john)
      
      within "#mechanic" do
        expect(current_path).to eq("/mechanics/#{@john.id}")
        expect(page).to have_content("#{@john.name}")
        expect(page).to have_content("#{@john.years_experience}")
        expect(page).to have_content("#{@ferris.name}")
      end
    end
    
    it 'has a form to add rides to mechanics' do
      visit mechanic_path(@john)

      expect(page).to have_field('ride_id')
      expect(page).to have_button("Add ride to mechanic")
    end

    it "When I fill in the field with the Id of an existing ride and I click submit then I am redirected to the mechanics show page" do
      visit mechanic_path(@john)
   
      fill_in "ride_id", with: @hurler.id
      click_button "Add ride to mechanic"

      expect(current_path).to eq(mechanic_path(@john))
    end

    it "I see the ride now listed under mechanics" do
      visit mechanic_path(@john)
   
      fill_in "ride_id", with: @hurler.id
      click_button "Add ride to mechanic"
      
      within "#mechanic" do
        expect(page).to have_content(@ferris.name)
        expect(page).to have_content(@hurler.name)
      end
    end
  end
end
