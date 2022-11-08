# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@sam = Mechanic.create!(name: "Sam", years_experience: 11)
@abbas = Mechanic.create!(name: "Abbas", years_experience: 9)
@amusement_park = AmusementPark.create!(name: "Dreamland", admission_cost: 50)
@ride_1 = @amusement_park.rides.create!(name: "Barf-a-lot", thrill_rating: 10, open: true)
@ride_2 = @amusement_park.rides.create!(name: "Merry Go Round", thrill_rating: 10, open: false)
@ride_3 = @amusement_park.rides.create!(name: "Gummi Coaster", thrill_rating: 8, open: true)
@ride_4 = @amusement_park.rides.create!(name: "House of Heartless", thrill_rating: 6, open: false)
@ride_5 = @amusement_park.rides.create!(name: "Blackpearl", thrill_rating: 7, open: true)
@sam.rides << @ride_1
@sam.rides << @ride_2
@abbas.rides << @ride_3