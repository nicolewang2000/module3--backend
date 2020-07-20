# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_20_223721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drink_ingredients", force: :cascade do |t|
    t.bigint "drink_id", null: false
    t.bigint "ingredient_id", null: false
    t.string "measurement"
    t.index ["drink_id"], name: "index_drink_ingredients_on_drink_id"
    t.index ["ingredient_id"], name: "index_drink_ingredients_on_ingredient_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.string "image"
    t.string "glass"
    t.boolean "alcoholic"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "drink_id", null: false
    t.bigint "user_id", null: false
    t.index ["drink_id"], name: "index_ratings_on_drink_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
  end

  add_foreign_key "drink_ingredients", "drinks"
  add_foreign_key "drink_ingredients", "ingredients"
  add_foreign_key "ratings", "drinks"
  add_foreign_key "ratings", "users"
end
