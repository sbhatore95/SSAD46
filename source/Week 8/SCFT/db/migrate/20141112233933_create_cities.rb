class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city
      t.string :state
      t.string :country
      t.string :source
      t.integer :wmonum
      t.float :latitude
      t.float :longitude
      t.float :timezone
      t.float :elevation
      t.string :link

      t.timestamps
    end
  end
end
