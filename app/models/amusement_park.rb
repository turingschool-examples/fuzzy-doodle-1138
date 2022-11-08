class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :ride_mechanics, through: :rides
  has_many :mechanics, through: :ride_mechanics

  def unique_mechanics
    mechanics.distinct
  end

  def rides_sorted_by_exp
    rides.joins(:mechanics)
    .select('rides.*, avg(mechanics.years_experience) AS average_exp')
    .group('rides.id')
    .order(average_exp: :desc)
  end
end