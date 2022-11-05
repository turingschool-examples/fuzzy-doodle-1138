class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.ordered_average_experience
    joins(:mechanics)
      .select('rides.*, avg(mechanics.years_experience) AS avg')
      .group('rides.id')
      .order('avg desc')
  end
end