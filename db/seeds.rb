# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'
require 'open-uri'

# Fetching and seeding parks
parks_url = 'https://data.winnipeg.ca/resource/nh34-5ztm.json'
parks_data = JSON.parse(URI.open(parks_url).read)

parks_data.each do |park|
    Park.create(
        park_id: park['park_id'],
        park_name: park['park_name'],
        the_geom: park['the_geom'],
        location: park['location'],
        nbhd: park['nbhd'],
        area_ha: park['area_ha'].to_f
    )
end

# Fetching and seeding trees
trees_url = 'https://data.winnipeg.ca/resource/h923-dxid.json'
trees_data =JSON.parse(URI.open(trees_url).read)

trees_data.each do |tree|
    park = Park.find_by(park_name: tree['park'])
    Tree.create(
        tree_id: tree['tree_id'],
        botanical: tree['botanical'],
        common: tree['common'],
        x: tree['x'],
        y: tree['y'],
        nbhd: tree['nbhd'],
        park: park.present? ? park : nil,
        loc_class: tree['loc_class'],
        street: tree['street']
    )
end

# Fetching and seeding assets
assets_url = 'https://data.winnipeg.ca/resource/dk7c-zxyd.json'
assets_data = JSON.parse(URI.open(assets_url).read)
assets_data.each do |asset|
  park = Park.find_by(park_id: asset['park_id'])
  Asset.create(
    asset_id: asset['asset_id'],
    asset_class: asset['asset_class'],
    park: park,
    park_name: asset['park_name'],
    asset_type: asset['asset_type']
  )
end