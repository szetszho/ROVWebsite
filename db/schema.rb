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

ActiveRecord::Schema.define(version: 20170706101012) do

  create_table "course_associations", force: :cascade do |t|
    t.integer  "successor_id", null: false
    t.integer  "precursor_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["successor_id", "precursor_id"], name: "index_course_associations"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.string   "code",                                   null: false
    t.text     "description"
    t.integer  "required_departments_count", default: 0
    t.integer  "sessions_count",             default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["code"], name: "index_courses_on_code"
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "short_name",                        null: false
    t.string   "full_name",                         null: false
    t.integer  "members_count",         default: 0
    t.integer  "require_courses_count", default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["full_name"], name: "index_departments_on_full_name"
    t.index ["short_name"], name: "index_departments_on_short_name"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "receipt_id"
    t.string   "reference_number"
    t.string   "name"
    t.text     "description"
    t.decimal  "unit_price"
    t.decimal  "quantities"
    t.decimal  "discount"
    t.decimal  "total_price"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["receipt_id"], name: "index_items_on_receipt_id"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name",                                  null: false
    t.string   "student_id",                            null: false
    t.integer  "department_id"
    t.string   "phone"
    t.integer  "registered_sessions_count", default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["student_id"], name: "index_members_on_student_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "participant_id",        null: false
    t.integer  "registered_session_id", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["participant_id", "registered_session_id"], name: "index_participations"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.integer  "required_department_id", null: false
    t.integer  "require_course_id",      null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["required_department_id", "require_course_id"], name: "index_requirements"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "course_id",                      null: false
    t.datetime "start_time",                     null: false
    t.datetime "end_time",                       null: false
    t.integer  "participants_count", default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["course_id", "start_time", "end_time"], name: "index_sessions"
  end

end
