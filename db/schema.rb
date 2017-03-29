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

ActiveRecord::Schema.define(version: 20170328235754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.integer  "person_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "code"
    t.index ["person_id"], name: "index_buildings_on_person_id", using: :btree
  end

  create_table "keys", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "building_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "status",      default: "available"
    t.index ["building_id"], name: "index_keys_on_building_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "mother"
    t.string   "father"
    t.string   "cpf_cnpj"
    t.string   "nationality"
    t.string   "gender"
    t.date     "birthdate"
    t.string   "email"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "fax"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "personable_type"
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
    t.string   "avatar"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "start_at"
    t.string   "observation"
    t.integer  "owner_id"
    t.integer  "visitor_id"
    t.integer  "building_id"
    t.integer  "key_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "finished_at"
    t.integer  "realtor_id"
    t.index ["building_id"], name: "index_visits_on_building_id", using: :btree
    t.index ["key_id"], name: "index_visits_on_key_id", using: :btree
    t.index ["owner_id"], name: "index_visits_on_owner_id", using: :btree
    t.index ["realtor_id"], name: "index_visits_on_realtor_id", using: :btree
    t.index ["visitor_id"], name: "index_visits_on_visitor_id", using: :btree
  end

  add_foreign_key "buildings", "people"
  add_foreign_key "keys", "buildings"
  add_foreign_key "visits", "buildings"
  add_foreign_key "visits", "keys"
end
