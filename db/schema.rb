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

ActiveRecord::Schema[7.0].define(version: 2022_10_21_065538) do
  create_table "contracts", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.string "kind"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner"
    t.integer "beneficiary"
    t.boolean "payable", default: false, null: false
    t.string "contract_file"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "doc_id"
    t.integer "doc_kind"
    t.string "email"
    t.string "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "city"
    t.string "postalcode"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 1
    t.string "avatar"
    t.string "about"
    t.string "phone"
    t.string "website"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contracts", "users", column: "beneficiary"
  add_foreign_key "contracts", "users", column: "owner"
end
