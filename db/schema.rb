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

ActiveRecord::Schema.define(version: 20150422113253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "city_councils", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "city_councils", ["slug"], name: "index_city_councils_on_slug", using: :btree

  create_table "family_general_incomes", force: :cascade do |t|
    t.integer  "amount_hryvna"
    t.integer  "finance_disclosure_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "family_general_incomes", ["finance_disclosure_id"], name: "index_family_general_incomes_on_finance_disclosure_id", using: :btree

  create_table "finance_disclosures", force: :cascade do |t|
    t.date     "submitted"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "year"
    t.integer  "official_id"
  end

  add_index "finance_disclosures", ["official_id"], name: "index_finance_disclosures_on_official_id", using: :btree

  create_table "general_incomes", force: :cascade do |t|
    t.integer  "amount_hryvna"
    t.integer  "finance_disclosure_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "general_incomes", ["finance_disclosure_id"], name: "index_general_incomes_on_finance_disclosure_id", using: :btree

  create_table "incomes", force: :cascade do |t|
    t.integer  "amount_kopiyok",        default: 0,     null: false
    t.string   "amount_currency",       default: "UAH", null: false
    t.integer  "finance_disclosure_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "amount_hryvna",         default: 0
  end

  create_table "officials", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "position_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "city_council_id"
  end

  add_index "officials", ["city_council_id"], name: "index_officials_on_city_council_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "short"
    t.string   "full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "positions", ["slug"], name: "index_positions_on_slug", using: :btree

  create_table "properties", force: :cascade do |t|
    t.decimal  "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
