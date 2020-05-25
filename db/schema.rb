# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_25_142444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dinner_menus", force: :cascade do |t|
    t.string "size"
    t.string "name"
    t.integer "price"
    t.float "calorie"
    t.float "protein"
    t.float "fat"
    t.float "carbohydrate"
    t.float "dietary_fiber"
    t.integer "isSet"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lunch_menus", force: :cascade do |t|
    t.string "size"
    t.string "name"
    t.integer "price"
    t.float "calorie"
    t.float "protein"
    t.float "fat"
    t.float "carbohydrate"
    t.float "dietary_fiber"
    t.integer "isSet"
    t.integer "isValueSet"
    t.integer "isValueConb"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "morning_menus", force: :cascade do |t|
    t.string "size"
    t.string "name"
    t.integer "price"
    t.float "calorie"
    t.float "protein"
    t.float "fat"
    t.float "carbohydrate"
    t.float "dietary_fiber"
    t.integer "isSet"
    t.integer "isSetNoSide"
    t.integer "isConb"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_hambargers", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.float "calorie"
    t.float "protein"
    t.float "fat"
    t.float "carbohydrate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "dietary_fiber"
  end

end
