class DropAmusementParkMechancis < ActiveRecord::Migration[5.2]
  def change
    drop_table :amusement_park_mechanics
  end
end
