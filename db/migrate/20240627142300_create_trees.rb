class CreateTrees < ActiveRecord::Migration[7.1]
  def change
    create_table :trees do |t|
      t.string :tree_id
      t.string :botanical
      t.string :common
      t.string :x
      t.string :y
      t.string :nbhd
      t.string :park
      t.string :loc_class
      t.string :street

      t.timestamps
    end
  end
end
