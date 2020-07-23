class AddTableDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers, id: :uuid do |t|
      t.string :name
      t.string :last_name
      t.string :mobile
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
