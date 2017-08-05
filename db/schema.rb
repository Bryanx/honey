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

ActiveRecord::Schema.define(version: 20170803200900) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "company_type"
    t.string "company_image_file_name"
    t.string "company_image_content_type"
    t.integer "company_image_file_size"
    t.datetime "company_image_updated_at"
    t.string "phone_number"
    t.string "address"
    t.string "country"
    t.string "founded"
    t.string "spokesman"
    t.string "website"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact_image_file_name"
    t.string "contact_image_content_type"
    t.integer "contact_image_file_size"
    t.datetime "contact_image_updated_at"
    t.date "birthday"
    t.string "website"
    t.string "phone_number1"
    t.string "phone_number2"
    t.string "address"
    t.string "notes"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "favorite"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["contact_id"], name: "index_jobs_on_contact_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
