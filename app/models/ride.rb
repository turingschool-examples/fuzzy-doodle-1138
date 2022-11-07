class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def avg_experience
    mechanics.average(:years_experience)
  end

  def self.experience_order 
    select('rides.*, avg(mechanics.years_experience) as experience').joins(:mechanics).order('experience desc').group(:id)
  end
end