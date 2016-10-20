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

ActiveRecord::Schema.define(version: 20161020084046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string   "name"
    t.string   "origin"
    t.float    "abv"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "style_id"
  end

  create_table "beers_categories", id: false, force: :cascade do |t|
    t.integer "beer_id"
    t.integer "category_id"
    t.index ["beer_id"], name: "index_beers_categories_on_beer_id", using: :btree
    t.index ["category_id"], name: "index_beers_categories_on_category_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["status"], name: "index_categories_on_status", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "beer_id"
    t.integer  "user_id"
    t.integer  "rate"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "salt"
    t.string   "encrypted_password"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "variants", force: :cascade do |t|
    t.string   "size"
    t.integer  "price",      default: 0
    t.integer  "status",     default: 0
    t.integer  "beer_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end