class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :City
      t.string :State
      t.string :Country
      t.string :Data_Source
      t.integer :WMO_Number
      t.float :Latitude
      t.float :Longitude
      t.float :Time_Zone
      t.float :Elevation

      t.timestamps
    end
  end
end
