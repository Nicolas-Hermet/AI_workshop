# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_22_113000) do
  create_table "audit_events", force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "occurred_at"
    t.integer "target_id"
    t.string "target_type"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_audit_events_on_user_id"
  end

  create_table "board_notes", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.string "industry"
    t.string "name"
    t.text "notes"
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.string "reference"
    t.date "signed_on"
    t.string "status"
    t.datetime "updated_at", null: false
    t.integer "value_cents"
    t.index ["client_id"], name: "index_contracts_on_client_id"
  end

  create_table "departments", force: :cascade do |t|
    t.integer "budget_cents"
    t.string "code"
    t.datetime "created_at", null: false
    t.integer "headcount"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "doc_type"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "department_id"
    t.string "email"
    t.string "first_name"
    t.date "hired_on"
    t.string "job_title"
    t.string "last_name"
    t.integer "salary_cents"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "amount_cents"
    t.string "category"
    t.datetime "created_at", null: false
    t.integer "employee_id"
    t.string "memo"
    t.date "spent_on"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_expenses_on_employee_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.text "internal_notes"
    t.integer "mission_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_invoices_on_mission_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "company_name"
    t.string "contact_name"
    t.datetime "created_at", null: false
    t.string "email"
    t.integer "estimated_value_cents"
    t.string "phone"
    t.string "source"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  create_table "missions", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "consultant_id", null: false
    t.datetime "created_at", null: false
    t.integer "hourly_rate"
    t.integer "hours"
    t.text "private_notes"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_missions_on_client_id"
    t.index ["consultant_id"], name: "index_missions_on_consultant_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "kind"
    t.string "message"
    t.boolean "read", default: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "budget_cents"
    t.integer "client_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.date "ends_on"
    t.string "name"
    t.date "starts_on"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "secrets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "key"
    t.datetime "updated_at", null: false
    t.string "value"
  end

  create_table "skills", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "timesheets", force: :cascade do |t|
    t.boolean "billable", default: true
    t.datetime "created_at", null: false
    t.integer "employee_id"
    t.decimal "hours", precision: 5, scale: 2
    t.integer "project_id"
    t.datetime "updated_at", null: false
    t.date "work_date"
    t.index ["employee_id"], name: "index_timesheets_on_employee_id"
    t.index ["project_id"], name: "index_timesheets_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "api_token"
    t.text "bio"
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "role", default: "consultant", null: false
    t.text "secret_memo"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "category"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "rating"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "audit_events", "users"
  add_foreign_key "contracts", "clients"
  add_foreign_key "documents", "users"
  add_foreign_key "employees", "departments"
  add_foreign_key "expenses", "employees"
  add_foreign_key "invoices", "missions"
  add_foreign_key "missions", "clients"
  add_foreign_key "missions", "users", column: "consultant_id"
  add_foreign_key "notifications", "users"
  add_foreign_key "projects", "clients"
  add_foreign_key "timesheets", "employees"
  add_foreign_key "timesheets", "projects"
end
