require "rails_helper"

RSpec.describe "the Amusement Park Show page" do 
  before(:each) do 
    @park = AmusementPark.create!(name: "Six Flags", admission_cost: 25)
    another_park = AmusementPark.create!(name: "Another Park", admission_cost: 40)

    sizzler = @park.rides.create!(name: "Sizzler", thrill_rating: 2, open: true)
    swings = @park.rides.create!(name: "Swings", thrill_rating: 1, open: false)
    boat = @park.rides.create!(name: "Pharoahs Boat", thrill_rating: 4, open: true)

    zipper = another_park.rides.create!(name: "Zipper", thrill_rating: 10, open: false)

    haku = Mechanic.create!(name: "Haku Dog", years_experience: 3)
    mako = Mechanic.create!(name: "Mako Cat", years_experience: 4)
    kiko = Mechanic.create!(name: "Kiko Dog", years_experience: 10)
    hina = Mechanic.create!(name: "Hina Pup", years_experience: 4)
    toro = Mechanic.create!(name: "Toro Kitty", years_experience: 13)

    RideMechanic.create!(mechanic: haku, ride: sizzler)
    RideMechanic.create!(mechanic: haku, ride: swings)
    RideMechanic.create!(mechanic: mako, ride: sizzler)
    RideMechanic.create!(mechanic: kiko, ride: sizzler)
    RideMechanic.create!(mechanic: kiko, ride: swings)
    RideMechanic.create!(mechanic: kiko, ride: boat)
    RideMechanic.create!(mechanic: kiko, ride: zipper)
    RideMechanic.create!(mechanic: hina, ride: zipper)
    RideMechanic.create!(mechanic: toro, ride: zipper)
  end

  describe "As a visitor, when I visit /amusement_parks/:id" do 
    it "displays the name and price of the park, and a unique list of all mechanics working there" do 
      visit amusement_park_path(@park)

      expect(page).to have_content("Park Name: Six Flags")
      expect(page).to have_content("Admissions Cost: $25")
      expect(page).to have_content("Mechanics: Haku Dog, Kiko Dog, and Mako Cat")
    end
  end
end