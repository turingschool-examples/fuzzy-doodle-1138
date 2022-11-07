class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides
  
  def unique_mechanics
    mechanics.distinct
  end

  def mech_avg_yrs_exp
    # mechs = self.rides.select(:id, :name, :thrill_rating, :open, 'average(mechanics.years_experience) as avg_exp').joins(:mechanics).group(:id)
    # mechs_avg = Mechanic.select(:id, :name, 'average(:years_experience)').joins(:rides).group('rides.id')
    # require "pry"; binding.pry
  end
end