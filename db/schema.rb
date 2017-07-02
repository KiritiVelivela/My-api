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

ActiveRecord::Schema.define(version: 20170701140947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blacklisted_customers", force: :cascade do |t|
    t.boolean "blacklisted"
    t.string "reason"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_blacklisted_customers_on_customer_id"
  end

  create_table "cameras", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.bigint "traject_id"
    t.datetime "position_changed"
    t.boolean "blacklist"
    t.bigint "blacklisted_customer_id"
    t.bigint "emotions_id"
    t.index ["blacklisted_customer_id"], name: "index_customers_on_blacklisted_customer_id"
    t.index ["emotions_id"], name: "index_customers_on_emotions_id"
    t.index ["traject_id"], name: "index_customers_on_traject_id"
  end

  create_table "emotions", force: :cascade do |t|
    t.string "emotion"
    t.datetime "frame"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.index ["customer_id"], name: "index_emotions_on_customer_id"
  end

  create_table "faces", force: :cascade do |t|
    t.string "image_pathname"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "camera_id"
    t.index ["camera_id"], name: "index_faces_on_camera_id"
    t.index ["customer_id"], name: "index_faces_on_customer_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trajects", force: :cascade do |t|
    t.string "trajectory"
    t.bigint "customer_id"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "position_changed", default: "2017-06-26 16:49:48"
    t.index ["customer_id"], name: "index_trajects_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "blacklisted_customers", "customers"
  add_foreign_key "customers", "blacklisted_customers"
  add_foreign_key "customers", "emotions", column: "emotions_id"
  add_foreign_key "customers", "trajects"
  add_foreign_key "emotions", "customers"
  add_foreign_key "faces", "cameras"
  add_foreign_key "faces", "customers"
  add_foreign_key "orders", "customers"
  add_foreign_key "trajects", "customers"
  add_foreign_key "users", "roles"
end
