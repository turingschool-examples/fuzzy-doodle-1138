class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def unique_mechanics
    mechanics.distinct.pluck(:name)
  end

  def experience_order 
    rides.select('rides.*, avg(mechanics.years_experience) as experience').joins(:mechanics).order('experience desc').group(:id)
  end 
end