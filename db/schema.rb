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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111211181451) do

  create_table "action_item_statuses", :force => true do |t|
    t.string   "name",       :limit => 15
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "action_items", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "action_item_status_id"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "due"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "action_items", ["topic_id"], :name => "index_action_items_on_topic_id"
  add_index "action_items", ["user_id"], :name => "index_action_items_on_user_id"

  create_table "meeting_people", :force => true do |t|
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.boolean  "manager",    :default => false
    t.boolean  "present",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meeting_people", ["meeting_id"], :name => "index_meeting_people_on_meeting_id"
  add_index "meeting_people", ["user_id"], :name => "index_meeting_people_on_user_id"

# Could not dump table "meetings" because of following StandardError
#   Unknown type 'bolean' for column 'closed'

  create_table "topics", :force => true do |t|
    t.integer  "meeting_id"
    t.string   "title"
    t.text     "description"
    t.integer  "time"
    t.text     "conclusion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["meeting_id"], :name => "index_topics_on_meeting_id"

  create_table "users", :force => true do |t|
    t.string   "email",                         :null => false
    t.string   "name",            :limit => 50
    t.string   "salt"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
