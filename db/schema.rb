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

ActiveRecord::Schema.define(version: 20160328053957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ahoy_events", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.json     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["name", "time"], name: "index_ahoy_events_on_name_and_time", using: :btree
  add_index "ahoy_events", ["user_id", "name"], name: "index_ahoy_events_on_user_id_and_name", using: :btree
  add_index "ahoy_events", ["visit_id", "name"], name: "index_ahoy_events_on_visit_id_and_name", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "charges", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "stripe_id"
    t.integer  "amount"
    t.string   "card_last4"
    t.string   "card_type"
    t.string   "card_exp_month"
    t.string   "card_exp_year"
    t.string   "data_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "charges", ["stripe_id"], name: "index_charges_on_stripe_id", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["question_id"], name: "index_comments_on_question_id", using: :btree

  create_table "contributors", force: :cascade do |t|
    t.integer  "tutorial_id"
    t.boolean  "access",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "member_id"
  end

  add_index "contributors", ["member_id"], name: "index_contributors_on_member_id", using: :btree
  add_index "contributors", ["tutorial_id"], name: "index_contributors_on_tutorial_id", using: :btree

  create_table "data", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.string   "card_last4"
    t.string   "card_type"
    t.string   "card_exp_month"
    t.string   "card_exp_year"
    t.string   "stripe_id"
    t.string   "data_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "data", ["stripe_id"], name: "index_data_on_stripe_id", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "infopages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "template_id"
    t.integer  "category_id"
    t.string   "slug"
    t.integer  "tutorial_id"
  end

  add_index "infopages", ["category_id"], name: "index_infopages_on_category_id", using: :btree
  add_index "infopages", ["template_id"], name: "index_infopages_on_template_id", using: :btree
  add_index "infopages", ["tutorial_id"], name: "index_infopages_on_tutorial_id", using: :btree

  create_table "infos", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "tutorial_id"
    t.integer  "category_id"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "infos", ["category_id"], name: "index_infos_on_category_id", using: :btree
  add_index "infos", ["tutorial_id"], name: "index_infos_on_tutorial_id", using: :btree

  create_table "marks", id: false, force: :cascade do |t|
    t.integer  "marker_id"
    t.string   "marker_type"
    t.integer  "markable_id"
    t.string   "markable_type"
    t.string   "mark",          limit: 128
    t.datetime "created_at"
  end

  add_index "marks", ["markable_id", "markable_type", "mark"], name: "index_marks_on_markable_id_and_markable_type_and_mark", using: :btree
  add_index "marks", ["marker_id", "marker_type", "mark"], name: "index_marks_on_marker_id_and_marker_type_and_mark", using: :btree

  create_table "notes", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "tutorial_id"
    t.integer  "info_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "task"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "template_id"
    t.string   "slug"
  end

  add_index "pages", ["template_id"], name: "index_pages_on_template_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "amount",              default: 0
    t.string   "date"
    t.string   "author_name"
    t.string   "tutorial_name"
    t.string   "guid"
    t.string   "card_last4"
    t.string   "card_exp_month"
    t.string   "card_exp_year"
    t.string   "card_type"
    t.string   "balance_transaction"
    t.integer  "user_id"
    t.integer  "tutorial_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "charge_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.integer  "tutorial_id"
    t.boolean  "pinned",      default: false
    t.boolean  "solved",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.text     "content"
  end

  add_index "questions", ["tutorial_id"], name: "index_questions_on_tutorial_id", using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "snippetcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "snippet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snippets", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "featured"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "author_id"
    t.boolean  "publish",     default: false
    t.string   "slug"
    t.integer  "template_id"
    t.integer  "tutorial_id"
  end

  add_index "snippets", ["author_id"], name: "index_snippets_on_author_id", using: :btree
  add_index "snippets", ["category_id"], name: "index_snippets_on_category_id", using: :btree

  create_table "templates", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.text     "points_covered"
    t.string   "repo_link"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "author_id"
    t.string   "slug"
    t.boolean  "publish",        default: false
  end

  add_index "templates", ["author_id"], name: "index_templates_on_author_id", using: :btree
  add_index "templates", ["category_id"], name: "index_templates_on_category_id", using: :btree

  create_table "transfers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "date"
    t.string   "token"
    t.string   "destination"
    t.string   "currency"
    t.string   "failure_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "transfers", ["user_id"], name: "index_transfers_on_user_id", using: :btree

  create_table "tutorials", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.text     "points_covered"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.string   "link_to_repo"
    t.string   "slug"
    t.integer  "author_id"
    t.boolean  "publish",           default: false
    t.integer  "template_id"
    t.integer  "impressions_count", default: 0
    t.integer  "price",             default: 0
  end

  add_index "tutorials", ["author_id"], name: "index_tutorials_on_author_id", using: :btree
  add_index "tutorials", ["category_id"], name: "index_tutorials_on_category_id", using: :btree
  add_index "tutorials", ["template_id"], name: "index_tutorials_on_template_id", using: :btree
  add_index "tutorials", ["user_id"], name: "index_tutorials_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.text     "description"
    t.string   "github"
    t.string   "bitbucket"
    t.string   "personal_website"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "creator",                default: false
    t.boolean  "manager",                default: false
    t.string   "stripe_id"
    t.string   "stripe_subscription_id"
    t.string   "card_last4"
    t.integer  "card_exp_month"
    t.integer  "card_exp_year"
    t.string   "card_type"
    t.string   "stripe_account_id"
    t.string   "publishable_key"
    t.string   "secret_key"
    t.string   "currency"
    t.string   "linkedin"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.string   "visit_token"
    t.string   "visitor_token"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree
  add_index "visits", ["visit_token"], name: "index_visits_on_visit_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "comments", "questions"
  add_foreign_key "contributors", "tutorials"
  add_foreign_key "contributors", "users", column: "member_id"
  add_foreign_key "infopages", "categories"
  add_foreign_key "infopages", "templates"
  add_foreign_key "infopages", "tutorials"
  add_foreign_key "infos", "categories"
  add_foreign_key "infos", "tutorials"
  add_foreign_key "pages", "templates"
  add_foreign_key "questions", "tutorials"
  add_foreign_key "snippets", "categories"
  add_foreign_key "snippets", "users", column: "author_id"
  add_foreign_key "templates", "categories"
  add_foreign_key "templates", "users", column: "author_id"
  add_foreign_key "transfers", "users"
  add_foreign_key "tutorials", "categories"
  add_foreign_key "tutorials", "users"
  add_foreign_key "tutorials", "users", column: "author_id"
end
