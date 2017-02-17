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

ActiveRecord::Schema.define(version: 20170216024149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "complement"
    t.string   "street_type"
    t.string   "city"
    t.string   "neighborhood"
    t.string   "observation"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "building_type"
    t.string   "observation"
    t.boolean  "active",        default: true
    t.integer  "owner_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["owner_id"], name: "index_buildings_on_owner_id", using: :btree
  end

  create_table "keys", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "building_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["building_id"], name: "index_keys_on_building_id", using: :btree
  end

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.string   "mother"
    t.string   "father"
    t.string   "cpf"
    t.string   "nationality"
    t.string   "gender"
    t.date     "birthdate"
    t.string   "email"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "fax"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "real_state_agencies", force: :cascade do |t|
    t.string   "trade_name"
    t.string   "cnpj"
    t.string   "email"
    t.string   "mobile_number"
    t.string   "phone_number"
    t.string   "fax"
    t.string   "social_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "buildings", "owners"
  add_foreign_key "keys", "buildings"
end
