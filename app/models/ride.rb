class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  validates_presence_of(:name)
  validates_presence_of(:thrill_rating)
  validates_numericality_of :thrill_rating, greater_than: 0
end
