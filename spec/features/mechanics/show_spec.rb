require 'rails_helper'

RSpec.describe 'Mechanics Show Page', type: :feature do
  let!(:nintendo) {AmusementPark.create!(name: 'Nintendo World', admission_cost: 130)}
  
  let!(:yoshi) {nintendo.rides.create!(name: "Yoshi's Adventure", thrill_rating: 0, open: true)}
  let!(:koopa) {nintendo.rides.create!(name: "Koopa's Challenge", thrill_rating: 1, open: true)}
  let!(:bowser) {nintendo.rides.create!(name: "Bowser Shadow Showdown", thrill_rating: 3, open: false)}

  let!(:naomi) {Mechanic.create!(name: 'Naomi', years_experience: 5)}
  let!(:khaela) {Mechanic.create!(name: 'Khaela', years_experience: 11)}
  
  describe 'mechanics#show' do
    it 'I see their name, years of experience, and the names of all rides they are working on' do
      MechanicRide.create!(mechanic: naomi, ride: yoshi)
      MechanicRide.create!(mechanic: naomi, ride: bowser)
      MechanicRide.create!(mechanic: khaela, ride: koopa)
      
      visit mechanic_path(naomi)

      within("#info") do
        expect(page).to have_content("Name: #{naomi.name}")
        expect(page).to have_content("Years of Experience: #{naomi.years_experience}")
      end

      within("#my-rides") do
        expect(page).to have_content("Working On: #{yoshi.name}")
        expect(page).to have_content("Working On: #{bowser.name}")
        expect(page).to_not have_content("Working On: #{koopa.name}")
      end
    end
  end
end