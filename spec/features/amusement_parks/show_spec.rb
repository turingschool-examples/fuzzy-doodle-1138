require 'rails_helper'

RSpec.describe 'Amusement Park Show Page', type: :feature do
  let!(:nintendo) {AmusementPark.create!(name: 'Nintendo World', admission_cost: 130)}
  
  let!(:yoshi) {nintendo.rides.create!(name: "Yoshi's Adventure", thrill_rating: 0, open: true)}
  let!(:koopa) {nintendo.rides.create!(name: "Koopa's Challenge", thrill_rating: 1, open: true)}
  let!(:bowser) {nintendo.rides.create!(name: "Bowser Shadow Showdown", thrill_rating: 3, open: false)}

  let!(:naomi) {Mechanic.create!(name: 'Naomi', years_experience: 5)}
  let!(:khaela) {Mechanic.create!(name: 'Khaela', years_experience: 11)}
  let!(:tyler) {Mechanic.create!(name: 'Tyler', years_experience: 3)}

  describe 'amusement_park#show' do
    it 'shows the name and price of admission for the amusement park' do
      visit amusement_park_path(nintendo)

      expect(page).to have_content(nintendo.name)

      within("#info") do
        expect(page).to have_content("Price of Admission: $#{nintendo.admission_cost}")
      end
    end

    it 'shows a unique list of all mechanics that are working on the parks rides' do
      MechanicRide.create!(mechanic: naomi, ride: yoshi)
      MechanicRide.create!(mechanic: naomi, ride: bowser)
      MechanicRide.create!(mechanic: khaela, ride: koopa)
      MechanicRide.create!(mechanic: khaela, ride: yoshi)

      visit amusement_park_path(nintendo)
     
      within("#info") do
        expect(page).to have_content("Working Mechanics")
        expect(page).to have_content(naomi.name, count: 1)
        expect(page).to have_content(khaela.name, count: 1)
        expect(page).to_not have_content(tyler.name)
      end
    end
  end
end