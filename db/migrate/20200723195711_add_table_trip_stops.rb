class AddTableTripStops < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_stops, id: :uuid do |t|
      t.uuid :trip_id
      t.string :name
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :address
      t.datetime :departure_time
      t.boolean :boarding

      t.timestamps
    end

    add_foreign_key :trip_stops, :trips
  end
end
