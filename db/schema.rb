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

ActiveRecord::Schema.define(version: 20181115063014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "street"
    t.string "city"
    t.string "country"
    t.string "zip"
    t.string "longhitude"
    t.string "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "agency_client_relationships", force: :cascade do |t|
    t.integer "agency_id"
    t.bigint "active_client_id"
    t.date "transaction_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_client_id"], name: "index_agency_client_relationships_on_active_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "industry"
    t.text "profile"
    t.date "date_established"
    t.boolean "agency"
    t.integer "client_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "school"
    t.date "from"
    t.date "to"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "employments", force: :cascade do |t|
    t.string "employment_type"
    t.bigint "client_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "employment_date"
    t.index ["client_id"], name: "index_employments_on_client_id"
    t.index ["user_id"], name: "index_employments_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.string "industry"
    t.string "company_function"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "company_size"
    t.string "info_from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_number"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "title"
    t.string "industry"
    t.integer "years_of_exp"
    t.text "description"
    t.integer "emp_needed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timelogs", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "login"
    t.date "date"
    t.datetime "logout"
    t.datetime "break_out"
    t.datetime "break_in"
    t.decimal "overtime"
    t.bigint "client_id"
    t.decimal "undertime"
    t.datetime "overtime_in"
    t.decimal "total_break_hours"
    t.decimal "total_hours"
    t.datetime "overtime_out"
    t.boolean "is_holiday"
    t.decimal "total_pay"
    t.string "valid_ot"
    t.string "shift"
    t.decimal "overtime_pay"
    t.decimal "gross_pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_timelogs_on_client_id"
    t.index ["user_id"], name: "index_timelogs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.bigint "user_id"
    t.string "position"
    t.string "company"
    t.date "from"
    t.date "to"
    t.boolean "status"
    t.text "tasks"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "agency_client_relationships", "clients", column: "active_client_id"
  add_foreign_key "educations", "users"
  add_foreign_key "employments", "clients"
  add_foreign_key "employments", "users"
  add_foreign_key "timelogs", "clients"
  add_foreign_key "timelogs", "users"
  add_foreign_key "works", "users"
end
