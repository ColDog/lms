# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 1) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.string   "file"
    t.text     "answer"
    t.boolean  "correct"
    t.decimal  "score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "course_step_id", null: false
    t.integer  "order"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "articles", ["course_step_id"], name: "index_articles_on_course_step_id", using: :btree

  create_table "assignments", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "name"
    t.string   "category"
    t.decimal  "is_worth"
    t.decimal  "required_score"
    t.boolean  "required",       default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "assignments", ["course_id"], name: "index_assignments_on_course_id", using: :btree

  create_table "attendances", force: :cascade do |t|
    t.integer  "schedule_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attendances", ["schedule_id"], name: "index_attendances_on_schedule_id", using: :btree
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree

  create_table "certifications", force: :cascade do |t|
    t.integer  "course_id",  null: false
    t.integer  "user_id",    null: false
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "certifications", ["course_id"], name: "index_certifications_on_course_id", using: :btree
  add_index "certifications", ["user_id"], name: "index_certifications_on_user_id", using: :btree

  create_table "course_steps", force: :cascade do |t|
    t.integer  "course_id",   null: false
    t.string   "name",        null: false
    t.integer  "order"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "course_steps", ["course_id"], name: "index_course_steps_on_course_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "course_id",  null: false
    t.integer  "user_id",    null: false
    t.boolean  "passed"
    t.decimal  "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "fields", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.string   "name"
    t.string   "validation"
    t.text     "options"
    t.boolean  "required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fields", ["group_id"], name: "index_fields_on_group_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "location"
    t.string   "category"
    t.integer  "role_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "groups", ["role_id"], name: "index_groups_on_role_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.integer  "course_step_id", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "participants", ["course_step_id"], name: "index_participants_on_course_step_id", using: :btree
  add_index "participants", ["user_id"], name: "index_participants_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "src"
    t.string   "name"
    t.integer  "imageable_id",   null: false
    t.string   "imageable_type", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "assignment_id",                   null: false
    t.string   "category"
    t.text     "question"
    t.text     "options"
    t.text     "correct"
    t.integer  "order"
    t.boolean  "computer_marked", default: false
    t.boolean  "user_marked",     default: false
    t.boolean  "upload_required", default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "questions", ["assignment_id"], name: "index_questions_on_assignment_id", using: :btree

  create_table "requirements", force: :cascade do |t|
    t.integer  "course_id",     null: false
    t.integer  "schedule_id"
    t.integer  "assignment_id"
    t.decimal  "score"
    t.decimal  "weight"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "requirements", ["assignment_id"], name: "index_requirements_on_assignment_id", using: :btree
  add_index "requirements", ["course_id"], name: "index_requirements_on_course_id", using: :btree
  add_index "requirements", ["schedule_id"], name: "index_requirements_on_schedule_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",                               null: false
    t.boolean  "super_user",         default: false
    t.boolean  "can_edit_employees", default: false
    t.boolean  "can_edit_own",       default: false
    t.boolean  "can_create_content", default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "course_step_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "schedules", ["course_step_id"], name: "index_schedules_on_course_step_id", using: :btree

  create_table "setups", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "brand"
    t.boolean  "public_create"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "slide_shows", force: :cascade do |t|
    t.string   "source"
    t.integer  "order"
    t.integer  "course_step_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "slide_shows", ["course_step_id"], name: "index_slide_shows_on_course_step_id", using: :btree

  create_table "user_fields", force: :cascade do |t|
    t.integer  "field_id",   null: false
    t.integer  "user_id",    null: false
    t.string   "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_fields", ["field_id"], name: "index_user_fields_on_field_id", using: :btree
  add_index "user_fields", ["user_id"], name: "index_user_fields_on_user_id", using: :btree

  create_table "user_groups", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_groups", ["group_id"], name: "index_user_groups_on_group_id", using: :btree
  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                                null: false
    t.json     "dashboard"
    t.json     "tabs"
    t.json     "data"
    t.integer  "role_id",                             null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "source"
    t.integer  "order"
    t.integer  "course_step_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "videos", ["course_step_id"], name: "index_videos_on_course_step_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "articles", "course_steps"
  add_foreign_key "assignments", "courses"
  add_foreign_key "attendances", "schedules"
  add_foreign_key "attendances", "users"
  add_foreign_key "certifications", "courses"
  add_foreign_key "certifications", "users"
  add_foreign_key "course_steps", "courses"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "fields", "groups"
  add_foreign_key "groups", "roles"
  add_foreign_key "participants", "course_steps"
  add_foreign_key "participants", "users"
  add_foreign_key "questions", "assignments"
  add_foreign_key "requirements", "assignments"
  add_foreign_key "requirements", "courses"
  add_foreign_key "requirements", "schedules"
  add_foreign_key "schedules", "course_steps"
  add_foreign_key "slide_shows", "course_steps"
  add_foreign_key "user_fields", "fields"
  add_foreign_key "user_fields", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "videos", "course_steps"
end
