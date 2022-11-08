class Mechanic < ApplicationRecord
  has_many :ridemechanics
  has_many :rides, through: :ridemechanics
end
