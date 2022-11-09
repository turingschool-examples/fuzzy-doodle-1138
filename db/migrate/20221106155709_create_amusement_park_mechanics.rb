class CreateAmusementParkMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :amusement_park_mechanics do |t|
      t.references :amusement_parks, foreign_key: true
      t.references :mechanics, foreign_key: true
    end
  end
end
