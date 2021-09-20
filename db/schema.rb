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

ActiveRecord::Schema.define(version: 2021_09_20_135829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bops", force: :cascade do |t|
    t.string "serial_number"
    t.string "bop_type"
    t.string "producer"
    t.string "pressure_rating"
    t.string "description"
    t.bigint "rig_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rig_id"], name: "index_bops_on_rig_id"
  end

  create_table "component_function_tests", force: :cascade do |t|
    t.string "unit_name"
    t.integer "open_gallons"
    t.integer "open_time"
    t.integer "close_gallons"
    t.integer "close_time"
    t.string "status"
    t.text "additional_notes"
    t.bigint "function_test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["function_test_id"], name: "index_component_function_tests_on_function_test_id"
  end

  create_table "component_pressure_tests", force: :cascade do |t|
    t.string "bop_element_unit"
    t.string "size_type"
    t.integer "low_pressure_value"
    t.integer "high_pressure_value"
    t.boolean "test_result"
    t.bigint "pressure_test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pressure_test_id"], name: "index_component_pressure_tests_on_pressure_test_id"
  end

  create_table "function_norms", force: :cascade do |t|
    t.string "function_name"
    t.integer "value"
    t.bigint "bop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bop_id"], name: "index_function_norms_on_bop_id"
  end

  create_table "function_tests", force: :cascade do |t|
    t.date "last_test_date"
    t.date "completed_date"
    t.date "next_test_deadline"
    t.string "test_location"
    t.text "additional_notes"
    t.bigint "user_id", null: false
    t.bigint "bop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bop_id"], name: "index_function_tests_on_bop_id"
    t.index ["user_id"], name: "index_function_tests_on_user_id"
  end

  create_table "pressure_tests", force: :cascade do |t|
    t.date "last_test_date"
    t.date "completed_date"
    t.date "next_test_deadline"
    t.string "test_fluid"
    t.string "well_name"
    t.string "serial_number_of_chart_recorder"
    t.text "comment"
    t.text "corrective_action"
    t.string "drill_pipe_diameter_for_test"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pressure_tests_on_user_id"
  end

  create_table "regular_checks", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.bigint "function_test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["function_test_id"], name: "index_regular_checks_on_function_test_id"
  end

  create_table "rigs", force: :cascade do |t|
    t.string "name"
    t.string "reservoir_field"
    t.string "contractor_drilling_company"
    t.string "operator_company"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "safety_valve_tests", force: :cascade do |t|
    t.string "unit"
    t.string "serial_number"
    t.string "connection_type"
    t.integer "high_pressure"
    t.integer "low_pressure"
    t.boolean "test_result"
    t.bigint "pressure_test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pressure_test_id"], name: "index_safety_valve_tests_on_pressure_test_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "position"
    t.string "company"
    t.boolean "admin"
    t.bigint "rig_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["rig_id"], name: "index_users_on_rig_id"
  end

  add_foreign_key "bops", "rigs"
  add_foreign_key "component_function_tests", "function_tests"
  add_foreign_key "component_pressure_tests", "pressure_tests"
  add_foreign_key "function_norms", "bops"
  add_foreign_key "function_tests", "bops"
  add_foreign_key "function_tests", "users"
  add_foreign_key "pressure_tests", "users"
  add_foreign_key "regular_checks", "function_tests"
  add_foreign_key "safety_valve_tests", "pressure_tests"
  add_foreign_key "users", "rigs"
end
