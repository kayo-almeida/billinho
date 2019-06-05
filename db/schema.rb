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

ActiveRecord::Schema.define(version: 2019_06_05_182551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educational_institutions", force: :cascade do |t|
    t.string "name", null: false
    t.string "cnpj", null: false
    t.integer "institution_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_educational_institutions_on_cnpj", unique: true
    t.index ["name"], name: "index_educational_institutions_on_name", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal "invoice_amount", precision: 8, scale: 2, null: false
    t.date "due_date", null: false
    t.bigint "registration_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registration_id"], name: "index_invoices_on_registration_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.decimal "total_course_amount", precision: 8, scale: 2, null: false
    t.integer "installments_number", null: false
    t.integer "due_day", null: false
    t.string "course_name", null: false
    t.bigint "educational_institution_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["educational_institution_id"], name: "index_registrations_on_educational_institution_id"
    t.index ["student_id"], name: "index_registrations_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.date "birthday"
    t.string "phone"
    t.integer "gender", null: false
    t.integer "payment_method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_students_on_cpf", unique: true
    t.index ["name"], name: "index_students_on_name", unique: true
  end

  add_foreign_key "invoices", "registrations"
  add_foreign_key "registrations", "educational_institutions"
  add_foreign_key "registrations", "students"
end
