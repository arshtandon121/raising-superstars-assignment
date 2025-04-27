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

ActiveRecord::Schema.define(version: 20250426060107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "duration_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_plan_activities", force: :cascade do |t|
    t.bigint "daily_plan_id"
    t.bigint "activity_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_daily_plan_activities_on_activity_id"
    t.index ["daily_plan_id"], name: "index_daily_plan_activities_on_daily_plan_id"
  end

  create_table "daily_plans", force: :cascade do |t|
    t.bigint "program_id"
    t.integer "day_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_daily_plans_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "duration_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_activities", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "activity_id"
    t.bigint "daily_plan_id"
    t.boolean "completed"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_user_activities_on_activity_id"
    t.index ["daily_plan_id"], name: "index_user_activities_on_daily_plan_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "user_programs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "program_id"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_user_programs_on_program_id"
    t.index ["user_id"], name: "index_user_programs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "daily_plan_activities", "activities"
  add_foreign_key "daily_plan_activities", "daily_plans"
  add_foreign_key "daily_plans", "programs"
  add_foreign_key "user_activities", "activities"
  add_foreign_key "user_activities", "daily_plans"
  add_foreign_key "user_activities", "users"
  add_foreign_key "user_programs", "programs"
  add_foreign_key "user_programs", "users"
end
