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

ActiveRecord::Schema.define(version: 20180211033700) do

  create_table "tasks", force: :cascade do |t|
    t.integer "user_id"
    t.string "description", null: false
    t.boolean "active", default: true
    t.integer "score"
    t.integer "priority"
    t.boolean "repeating", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "estimated_duration", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "email", null: false
    t.integer "daily_hours", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_periods", force: :cascade do |t|
    t.integer "task_id"
    t.integer "duration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_work_periods_on_task_id"
  end

end
