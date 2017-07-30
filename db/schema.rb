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

ActiveRecord::Schema.define(version: 20170730131420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "keyword"
    t.string "winner"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "second_winner"
    t.string "third_winner"
    t.string "fourth_winner"
    t.string "fifth_winner"
    t.integer "nth_listener"
  end

  create_table "competitors", force: :cascade do |t|
    t.string "phone_number"
    t.bigint "competition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_competitors_on_competition_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_conversations_on_sender_id", unique: true
  end

  create_table "listeners", force: :cascade do |t|
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "number"
    t.string "text"
    t.boolean "inbound"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "listener_id"
    t.bigint "conversation_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["listener_id"], name: "index_messages_on_listener_id"
  end

  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "listeners"
end
