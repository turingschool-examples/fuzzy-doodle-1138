class CreateMachanicRides < ActiveRecord::Migration[5.2]
  def change
    create_table :machanic_rides do |t|
      t.references :machanic, foreign_key: true
      t.references :ride, foreign_key: true

      t.timestamps
    end
  end
end
