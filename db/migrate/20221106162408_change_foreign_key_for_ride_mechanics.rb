class ChangeForeignKeyForRideMechanics < ActiveRecord::Migration[5.2]
  def change
    rename_column :ride_mechanics, :mechanics_id, :mechanic_id
  end
end
