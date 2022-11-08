class AmusementPark < ApplicationRecord
  has_many :rides

  def mechanics_list
    # binding.pry 
    Mechanic.joins(:rides).where("rides.amusement_park_id = #{self.id}").distinct
  end
end