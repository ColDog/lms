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

ActiveRecord::Schema.define(version: 20151016183813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "schedule_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attendances", ["schedule_id"], name: "index_attendances_on_schedule_id", using: :btree
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree

  create_table "certification_items", force: :cascade do |t|
    t.integer  "certification_id",   null: false
    t.string   "verification_key",   null: false
    t.integer  "learning_object_id", null: false
    t.integer  "course_id",          null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "certification_items", ["certification_id"], name: "index_certification_items_on_certification_id", using: :btree
  add_index "certification_items", ["course_id"], name: "index_certification_items_on_course_id", using: :btree
  add_index "certification_items", ["learning_object_id"], name: "index_certification_items_on_learning_object_id", using: :btree

  create_table "certifications", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "course_steps", force: :cascade do |t|
    t.integer  "course_id",   null: false
    t.string   "name",        null: false
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
    t.integer  "course_id"
    t.integer  "user_id"
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

  create_table "learning_objects", force: :cascade do |t|
    t.string   "name",           null: false
    t.text     "description"
    t.json     "fields"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "course_step_id"
    t.string   "category"
  end

  add_index "learning_objects", ["course_step_id"], name: "index_learning_objects_on_course_step_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.integer  "course_step_id", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "participants", ["course_step_id"], name: "index_participants_on_course_step_id", using: :btree
  add_index "participants", ["user_id"], name: "index_participants_on_user_id", using: :btree

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

  create_table "user_certifications", force: :cascade do |t|
    t.integer  "certification_item_id", null: false
    t.integer  "user_id",               null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "user_certifications", ["certification_item_id"], name: "index_user_certifications_on_certification_item_id", using: :btree
  add_index "user_certifications", ["user_id"], name: "index_user_certifications_on_user_id", using: :btree

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

  create_table "user_learning_objects", force: :cascade do |t|
    t.json     "answers"
    t.boolean  "passed"
    t.decimal  "score"
    t.integer  "user_id",            null: false
    t.integer  "learning_object_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "user_learning_objects", ["learning_object_id"], name: "index_user_learning_objects_on_learning_object_id", using: :btree
  add_index "user_learning_objects", ["user_id"], name: "index_user_learning_objects_on_user_id", using: :btree

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

  add_foreign_key "attendances", "schedules"
  add_foreign_key "attendances", "users"
  add_foreign_key "certification_items", "certifications"
  add_foreign_key "certification_items", "courses"
  add_foreign_key "certification_items", "learning_objects"
  add_foreign_key "course_steps", "courses"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "fields", "groups"
  add_foreign_key "groups", "roles"
  add_foreign_key "learning_objects", "course_steps"
  add_foreign_key "participants", "course_steps"
  add_foreign_key "participants", "users"
  add_foreign_key "schedules", "course_steps"
  add_foreign_key "user_certifications", "certification_items"
  add_foreign_key "user_certifications", "users"
  add_foreign_key "user_fields", "fields"
  add_foreign_key "user_fields", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
  add_foreign_key "user_learning_objects", "learning_objects"
  add_foreign_key "user_learning_objects", "users"
  add_foreign_key "users", "roles"
end
