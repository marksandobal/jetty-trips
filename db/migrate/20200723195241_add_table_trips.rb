class AddTableTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips, id: :uuid do |t|
      t.uuid :driver_id
      t.datetime :date
      t.decimal :price, precision: 10, scale: 2
      t.string :name
      t.string :status
    
      t.timestamps
    end

    add_foreign_key :trips, :drivers
  end
end
