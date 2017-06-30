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

ActiveRecord::Schema.define(version: 20170622041543) do

  create_table "blast_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "blasts", force: :cascade do |t|
    t.integer  "blast_type_id"
    t.integer  "schedule_id"
    t.string   "name"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["blast_type_id"], name: "index_blasts_on_blast_type_id"
    t.index ["schedule_id"], name: "index_blasts_on_schedule_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.integer  "age"
    t.date     "birthdate"
    t.boolean  "opt_in_a"
    t.boolean  "opt_in_b"
    t.boolean  "opt_in_c"
    t.boolean  "confirmed_number"
    t.text     "notes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "phone_number_id"
    t.index ["phone_number_id"], name: "index_contacts_on_phone_number_id"
  end

  create_table "contest_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contests", force: :cascade do |t|
    t.integer  "contest_type_id"
    t.integer  "schedule_id"
    t.string   "name"
    t.text     "description"
    t.string   "texter_x"
    t.string   "texter_y"
    t.string   "keyword"
    t.string   "caller_x"
    t.string   "caller_y"
    t.integer  "survey_id"
    t.string   "winner"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["contest_type_id"], name: "index_contests_on_contest_type_id"
    t.index ["schedule_id"], name: "index_contests_on_schedule_id"
    t.index ["survey_id"], name: "index_contests_on_survey_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "my_number_id"
    t.integer  "from_number_id"
    t.datetime "seen_at"
    t.datetime "deleted_at"
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["from_number_id"], name: "index_conversations_on_from_number_id"
    t.index ["my_number_id"], name: "index_conversations_on_my_number_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "phone_number_id"
    t.datetime "twilio_date_created"
    t.datetime "twilio_date_updated"
    t.datetime "date_sent"
    t.string   "account_sid"
    t.string   "to"
    t.string   "from"
    t.text     "body"
    t.string   "status"
    t.string   "flag"
    t.string   "api_version"
    t.string   "price"
    t.string   "uri"
    t.text     "twilio_data"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "date_seen"
    t.string   "to_country"
    t.string   "to_state"
    t.string   "sms_message_sid"
    t.integer  "num_media"
    t.string   "to_city"
    t.string   "from_zip"
    t.string   "from_state"
    t.string   "sms_status"
    t.string   "from_city"
    t.string   "from_country"
    t.string   "to_zip"
    t.integer  "num_segments"
    t.string   "message_sid"
    t.string   "sms_sid"
    t.integer  "conversation_id"
    t.datetime "deleted_at"
    t.index ["contact_id"], name: "index_messages_on_contact_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["phone_number_id"], name: "index_messages_on_phone_number_id"
  end

  create_table "my_numbers", force: :cascade do |t|
    t.string   "name"
    t.integer  "phone_number_id"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["phone_number_id"], name: "index_my_numbers_on_phone_number_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "number"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "schedule_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "schedule_type_id"
    t.string   "name"
    t.text     "description"
    t.datetime "last_run"
    t.datetime "next_run"
    t.boolean  "active"
    t.string   "status"
    t.text     "error_message"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["schedule_type_id"], name: "index_schedules_on_schedule_type_id"
  end

  create_table "survey_question_responses", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "survey_id"
    t.integer  "survey_question_id"
    t.boolean  "boolean_response"
    t.integer  "rate_response"
    t.text     "written_response"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["contact_id"], name: "index_survey_question_responses_on_contact_id"
    t.index ["survey_id"], name: "index_survey_question_responses_on_survey_id"
    t.index ["survey_question_id"], name: "index_survey_question_responses_on_survey_question_id"
  end

  create_table "survey_question_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "survey_questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "survey_question_type_id"
    t.text     "question"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["survey_id"], name: "index_survey_questions_on_survey_id"
    t.index ["survey_question_type_id"], name: "index_survey_questions_on_survey_question_type_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "schedule_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["schedule_id"], name: "index_surveys_on_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
