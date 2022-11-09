class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics,   through: :rides

  def mech_names
    mechanics.distinct
  end
end
