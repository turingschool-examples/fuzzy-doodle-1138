require 'rails_helper'

RSpec.describe 'Amusement Park Show' do
  
  before :each do
    @mechanic = Mechanic.create!(name: 'Jim', years_experience: 5)
    @mike = Mechanic.create!(name: 'Mike', years_experience: 9)
    @adam = Mechanic.create!(name: 'Adam', years_experience: 3)
    @six_flags = AmusementPark.create!(name: 'Six Flags Great America', admission_cost: 20)
    @dejavu = @six_flags.rides.create!(name: 'DeJaVu', thrill_rating: 9, open: false)
    @raging_bull = @six_flags.rides.create!(name: 'Raging Bull', thrill_rating: 10, open: true)
    @dark_knight = @six_flags.rides.create!(name: 'Dark Knight', thrill_rating: 6, open: true)
    
    @mechanic.rides << @dejavu
    @mechanic.rides << @raging_bull
    @mike.rides << @raging_bull
    
    visit amusement_park_path(@six_flags)
  end
  
  describe 'as a visitor' do
    it "I see the name and price of admissions for that amusement park" do
      expect(page).to have_content("Amusement Park: #{@six_flags.name}")
      expect(page).to have_content("Admission: $#{@six_flags.admission_cost}")
    end
    
    it "And I see the names of all mechanics that are working on that park's 
    rides, and all the mechanics are unique" do
      
      within("#park-mechanics") do
        expect(page).to have_content(@mechanic.name, count: 1)
        expect(page).to have_content(@mike.name, count: 1)
        expect(page).to_not have_content(@adam.name)
      end
    end
  end
end