class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ridemechanics
  has_many :mechanics, through: :ridemechanics
end
