require 'rails_helper'

RSpec.describe 'Mechanic Show' do
  
  before :each do
    @mechanic = Mechanic.create!(name: 'Jim', years_experience: 5)
    @six_flags = AmusementPark.create!(name: 'Six Flags Great America', admission_cost: 20)
    @dejavu = @six_flags.rides.create!(name: 'DeJaVu', thrill_rating: 9, open: false)
    @raging_bull = @six_flags.rides.create!(name: 'Raging Bull', thrill_rating: 10, open: true)
    @dark_knight = @six_flags.rides.create!(name: 'Dark Knight', thrill_rating: 6, open: true)
    
    @mechanic.rides << @dejavu
    @mechanic.rides << @raging_bull
    
    visit mechanic_path(@mechanic)
  end
  
  describe 'as a visitor' do
    it "I see their name, years of experience, and the names of all rides they
    are working on" do
      expect(page).to have_content(@mechanic.name)
      expect(page).to have_content(@mechanic.years_experience)
      
      within("#mechanic-rides") do
        expect(page).to have_content(@dejavu.name)
        expect(page).to have_content(@raging_bull.name)
        expect(page).to_not have_content(@dark_knight.name)
      end
    end
    
    describe 'I see a form to add a ride to their workload' do
      it "When I fill in that field with an id of an existing ride and click
      Submit I’m taken back to that mechanic's show page And I see the name of
      that newly added ride on this mechanic's show page" do
        fill_in "add_ride_id", with: @dark_knight.id
        click_button 'Submit'
        
        expect(current_path).to eq(mechanic_path(@mechanic))
        within("#mechanic-rides") do
          expect(page).to have_content(@dejavu.name)
          expect(page).to have_content(@raging_bull.name)
          expect(page).to have_content(@dark_knight.name)
        end
      end
      
      it "When I enter an invalid ride ID I am redirected to the show page
      and presented with an error" do
        fill_in "add_ride_id", with: 5287
        click_button 'Submit'
        
        expect(current_path).to eq(mechanic_path(@mechanic))
        expect(page).to have_content('Please enter a valid ride ID')
      end
    end
    
  end
end