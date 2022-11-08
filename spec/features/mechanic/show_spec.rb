require 'rails_helper'

RSpec.describe 'Mechanic Show Page', type: :feature do
  before :each do 
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
    
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    
    @mechanic_1 = Mechanic.create!(name: "Charlie Smith", years_experience: 4)
    @mechanic_2 = Mechanic.create!(name: "Michael Jones", years_experience: 20)
    @mechanic_3 = Mechanic.create!(name: "John Doe", years_experience: 12)
    
    ride_mechanic_1 = RideMechanic.create(mechanic_id: @mechanic_1.id, ride_id: @jaws.id)
    ride_mechanic_2 = RideMechanic.create(mechanic_id: @mechanic_1.id, ride_id: @scrambler.id)
    ride_mechanic_3 = RideMechanic.create(mechanic_id: @mechanic_2.id, ride_id: @jaws.id)
    ride_mechanic_4 = RideMechanic.create(mechanic_id: @mechanic_3.id, ride_id: @ferris.id)
  end
  
  describe 'show page should have mechanic attributes' do
    it 'should show mechanic name, years of experience, and the names of all rides they are working on' do 
      visit mechanic_path(@mechanic_1)
save_and_open_page
      expect(page).to have_content("Charlie Smith")
      expect(page).to have_content("Experience: 4 years")
      expect(page).to have_content("The Scrambler")
      expect(page).to have_content("Jaws")

      expect(page).to_not have_content("Michael Jones")
      expect(page).to_not have_content("John Doe")
    end
  end
end