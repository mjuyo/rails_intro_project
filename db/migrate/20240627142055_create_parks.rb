class CreateParks < ActiveRecord::Migration[7.1]
  def change
    create_table :parks do |t|
      t.string :park_id
      t.string :park_name
      t.text :the_geom
      t.string :location
      t.string :nbhd
      t.float :area_ha

      t.timestamps
    end
  end
end
