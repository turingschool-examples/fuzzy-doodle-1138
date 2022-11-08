class CreateRidemechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :ridemechanics do |t|
      t.references :ride, foreign_key: true
      t.references :mechanic, foreign_key: true
    end
  end
end
