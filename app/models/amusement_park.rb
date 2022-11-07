class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def unique_mechanics
    mechanics.distinct
  end

  def rides_by_mechanic_experience
    rides.select('rides.*, avg(mechanics.years_experience) as avg_experience').joins(:mechanics).group(:id).order('avg_experience desc')
  end
end