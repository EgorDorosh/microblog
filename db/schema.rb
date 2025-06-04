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

ActiveRecord::Schema.define(version: 2025_06_04_144257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.bigint "micropost_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["micropost_id"], name: "index_comments_on_micropost_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "hashtag_subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hashtag_id"
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "created_at"
    t.index ["hashtag_id"], name: "index_hashtag_subscriptions_on_hashtag_id"
    t.index ["user_id", "hashtag_id"], name: "index_hashtag_subscriptions_on_user_id_and_hashtag_id", unique: true
    t.index ["user_id"], name: "index_hashtag_subscriptions_on_user_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_hashtags_on_name", unique: true
  end

  create_table "marks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "mark_type", null: false
    t.string "markable_type", null: false
    t.bigint "markable_id", null: false
    t.index ["markable_type", "markable_id"], name: "index_marks_on_markable"
    t.index ["user_id"], name: "index_marks_on_user_id"
  end

  create_table "micropost_hashtags", force: :cascade do |t|
    t.bigint "micropost_id"
    t.bigint "hashtag_id"
    t.index ["hashtag_id"], name: "index_micropost_hashtags_on_hashtag_id"
    t.index ["micropost_id", "hashtag_id"], name: "index_micropost_hashtags_on_micropost_id_and_hashtag_id", unique: true
    t.index ["micropost_id"], name: "index_micropost_hashtags_on_micropost_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "status_id", null: false
    t.string "actor_type", null: false
    t.bigint "actor_id", null: false
    t.string "notifiable_type", null: false
    t.bigint "notifiable_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_type", "actor_id"], name: "index_notifications_on_actor"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
    t.index ["status_id"], name: "index_notifications_on_status_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "role_id", default: 2, null: false
    t.integer "status_id", default: 1, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["status_id"], name: "index_users_on_status_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "microposts"
  add_foreign_key "comments", "users"
  add_foreign_key "hashtag_subscriptions", "hashtags"
  add_foreign_key "hashtag_subscriptions", "users"
  add_foreign_key "marks", "users"
  add_foreign_key "micropost_hashtags", "hashtags"
  add_foreign_key "micropost_hashtags", "microposts"
  add_foreign_key "microposts", "users"
  add_foreign_key "notifications", "statuses"
  add_foreign_key "notifications", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "statuses"
end
