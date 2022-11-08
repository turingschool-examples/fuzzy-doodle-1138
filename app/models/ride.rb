class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def avg_mech_exper
    mechanics.average(:experience).round(2)
  end

end