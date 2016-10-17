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

ActiveRecord::Schema.define(version: 20161017151818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barrel_statuses", force: :cascade do |t|
    t.float    "temperature"
    t.datetime "temperature_tstmp"
    t.string   "state"
    t.integer  "barrel_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "battery_level"
  end

  create_table "barrels", force: :cascade do |t|
    t.string   "barrel_type"
    t.integer  "number"
    t.integer  "content"
    t.text     "type_details"
    t.integer  "rnpa"
    t.text     "description"
    t.integer  "alcohol"
    t.integer  "ibu"
    t.string   "ingredients"
    t.date     "elaboration_date"
    t.date     "expiration_date"
    t.integer  "lot"
    t.text     "comments"
    t.integer  "store_id"
    t.integer  "transport_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "mac_address"
  end

  create_table "stores", force: :cascade do |t|
    t.float    "lat"
    t.float    "lon"
    t.string   "name"
    t.string   "social_reason"
    t.string   "cuit"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "last_heartbeat"
    t.string   "store_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "temperature"
    t.string   "mac_address"
    t.string   "address"
  end

  create_table "transports", force: :cascade do |t|
    t.integer  "number"
    t.float    "current_lat"
    t.float    "current_lon"
    t.integer  "temperature"
    t.datetime "temperature_date"
    t.string   "identification"
    t.string   "phone_number"
    t.string   "driver"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "mac_address"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
