class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.references :arrival_airport, null: false, foreign_key: { to_table: :airports }
      t.references :departure_airport, null: false, foreign_key: { to_table: :airports }

      t.datetime :departure_datetime
      t.integer :flight_duration
      t.timestamps
    end
  end
end
