# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AmusementPark.destroy_all
# Ride.destroy_all
# 
# @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
# @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
# 
# @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
# @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
# @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
# 
# @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@mechanic = Mechanic.create!(name: 'Jim', years_experience: 5)
@six_flags = AmusementPark.create!(name: 'Six Flags Great America', admission_cost: 20)
@dejavu = @six_flags.rides.create!(name: 'DeJaVu', thrill_rating: 9, open: false)
@raging_bull = @six_flags.rides.create!(name: 'Raging Bull', thrill_rating: 10, open: true)
@dark_knight = @six_flags.rides.create!(name: 'Dark Knight', thrill_rating: 6, open: true)

@mechanic.rides << @dejavu
@mechanic.rides << @raging_bull