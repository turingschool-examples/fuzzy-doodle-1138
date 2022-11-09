class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def show_unique
    mechanics.distinct
  end
end
