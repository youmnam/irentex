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

ActiveRecord::Schema.define(version: 20170408071735) do

  create_table "car_cats", force: :cascade do |t|
    t.string   "Name"
    t.decimal  "Price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "CategoryName"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "category_filters", force: :cascade do |t|
    t.string   "nameOfLabel"
    t.string   "typeOfLabel"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_filters", ["category_id"], name: "index_category_filters_on_category_id"

  create_table "item_attachments", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_rates", force: :cascade do |t|
    t.integer  "ir_item_id"
    t.integer  "ir_user_id"
    t.decimal  "ir_rate"
    t.text     "ir_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "item_rates", ["ir_item_id"], name: "index_item_rates_on_ir_item_id"
  add_index "item_rates", ["ir_user_id"], name: "index_item_rates_on_ir_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "item_name"
    t.string   "item_desc"
    t.decimal  "item_price"
    t.integer  "user_id",     null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"
  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "reserved_items", force: :cascade do |t|
    t.integer  "item_id"
    t.date     "res_startDate"
    t.date     "res_endDate"
    t.integer  "res_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reserved_items", ["item_id"], name: "index_reserved_items_on_item_id"
  add_index "reserved_items", ["res_user_id"], name: "index_reserved_items_on_res_user_id"

  create_table "user_rates", force: :cascade do |t|
    t.integer  "ur_owner_id"
    t.integer  "ur_user_id"
    t.decimal  "ur_trustrate"
    t.decimal  "ur_onTimeRate"
    t.text     "ur_comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_rates", ["ur_owner_id"], name: "index_user_rates_on_ur_owner_id"
  add_index "user_rates", ["ur_user_id"], name: "index_user_rates_on_ur_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "usr_fname"
    t.string   "usr_lname"
    t.string   "usr_email"
    t.string   "usr_tel"
    t.string   "usr_ppic"
    t.date     "usr_dob"
    t.string   "usr_address"
    t.string   "usr_city"
    t.string   "usr_gover"
    t.string   "usr_country"
    t.string   "password_digest"
    t.integer  "categories_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["categories_id"], name: "index_users_on_categories_id"

end
