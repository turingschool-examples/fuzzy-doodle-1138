class AddTimestampsToRideMechanics < ActiveRecord::Migration[5.2]
  def change
    add_column :ride_mechanics, :created_at, :datetime, null: false
    add_column :ride_mechanics, :updated_at, :datetime, null: false
  end
end
