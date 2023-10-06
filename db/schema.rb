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

ActiveRecord::Schema[7.0].define(version: 2023_10_06_120843) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evidence_items", force: :cascade do |t|
    t.string "name"
    t.text "highlight"
    t.text "relevance"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evidence_links", force: :cascade do |t|
    t.string "evidenceable_type", null: false
    t.bigint "evidenceable_id", null: false
    t.bigint "evidence_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evidence_item_id"], name: "index_evidence_links_on_evidence_item_id"
    t.index ["evidenceable_type", "evidenceable_id"], name: "index_evidence_links_on_evidenceable"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outcomes", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.integer "confidence"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_outcomes_on_project_id"
  end

  create_table "populations", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.integer "confidence"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_populations_on_project_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id", null: false
    t.integer "confidence"
    t.index ["project_id"], name: "index_problems_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "scope_description"
    t.bigint "organisation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organisation_id"], name: "index_projects_on_organisation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.datetime "created_at"
    t.text "object_changes"
    t.jsonb "object"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "evidence_links", "evidence_items"
  add_foreign_key "outcomes", "projects"
  add_foreign_key "populations", "projects"
  add_foreign_key "problems", "projects"
  add_foreign_key "projects", "organisations"
end
