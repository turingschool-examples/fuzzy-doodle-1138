class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def list_of_mechanics_names
    mechanics.distinct.pluck(:name)
  end
end