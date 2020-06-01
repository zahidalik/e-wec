# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_29_170303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "topic"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_activities_on_classroom_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "exam_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_answers_on_exam_id"
    t.index ["student_id"], name: "index_answers_on_student_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.bigint "tutor_id", null: false
    t.bigint "standard_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["standard_id"], name: "index_classrooms_on_standard_id"
    t.index ["subject_id"], name: "index_classrooms_on_subject_id"
    t.index ["tutor_id"], name: "index_classrooms_on_tutor_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "topic"
    t.datetime "date"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "end_date"
    t.index ["classroom_id"], name: "index_exams_on_classroom_id"
  end

  create_table "interactions", force: :cascade do |t|
    t.string "topic"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "student_id", null: false
    t.index ["lesson_id"], name: "index_interactions_on_lesson_id"
    t.index ["student_id"], name: "index_interactions_on_student_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "topic"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_lessons_on_classroom_id"
  end

  create_table "live_sessions", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_live_sessions_on_classroom_id"
  end

  create_table "replies", force: :cascade do |t|
    t.string "topic"
    t.bigint "activity_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_replies_on_activity_id"
    t.index ["student_id"], name: "index_replies_on_student_id"
  end

  create_table "standard_students", force: :cascade do |t|
    t.bigint "standard_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["standard_id"], name: "index_standard_students_on_standard_id"
    t.index ["student_id"], name: "index_standard_students_on_student_id"
  end

  create_table "standards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact"
    t.string "gender"
    t.string "father_name"
    t.string "mother_name"
    t.string "guardian_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tutors", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "classrooms"
  add_foreign_key "answers", "exams"
  add_foreign_key "answers", "students"
  add_foreign_key "classrooms", "standards"
  add_foreign_key "classrooms", "subjects"
  add_foreign_key "classrooms", "tutors"
  add_foreign_key "exams", "classrooms"
  add_foreign_key "interactions", "lessons"
  add_foreign_key "interactions", "students"
  add_foreign_key "lessons", "classrooms"
  add_foreign_key "live_sessions", "classrooms"
  add_foreign_key "replies", "activities"
  add_foreign_key "replies", "students"
  add_foreign_key "standard_students", "standards"
  add_foreign_key "standard_students", "students"
end
