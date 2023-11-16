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

ActiveRecord::Schema[7.1].define(version: 2023_11_16_051114) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inns", force: :cascade do |t|
    t.string "brand_name"
    t.string "corporate_name"
    t.integer "cnpj"
    t.integer "contact_phone"
    t.string "email"
    t.string "full_address"
    t.string "state"
    t.string "city"
    t.integer "zip_code"
    t.text "description"
    t.integer "rooms_max"
    t.boolean "pets_accepted"
    t.boolean "breakfast"
    t.boolean "camping"
    t.string "accessibility"
    t.string "boolean"
    t.text "policies"
    t.string "payment_methods"
    t.time "check_in_time"
    t.time "check_out_time"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_inns_on_user_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "owner_name"
    t.string "social_name"
    t.string "gender"
    t.string "pronouns"
    t.integer "age"
    t.integer "tax_id"
    t.integer "id_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.decimal "daily_rate"
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_prices_on_room_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "number_of_guests"
    t.string "status"
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "dimension"
    t.integer "max_occupancy"
    t.decimal "daily_rate"
    t.boolean "bathroom"
    t.boolean "balcony"
    t.boolean "air_conditioning"
    t.boolean "tv"
    t.boolean "wardrobe"
    t.boolean "safe"
    t.boolean "accessible"
    t.boolean "available"
    t.integer "inn_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inn_id"], name: "index_rooms_on_inn_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_visitors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_visitors_on_reset_password_token", unique: true
  end

  add_foreign_key "inns", "users"
  add_foreign_key "prices", "rooms"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "rooms", "inns"
end
