require 'rails_helper'

RSpec.describe 'Mechanic Show page' do 
  before :each do 
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mechanic1 = Mechanic.create!(name: "Obama", years_experience: 8 )
    @mechanic2 = Mechanic.create!(name: "Trump", years_experience: 4 )
    @mechanic3 = Mechanic.create!(name: "Clinton", years_experience: 8 )

    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @hurler.id)
    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @jaws.id)
    RideMechanic.create!(mechanic_id: @mechanic2.id, ride_id: @ferris.id)
    RideMechanic.create!(mechanic_id: @mechanic2.id, ride_id: @scrambler.id)


  end

  describe 'Display mechanic invidiual info ' do 
    it 'As a user, when I visit a mechanic show page,I see their name, years exp, and the name of all the rides they are working on' do 
      visit mechanic_path(@mechanic1)

      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content(@mechanic1.years_experience)
      expect(page).to have_content(@hurler.name)
      expect(page).to have_content(@jaws.name)
      expect(page).to_not have_content(@mechanic2.name)
      expect(page).to_not have_content(@ferris.name)
      expect(page).to_not have_content(@scrambler.name)
    end
  end


end