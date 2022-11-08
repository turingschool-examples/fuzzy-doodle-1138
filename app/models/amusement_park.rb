class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides


  def mechanics_names
    mechanics.distinct
  end
end