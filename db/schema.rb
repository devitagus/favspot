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

ActiveRecord::Schema.define(version: 20151213164911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "googlepics", force: :cascade do |t|
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "googlepics", ["place_id"], name: "index_googlepics_on_place_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "categories"
    t.string   "googleid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.json     "google_result"
    t.string   "search_query"
    t.string   "photos"
    t.string   "rating"
    t.string   "phone"
  end

  create_table "savedplaces", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.string   "headline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tip"
    t.string   "tag"
    t.string   "notes"
  end

  add_index "savedplaces", ["place_id"], name: "index_savedplaces_on_place_id", using: :btree
  add_index "savedplaces", ["user_id"], name: "index_savedplaces_on_user_id", using: :btree

  create_table "userpics", force: :cascade do |t|
    t.integer  "savedplace_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "userpics", ["savedplace_id"], name: "index_userpics_on_savedplace_id", using: :btree

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
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usertags", force: :cascade do |t|
    t.string   "tag"
    t.integer  "savedplace_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "usertags", ["savedplace_id"], name: "index_usertags_on_savedplace_id", using: :btree

  create_table "usertips", force: :cascade do |t|
    t.string   "tip"
    t.integer  "savedplace_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "usertips", ["savedplace_id"], name: "index_usertips_on_savedplace_id", using: :btree

  add_foreign_key "collections", "users"
  add_foreign_key "googlepics", "places"
  add_foreign_key "savedplaces", "places"
  add_foreign_key "savedplaces", "users"
  add_foreign_key "userpics", "savedplaces"
  add_foreign_key "usertags", "savedplaces"
  add_foreign_key "usertips", "savedplaces"
end
