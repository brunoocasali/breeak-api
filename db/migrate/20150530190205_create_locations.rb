class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :latitude, precision: 10, scale: 6
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
