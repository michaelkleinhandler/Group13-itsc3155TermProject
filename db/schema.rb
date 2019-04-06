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

ActiveRecord::Schema.define(version: 2019_04_04_180557) do

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "teacher"
    t.string "semester"
    t.integer "year"
    t.string "subject"
    t.string "coursenum"
    t.string "section"
    t.integer "randID"
  end

  create_table "semesters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "beginDate"
    t.date "endDate"
    t.string "name"
    t.integer "uni_id"
    t.index ["uni_id"], name: "index_semesters_on_uni_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "courses_id"
    t.index ["courses_id"], name: "index_students_on_courses_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uniName"
    t.integer "uniID_id"
    t.integer "uni_id"
    t.index ["uniID_id"], name: "index_universities_on_uniID_id"
    t.index ["uni_id"], name: "index_universities_on_uni_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstName"
    t.string "lastName"
    t.text "bio"
    t.string "image", default: "/images/profileImages/kid yelling.jpg"
    t.string "university"
    t.string "defRole"
    t.boolean "Instructor"
    t.boolean "Student"
    t.boolean "OrgAdmin"
    t.boolean "SuperAdmin"
    t.boolean "approved", default: false
    t.integer "UserID"
    t.integer "uni_id"
    t.string "uniName"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
