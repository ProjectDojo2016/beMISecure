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

ActiveRecord::Schema.define(version: 20180317163034) do


  create_table "chains", force: :cascade do |t|
    t.string   "status"
    t.string   "model"
    t.integer  "securityLevel"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "station_id"
    t.index ["station_id"], name: "index_chains_on_station_id"
  end

  create_table "commands", force: :cascade do |t|
    t.string   "azione"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.         "reference"
  end

  create_table "parking_events", force: :cascade do |t|
    t.datetime "parkrequest"
    t.datetime "parkallowed"
    t.datetime "parkcompleted"
    t.datetime "getbikerequest"
    t.datetime "getbikecompleted"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "chain_id"
    t.index ["chain_id"], name: "index_parking_events_on_chain_id"
    t.index ["user_id"], name: "index_parking_events_on_user_id"
  end

  create_table "phone_requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "chain_id"
    t.integer  "user_id"
    t.string   "response"
    t.index ["chain_id"], name: "index_phone_requests_on_chain_id"
    t.index ["user_id"], name: "index_phone_requests_on_user_id"
  end

  create_table "parking_events", force: :cascade do |t|
    t.datetime "parkrequest"
    t.datetime "parkallowed"
    t.datetime "parkcompleted"
    t.datetime "getbikerequest"

    t.datetime "getbikecompleted"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "chain_id"
    t.integer  "user_id"
    t.index ["chain_id"], name: "index_parking_events_on_chain_id"
    t.index ["user_id"], name: "index_parking_events_on_user_id"
  end

  create_table "phone_requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "chain_id"
    t.integer  "user_id"

    t.string   "response"

    t.index ["chain_id"], name: "index_phone_requests_on_chain_id"
    t.index ["user_id"], name: "index_phone_requests_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.integer  "position"
    t.integer  "number_chains"
    t.integer  "station_number"
    t.integer  "free_chains"
    t.string   "station_name"
    t.integer  "lockers"
    t.integer  "security"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "lat"
    t.decimal  "long"
    t.string   "address"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.date     "birthdate"
    t.string   "phonenumber"
    t.string   "password"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
