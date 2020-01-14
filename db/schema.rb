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

ActiveRecord::Schema.define(version: 2020_01_14_024437) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.integer "writer_id"
    t.string "keyword_1", null: false
    t.string "keyword_2", null: false
    t.string "keyword_3"
    t.integer "status", default: 0, null: false
    t.string "title"
    t.text "reference_1"
    t.text "reference_2"
    t.text "reference_3"
    t.text "reference_4"
    t.text "reference_5"
    t.float "unit_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["writer_id"], name: "index_articles_on_writer_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "article_id"
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_feedbacks_on_article_id"
  end

  create_table "headings", force: :cascade do |t|
    t.integer "article_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_headings_on_article_id"
  end

  create_table "subheadings", force: :cascade do |t|
    t.integer "heading_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heading_id"], name: "index_subheadings_on_heading_id"
  end

  create_table "subsubheadings", force: :cascade do |t|
    t.integer "subheading_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subheading_id"], name: "index_subsubheadings_on_subheading_id"
  end

  create_table "writers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.integer "sex", null: false
    t.date "birthdate", null: false
    t.string "phone_number"
    t.string "address"
    t.integer "occupation", null: false
    t.integer "experience_year", null: false
    t.integer "status", default: 0, null: false
    t.float "unit_price", default: 0.2, null: false
    t.string "bank_name"
    t.string "branch_number"
    t.string "branch_name"
    t.string "bank_account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_writers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_writers_on_reset_password_token", unique: true
  end

end
