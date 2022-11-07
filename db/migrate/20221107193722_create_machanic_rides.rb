class CreateMachanicRides < ActiveRecord::Migration[5.2]
  def change
    create_table :machanic_rides do |t|
      t.references :machanics, foreign_key: true
      t.references :rides, foreign_key: true

      t.timestamps
    end
  end
end
