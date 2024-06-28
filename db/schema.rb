# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_27_170224) do
  create_table "assets", force: :cascade do |t|
    t.string "asset_id"
    t.string "asset_class"
    t.string "park_id"
    t.string "park_name"
    t.string "asset_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parks", force: :cascade do |t|
    t.string "park_id"
    t.string "park_name"
    t.text "the_geom"
    t.string "location"
    t.string "nbhd"
    t.float "area_ha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_parks_on_park_id", unique: true
  end

  create_table "trees", force: :cascade do |t|
    t.string "tree_id"
    t.string "botanical"
    t.string "common"
    t.string "x"
    t.string "y"
    t.string "nbhd"
    t.string "park"
    t.string "loc_class"
    t.string "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assets", "parks", primary_key: "park_id"
end
