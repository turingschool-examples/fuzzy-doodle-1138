class ChangeForeignKeyNamingAgainOnRideMechanics < ActiveRecord::Migration[5.2]
  def change
          rename_column :ride_mechanics, :rides_id, :ride_id
  end
end
