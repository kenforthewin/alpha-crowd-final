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

ActiveRecord::Schema.define(version: 20151227230949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "forum_topics", force: :cascade do |t|
    t.integer  "forum_id"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sticky"
  end

  create_table "forums", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_id"
    t.boolean  "sticky"
  end

  create_table "guest_forum_topics", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "guest_forum_id"
    t.string   "name"
    t.integer  "guest_user_id"
    t.boolean  "sticky"
  end

  create_table "guest_forums", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "guest_topic_id"
    t.boolean  "sticky"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guest_posts", force: :cascade do |t|
    t.text     "text"
    t.string   "guest_user_id"
    t.integer  "guest_forum_topic_id"
    t.integer  "guest_forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "guest_posts", ["cached_votes_down"], name: "index_guest_posts_on_cached_votes_down", using: :btree
  add_index "guest_posts", ["cached_votes_score"], name: "index_guest_posts_on_cached_votes_score", using: :btree
  add_index "guest_posts", ["cached_votes_total"], name: "index_guest_posts_on_cached_votes_total", using: :btree
  add_index "guest_posts", ["cached_votes_up"], name: "index_guest_posts_on_cached_votes_up", using: :btree
  add_index "guest_posts", ["cached_weighted_average"], name: "index_guest_posts_on_cached_weighted_average", using: :btree
  add_index "guest_posts", ["cached_weighted_score"], name: "index_guest_posts_on_cached_weighted_score", using: :btree
  add_index "guest_posts", ["cached_weighted_total"], name: "index_guest_posts_on_cached_weighted_total", using: :btree

  create_table "guest_topics", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "text_field"
    t.integer  "user_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "guest_topics", ["cached_votes_down"], name: "index_guest_topics_on_cached_votes_down", using: :btree
  add_index "guest_topics", ["cached_votes_score"], name: "index_guest_topics_on_cached_votes_score", using: :btree
  add_index "guest_topics", ["cached_votes_total"], name: "index_guest_topics_on_cached_votes_total", using: :btree
  add_index "guest_topics", ["cached_votes_up"], name: "index_guest_topics_on_cached_votes_up", using: :btree
  add_index "guest_topics", ["cached_weighted_average"], name: "index_guest_topics_on_cached_weighted_average", using: :btree
  add_index "guest_topics", ["cached_weighted_score"], name: "index_guest_topics_on_cached_weighted_score", using: :btree
  add_index "guest_topics", ["cached_weighted_total"], name: "index_guest_topics_on_cached_weighted_total", using: :btree

  create_table "guest_users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_topic_id"
    t.integer  "forum_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "posts", ["cached_votes_down"], name: "index_posts_on_cached_votes_down", using: :btree
  add_index "posts", ["cached_votes_score"], name: "index_posts_on_cached_votes_score", using: :btree
  add_index "posts", ["cached_votes_total"], name: "index_posts_on_cached_votes_total", using: :btree
  add_index "posts", ["cached_votes_up"], name: "index_posts_on_cached_votes_up", using: :btree
  add_index "posts", ["cached_weighted_average"], name: "index_posts_on_cached_weighted_average", using: :btree
  add_index "posts", ["cached_weighted_score"], name: "index_posts_on_cached_weighted_score", using: :btree
  add_index "posts", ["cached_weighted_total"], name: "index_posts_on_cached_weighted_total", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.text     "text_field"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "topics", ["cached_votes_down"], name: "index_topics_on_cached_votes_down", using: :btree
  add_index "topics", ["cached_votes_score"], name: "index_topics_on_cached_votes_score", using: :btree
  add_index "topics", ["cached_votes_total"], name: "index_topics_on_cached_votes_total", using: :btree
  add_index "topics", ["cached_votes_up"], name: "index_topics_on_cached_votes_up", using: :btree
  add_index "topics", ["cached_weighted_average"], name: "index_topics_on_cached_weighted_average", using: :btree
  add_index "topics", ["cached_weighted_score"], name: "index_topics_on_cached_weighted_score", using: :btree
  add_index "topics", ["cached_weighted_total"], name: "index_topics_on_cached_weighted_total", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "",  null: false
    t.string   "encrypted_password",      default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "handle"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "banned"
    t.string   "forum_status"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.integer  "institution_id"
  end

  add_index "users", ["cached_votes_down"], name: "index_users_on_cached_votes_down", using: :btree
  add_index "users", ["cached_votes_score"], name: "index_users_on_cached_votes_score", using: :btree
  add_index "users", ["cached_votes_total"], name: "index_users_on_cached_votes_total", using: :btree
  add_index "users", ["cached_votes_up"], name: "index_users_on_cached_votes_up", using: :btree
  add_index "users", ["cached_weighted_average"], name: "index_users_on_cached_weighted_average", using: :btree
  add_index "users", ["cached_weighted_score"], name: "index_users_on_cached_weighted_score", using: :btree
  add_index "users", ["cached_weighted_total"], name: "index_users_on_cached_weighted_total", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

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

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
