class CreateAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :assets do |t|
      t.string :asset_id
      t.string :asset_class
      t.string :park_id
      t.string :park_name
      t.string :asset_type

      t.timestamps
    end

    add_foreign_key :assets, :parks, column: :park_id, primary_key: :park_id
  end
end
