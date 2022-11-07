class Machanic < ActiveRecord::Migration[5.2]
  def change
    create_table :machanics do |t|
      t.string :name
      t.integer :years_experience

      t.timestamps
    end
  end
end
