class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  validates_presence_of :name
  validates_numericality_of :thrill_rating

  # def ordered_park_rides(park)
  #   Ride.joins(:mechanics, :amusement_parks)
  #   .where('amusement_parks.id = park.id')
  #   .group(:id)
  #   .select('mechanics.*, avg(:years_experience) as average_experience')
  #   .order('average_experience')
  #   .select
  # end
end