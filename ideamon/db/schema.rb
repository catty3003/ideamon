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

ActiveRecord::Schema.define(version: 20150728065513) do

  create_table "creativitycards", force: :cascade do |t|
    t.string   "title"
    t.text     "suggestion"
    t.text     "example"
    t.string   "image"
    t.integer  "idea_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "shortdescription"
  end

  create_table "ideas", force: :cascade do |t|
    t.text     "post"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kreativismen", force: :cascade do |t|
    t.text     "suggestion"
    t.integer  "idea_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.date     "deadline"
    t.boolean  "done"
    t.string   "question"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string   "1"
    t.string   "2"
    t.string   "3"
    t.string   "4"
    t.string   "5"
    t.string   "6"
    t.string   "7"
    t.string   "8"
    t.string   "9"
    t.string   "10"
    t.string   "11"
    t.string   "12"
    t.string   "13"
    t.string   "14"
    t.string   "15"
    t.string   "16"
    t.string   "17"
    t.string   "18"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "f1"
    t.string   "f2"
    t.string   "f3"
    t.string   "f4"
    t.string   "f5"
    t.string   "f6"
    t.string   "f7"
    t.string   "f8"
    t.string   "f9"
    t.string   "f10"
    t.string   "f11"
    t.string   "f12"
    t.string   "f13"
    t.string   "f14"
    t.text     "f15"
    t.string   "f16"
    t.string   "f17"
    t.text     "f18"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "username"
    t.integer  "age"
    t.string   "sex"
    t.string   "nationality"
    t.string   "qualification"
    t.string   "profession"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
