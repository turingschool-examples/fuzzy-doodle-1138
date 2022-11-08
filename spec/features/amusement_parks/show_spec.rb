require 'rails_helper' 

RSpec.describe 'Amusement Park Show Page' do 
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
    RideMechanic.create!(mechanic_id: @mechanic3.id, ride_id: @jaws.id)

    visit amusement_park_path(@six_flags)
  end 

  describe 'Amusement park info' do 
    it 'I see the name and price of admissions for the amusement park' do 

      expect(page).to have_content(@six_flags.name)
      expect(page).to have_content(@six_flags.admission_cost)
      expect(page).to_not have_content(@universal.name)
      expect(page).to_not have_content(@universal.admission_cost)

    end

    it 'I see the names of all mechanics that are working on that parks ride and I see that the list of mechanics is unique' do 

      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content(@mechanic2.name)
      expect(page).to_not have_content(@mechanic3.name)
    end
  end
end