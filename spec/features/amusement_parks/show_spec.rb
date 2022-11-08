require 'rails_helper'

RSpec.describe 'amusement show page' do
# When I visit an amusement park’s show page,
# Then I see the name and price of admissions for that amusement park
# And I see the names of all mechanics that are working on that park's rides,
# And I see that the list of mechanics is unique
  describe 'as a user when I visit the amusement show page, as well as all the mechanics working on the park rides' do
    it 'Shows the name, and price of the park' do
      amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
      amusement_park_2 = AmusementPark.create!(name: "Oak Park", admission_cost: 50)
      amusement_park_3 = AmusementPark.create!(name: "The updside down", admission_cost: 60)
      amusement_park_4 = AmusementPark.create!(name: "Disney", admission_cost: 750)
      
      mechanic_1 = Mechanic.create!(name: "Jim", years_of_experience: 22)
      mechanic_2 = Mechanic.create!(name: "Norm", years_of_experience: 30)

      visit "/amusement_parks/#{amusement_park_1.id}"

      expect(page).to have_content("#{amusement_park_1.name}")
      expect(page).to have_content("#{amusement_park_1.admission_cost}")

      expect(page).to_not have_content("#{amusement_park_2}")
      #save_and_open_page
    end
  end
  
   it 'Lists all the mechanics working on that parks rides without repeating' do 
    amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    # amusement_park_2 = AmusementPark.create!(name: "Oak Park", admission_cost: 50)
    # amusement_park_3 = AmusementPark.create!(name: "The updside down", admission_cost: 60)
    # amusement_park_4 = AmusementPark.create!(name: "Disney", admission_cost: 750)
      
    mechanic_1 = Mechanic.create!(name: "Jim", years_of_experience: 22)
    mechanic_2 = Mechanic.create!(name: "Norm", years_of_experience: 30)
    
    ride_1 = mechanic_1.rides.create!(name: "Top Gun", thrill_rating: 10, open: true, amusement_park_id: amusement_park_1.id)
    ride_2 = mechanic_1.rides.create!(name: "Gravatron", thrill_rating: 8, open: true, amusement_park_id: amusement_park_1.id)
    ride_3 = mechanic_2.rides.create!(name: "Fast and the Furious", thrill_rating: 6, open: true, amusement_park_id: amusement_park_1.id)
    ride_4 = mechanic_2.rides.create!(name: "Joust", thrill_rating: 7, open: true, amusement_park_id: amusement_park_1.id)
    
    #expect(page).to have_content(mechanic_1.name, )
  end
end      