class AmusementPark < ApplicationRecord
  has_many :rides

  def machanics_at_park
    self.rides.joins(:machanics).distinct.pluck("machanics.name")
  end

  def rides_and_mechs
    self.rides.joins(:machanics).select("rides.*, avg(machanics.years_experience) AS avg_exp").group("rides.id").order(avg_exp: :desc)
  end
end