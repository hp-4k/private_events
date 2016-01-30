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

ActiveRecord::Schema.define(version: 20160128211622) do

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.datetime "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id"
  end

  add_index "events", ["owner_id"], name: "index_events_on_owner_id"

  create_table "invitations", force: :cascade do |t|
    t.integer  "attendee_id"
    t.integer  "attended_event_id"
    t.string   "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "invitations", ["attended_event_id"], name: "index_invitations_on_attended_event_id"
  add_index "invitations", ["attendee_id"], name: "index_invitations_on_attendee_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
