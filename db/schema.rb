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

ActiveRecord::Schema.define(version: 20160514112906) do

  create_table "meals", force: :cascade do |t|
    t.string   "name",    limit: 255
    t.datetime "date"
    t.integer  "user_id", limit: 4
  end

  add_index "meals", ["user_id"], name: "index_meals_on_user_id", using: :btree

  create_table "meals_products", id: false, force: :cascade do |t|
    t.integer "meal_id",    limit: 4, null: false
    t.integer "product_id", limit: 4, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string  "name", limit: 255
    t.integer "kcal", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",                    null: false
    t.string   "encrypted_password",     limit: 255, default: "",                    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "name",                   limit: 255, default: "Sample user"
    t.datetime "date_of_birth",                      default: '2016-05-03 15:09:12'
    t.boolean  "is_female",                          default: false
    t.string   "address",                limit: 255
    t.string   "phone",                  limit: 255
    t.integer  "weight",                 limit: 4,   default: 50
    t.integer  "height",                 limit: 4,   default: 174
    t.integer  "kcal_per_day",           limit: 4,   default: 1800
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "meals", "users"
end
