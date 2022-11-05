class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def list_of_mechanics_names
    mechanics.distinct.pluck(:name)
  end

  def rides_by_experience
    rides.joins(:mechanics).group(:id).select("rides.*, avg(mechanics.years_experience) as avg_experience").order("avg_experience desc")
  end
end