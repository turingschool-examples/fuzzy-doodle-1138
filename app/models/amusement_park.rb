class AmusementPark < ApplicationRecord
  has_many :rides

  def mechanics_list
    Mechanic.joins(:rides).where("rides.amusement_park_id = #{self.id}").distinct
  end

  def rides_by_average_mechanics_experience
    # binding.pry
    rides.joins(:mechanics).select('rides.name, avg(mechanics.years_experience) as average').group(:name).order("average")
  end
end