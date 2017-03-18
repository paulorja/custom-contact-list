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

ActiveRecord::Schema.define(version: 20170318010737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combo_box_field_values", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "field_id"
    t.integer  "selected_option_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "combo_box_field_values", ["contact_id"], name: "index_combo_box_field_values_on_contact_id", using: :btree
  add_index "combo_box_field_values", ["field_id"], name: "index_combo_box_field_values_on_field_id", using: :btree

  create_table "combo_box_options", force: :cascade do |t|
    t.string   "name"
    t.integer  "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "combo_box_options", ["field_id"], name: "index_combo_box_options_on_field_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "fields", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "field_type"
  end

  add_index "fields", ["user_id"], name: "index_fields_on_user_id", using: :btree

  create_table "text_area_field_values", force: :cascade do |t|
    t.integer  "field_id"
    t.integer  "contact_id"
    t.text     "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "text_area_field_values", ["contact_id"], name: "index_text_area_field_values_on_contact_id", using: :btree
  add_index "text_area_field_values", ["field_id"], name: "index_text_area_field_values_on_field_id", using: :btree

  create_table "text_field_values", force: :cascade do |t|
    t.integer  "field_id"
    t.integer  "contact_id"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "text_field_values", ["contact_id"], name: "index_text_field_values_on_contact_id", using: :btree
  add_index "text_field_values", ["field_id"], name: "index_text_field_values_on_field_id", using: :btree

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

  add_foreign_key "combo_box_field_values", "contacts"
  add_foreign_key "combo_box_field_values", "fields"
  add_foreign_key "combo_box_options", "fields"
  add_foreign_key "contacts", "users"
  add_foreign_key "fields", "users"
  add_foreign_key "text_area_field_values", "contacts"
  add_foreign_key "text_area_field_values", "fields"
  add_foreign_key "text_field_values", "contacts"
  add_foreign_key "text_field_values", "fields"
end
