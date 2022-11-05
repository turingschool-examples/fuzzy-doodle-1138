require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  describe "instance methods" do 
    describe "#list_of_mechanics_names" do 
      it "should return a unique list of the mechanics working on rides at the park" do 
        park = AmusementPark.create!(name: "Six Flags", admission_cost: 25)
    
        sizzler = park.rides.create!(name: "Sizzler", thrill_rating: 2, open: true)
        swings = park.rides.create!(name: "Swings", thrill_rating: 1, open: false)
        boat = park.rides.create!(name: "Pharoahs Boat", thrill_rating: 4, open: true)
        zipper = park.rides.create!(name: "Zipper", thrill_rating: 10, open: false)
    
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

        expect(park.list_of_mechanics_names).to eq(["Haku Dog", "Kiko Dog", "Mako Cat"])

        RideMechanic.create!(mechanic: kiko, ride: zipper)
        RideMechanic.create!(mechanic: hina, ride: zipper)
        RideMechanic.create!(mechanic: toro, ride: zipper)

        expect(park.list_of_mechanics_names).to eq(["Haku Dog", "Hina Pup", "Kiko Dog", "Mako Cat", "Toro Kitty"])
      end
    end

    describe "#rides_by_experience" do 
      it "should return a list of the park's rides, ordered by the average experience of the mechanics, and including a column 'avg_experience" do 
        park = AmusementPark.create!(name: "Six Flags", admission_cost: 25)
        sizzler = park.rides.create!(name: "Sizzler", thrill_rating: 2, open: true)
        swings = park.rides.create!(name: "Swings", thrill_rating: 1, open: false)
        boat = park.rides.create!(name: "Pharoahs Boat", thrill_rating: 4, open: true)
        haku = Mechanic.create!(name: "Haku Dog", years_experience: 1)
        mako = Mechanic.create!(name: "Mako Cat", years_experience: 2)
        kiko = Mechanic.create!(name: "Kiko Dog", years_experience: 3)
        hina = Mechanic.create!(name: "Hina Pup", years_experience: 4)
        toro = Mechanic.create!(name: "Toro Kitty", years_experience: 5)

        RideMechanic.create!(mechanic: haku, ride: sizzler)
        RideMechanic.create!(mechanic: mako, ride: sizzler)
        RideMechanic.create!(mechanic: kiko, ride: sizzler)

        RideMechanic.create!(mechanic: mako, ride: swings)
        RideMechanic.create!(mechanic: kiko, ride: swings)
        RideMechanic.create!(mechanic: hina, ride: swings)

        RideMechanic.create!(mechanic: hina, ride: boat)
        RideMechanic.create!(mechanic: kiko, ride: boat)
        RideMechanic.create!(mechanic: toro, ride: boat)

        result = park.rides_by_experience

        expect(result).to eq([boat, swings, sizzler])
        expect(result[0].avg_experience).to eq(4)
        expect(result[1].avg_experience).to eq(3)
        expect(result[2].avg_experience).to eq(2)
      end
    end
  end
end