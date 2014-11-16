class CreateWeatherdata < ActiveRecord::Migration
  def change
    create_table :weatherdata do |t|
      t.string :city
      t.string :qualfile
      t.float :mjan
      t.float :mfeb
      t.float :mmar
      t.float :mapr
      t.float :mmay
      t.float :mjun
      t.float :mjul
      t.float :maug
      t.float :msep
      t.float :moct
      t.float :mnov
      t.float :mdec
      t.float :njan
      t.float :nfeb
      t.float :nmar
      t.float :napr
      t.float :nmay
      t.float :njun
      t.float :njul
      t.float :naug
      t.float :nsep
      t.float :noct
      t.float :nnov
      t.float :ndec

      t.timestamps
    end
  end
end
