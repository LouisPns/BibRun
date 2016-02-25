# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160225111754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bibs", force: :cascade do |t|
    t.integer  "price"
    t.integer  "quantity"
    t.string   "sale_reason"
    t.integer  "race_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bibs", ["race_id"], name: "index_bibs_on_race_id", using: :btree
  add_index "bibs", ["user_id"], name: "index_bibs_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "bib_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["bib_id"], name: "index_orders_on_bib_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "races", force: :cascade do |t|
    t.string   "address"
    t.date     "date"
    t.integer  "distance"
    t.string   "race_type"
    t.string   "name"
    t.string   "label"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "level"
    t.string   "picture"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bibs", "races"
  add_foreign_key "bibs", "users"
  add_foreign_key "orders", "bibs"
  add_foreign_key "orders", "users"
end
