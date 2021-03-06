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

ActiveRecord::Schema.define(version: 20170612174334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "law_id"
    t.bigint "document_id"
    t.datetime "asked_at"
    t.datetime "answered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "draft_id"
    t.index ["document_id"], name: "index_comments_on_document_id"
    t.index ["draft_id"], name: "index_comments_on_draft_id"
    t.index ["law_id"], name: "index_comments_on_law_id"
  end

  create_table "comments_organizations", id: false, force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "organization_id", null: false
    t.index ["organization_id", "comment_id"], name: "index_comments_organizations_on_organization_id_and_comment_id", unique: true
  end

  create_table "documents", force: :cascade do |t|
    t.string "source_url"
    t.text "contents"
    t.string "filetype"
    t.integer "filesize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
  end

  create_table "drafts", force: :cascade do |t|
    t.bigint "law_id"
    t.datetime "published_at"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_drafts_on_document_id"
    t.index ["law_id"], name: "index_drafts_on_law_id"
  end

  create_table "laws", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_laws_on_slug", unique: true
  end

  create_table "laws_ministries", id: false, force: :cascade do |t|
    t.bigint "law_id", null: false
    t.bigint "ministry_id", null: false
    t.index ["ministry_id", "law_id"], name: "index_laws_ministries_on_ministry_id_and_law_id", unique: true
  end

  create_table "ministries", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name"
    t.index ["short_name"], name: "index_ministries_on_short_name", unique: true
    t.index ["slug"], name: "index_ministries_on_slug", unique: true
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_organizations_on_slug", unique: true
  end

  add_foreign_key "comments", "documents"
  add_foreign_key "comments", "drafts"
  add_foreign_key "comments", "laws"
  add_foreign_key "drafts", "documents"
  add_foreign_key "drafts", "laws"
end
