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


@kara = Mechanic.create!(name: "Kara Smith", years_experience: 11)
@larry = Mechanic.create!(name: "Larry Quinn", years_experience: 3)

@frog = @six_flags.rides.create!(name: "The Frog Hopper", thrill_rating: 7, open: false)
@farenheit = @six_flags.rides.create!(name: "Farenheit", thrill_rating: 9, open: true)
@kiss = @six_flags.rides.create!(name: "The Kiss Raise", thrill_rating: 4, open: true)

@kara.rides << @frog
@kara.rides << @farenheit
@kara.rides << @kiss
@larry.rides << @farenheit
@larry.rides << @kiss 