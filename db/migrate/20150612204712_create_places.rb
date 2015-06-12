class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.float :latitude
      t.float :longitude
      t.string :country
      t.string :zip
      t.string :address

      t.timestamps null: false
    end
  end
end
