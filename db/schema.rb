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

ActiveRecord::Schema.define(version: 20151209111242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collectedplaces", force: :cascade do |t|
    t.integer  "savedplace_id"
    t.integer  "collection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "collectedplaces", ["collection_id"], name: "index_collectedplaces_on_collection_id", using: :btree
  add_index "collectedplaces", ["savedplace_id"], name: "index_collectedplaces_on_savedplace_id", using: :btree

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
    t.string   "category"
    t.string   "googleid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "savedplaces", force: :cascade do |t|
    t.integer  "place_id"
    t.integer  "user_id"
    t.integer  "usertag_id"
    t.integer  "usertip_id"
    t.integer  "userpic_id"
    t.string   "headline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "savedplaces", ["place_id"], name: "index_savedplaces_on_place_id", using: :btree
  add_index "savedplaces", ["user_id"], name: "index_savedplaces_on_user_id", using: :btree
  add_index "savedplaces", ["userpic_id"], name: "index_savedplaces_on_userpic_id", using: :btree
  add_index "savedplaces", ["usertag_id"], name: "index_savedplaces_on_usertag_id", using: :btree
  add_index "savedplaces", ["usertip_id"], name: "index_savedplaces_on_usertip_id", using: :btree

  create_table "userpics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usertags", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usertips", force: :cascade do |t|
    t.string   "tip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "collectedplaces", "collections"
  add_foreign_key "collectedplaces", "savedplaces"
  add_foreign_key "collections", "users"
  add_foreign_key "googlepics", "places"
  add_foreign_key "savedplaces", "places"
  add_foreign_key "savedplaces", "userpics"
  add_foreign_key "savedplaces", "users"
  add_foreign_key "savedplaces", "usertags"
  add_foreign_key "savedplaces", "usertips"
end
