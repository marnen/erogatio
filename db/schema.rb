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

ActiveRecord::Schema.define(version: 2019_11_01_212651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # These are the common tables managed
  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.date "date", null: false
    t.bigint "work_unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_unit_id"], name: "index_payments_on_work_unit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "work_units", force: :cascade do |t|
    t.date "date", null: false
    t.string "description"
    t.interval "hours", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "pay", precision: 10, scale: 2
    t.date "payment_due"
    t.bigint "client_id", null: false
    t.index ["client_id"], name: "index_work_units_on_client_id"
  end

  add_foreign_key "clients", "users"
  add_foreign_key "payments", "work_units"
  add_foreign_key "work_units", "clients"
end
