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

ActiveRecord::Schema.define(version: 20161007095625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barrels", force: :cascade do |t|
    t.string   "type"
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
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
  end

end
