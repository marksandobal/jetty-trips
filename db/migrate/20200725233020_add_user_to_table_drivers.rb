class AddUserToTableDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :user_id, :integer
    add_foreign_key :drivers, :users
  end
end
