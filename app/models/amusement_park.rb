class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides
  validates_presence_of :name, :admission_cost
  validates_numericality_of :admission_cost, numericality: true

  def park_mechanics
    self.mechanics.distinct
  end
end
