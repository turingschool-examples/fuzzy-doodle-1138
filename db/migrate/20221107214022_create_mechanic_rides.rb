class CreateMechanicRides < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanic_rides do |t|
      t.bigint :ride_id
      t.bigint :mechanic_id
    end
  end
end
