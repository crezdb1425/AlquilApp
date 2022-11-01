# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_01_211012) do
  create_table "cars", force: :cascade do |t|
    t.string "plate", null: false
    t.string "insurance", null: false
    t.string "brand", null: false
    t.string "model", null: false
    t.integer "kilometers", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.date "expire"
    t.string "photo"
    t.integer "state", default: 0
    t.string "motive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "dni", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0
    t.integer "license_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["license_id"], name: "index_users_on_license_id"
  end

  add_foreign_key "users", "licenses"
end
