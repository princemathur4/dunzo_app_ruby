class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.integer :pincode
      t.string :address_line

      t.timestamps
    end
  end
end
