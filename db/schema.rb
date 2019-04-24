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

ActiveRecord::Schema.define(version: 2019_04_24_024837) do

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "teacher"
    t.string "subject"
    t.string "coursenum"
    t.string "section"
    t.integer "User_id"
    t.integer "uni_id"
    t.integer "semester_id"
    t.index ["semester_id"], name: "index_courses_on_semester_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.boolean "banned", default: false
    t.index ["banned"], name: "index_enrollments_on_banned"
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "course_id"
    t.integer "user_id"
    t.integer "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numGroups"
    t.date "availableDate"
    t.date "dueDate"
    t.boolean "pickGroups"
    t.index ["course_id"], name: "index_projects_on_course_id"
    t.index ["semester_id"], name: "index_projects_on_semester_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.integer "user_id"
    t.integer "rating"
    t.integer "created_by"
    t.integer "project_id"
    t.integer "team_id"
    t.integer "team_membership_id"
    t.index ["course_id"], name: "index_ratings_on_course_id"
    t.index ["project_id"], name: "index_ratings_on_project_id"
    t.index ["team_id"], name: "index_ratings_on_team_id"
    t.index ["team_membership_id"], name: "index_ratings_on_team_membership_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "ratings_tables", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.integer "rating"
    t.index ["team_id"], name: "index_ratings_tables_on_team_id"
    t.index ["user_id"], name: "index_ratings_tables_on_user_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "beginDate"
    t.date "endDate"
    t.string "name"
    t.integer "university_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_semesters_on_course_id"
    t.index ["university_id"], name: "index_semesters_on_university_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "courses_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_team_memberships_on_course_id"
    t.index ["project_id"], name: "index_team_memberships_on_project_id"
    t.index ["team_id"], name: "index_team_memberships_on_team_id"
    t.index ["user_id"], name: "index_team_memberships_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "groupNum"
    t.integer "course_id"
    t.integer "project_id"
    t.index ["course_id"], name: "index_teams_on_course_id"
    t.index ["project_id"], name: "index_teams_on_project_id"
  end

  create_table "universities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uniName"
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
    t.string "defRole"
    t.boolean "Instructor"
    t.boolean "Student"
    t.boolean "OrgAdmin"
    t.boolean "SuperAdmin"
    t.boolean "approved", default: false
    t.string "uniName"
    t.integer "university_id"
    t.string "fullName"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["university_id"], name: "index_users_on_university_id"
  end

end
