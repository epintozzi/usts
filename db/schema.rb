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

ActiveRecord::Schema.define(version: 20161026192239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boat_classes", force: :cascade do |t|
    t.string   "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "race_id"
    t.integer  "user_id"
    t.integer  "boat_class_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["boat_class_id"], name: "index_registrations_on_boat_class_id", using: :btree
    t.index ["race_id"], name: "index_registrations_on_race_id", using: :btree
    t.index ["user_id"], name: "index_registrations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "boat_number"
    t.string   "usts_number"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "registrations", "boat_classes"
  add_foreign_key "registrations", "races"
  add_foreign_key "registrations", "users"
end
