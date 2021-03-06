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

ActiveRecord::Schema.define(version: 2021_03_03_102658) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attractions_taggings", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "attractions_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attractions_tag_id"], name: "index_attractions_taggings_on_attractions_tag_id"
    t.index ["spot_id"], name: "index_attractions_taggings_on_spot_id"
  end

  create_table "attractions_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "people", default: [], array: true
  end

  create_table "difficulty_taggings", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "difficulty_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["difficulty_tag_id"], name: "index_difficulty_taggings_on_difficulty_tag_id"
    t.index ["spot_id"], name: "index_difficulty_taggings_on_spot_id"
  end

  create_table "difficulty_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dive_type_taggings", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "dive_type_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dive_type_tag_id"], name: "index_dive_type_taggings_on_dive_type_tag_id"
    t.index ["spot_id"], name: "index_dive_type_taggings_on_spot_id"
  end

  create_table "dive_type_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fish", force: :cascade do |t|
    t.string "name"
    t.string "family"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_url"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_likes_on_spot_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "conversation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.date "date"
    t.text "content"
    t.float "rating"
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.text "tips"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "fish_ids", default: [], array: true
    t.index ["spot_id"], name: "index_reviews_on_spot_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "spot_tags", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_spot_tags_on_spot_id"
    t.index ["tag_id"], name: "index_spot_tags_on_tag_id"
  end

  create_table "spots", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "country"
    t.string "region"
    t.text "init_dive_type_tags", default: [], array: true
    t.text "init_difficulty_tags", default: [], array: true
    t.text "init_attractions_tags", default: [], array: true
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "spottings", force: :cascade do |t|
    t.bigint "fish_id", null: false
    t.string "number"
    t.bigint "review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fish_id"], name: "index_spottings_on_fish_id"
    t.index ["review_id"], name: "index_spottings_on_review_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age"
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.text "description"
    t.string "avatar_url"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attractions_taggings", "attractions_tags"
  add_foreign_key "attractions_taggings", "spots"
  add_foreign_key "difficulty_taggings", "difficulty_tags"
  add_foreign_key "difficulty_taggings", "spots"
  add_foreign_key "dive_type_taggings", "dive_type_tags"
  add_foreign_key "dive_type_taggings", "spots"
  add_foreign_key "likes", "spots"
  add_foreign_key "likes", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "spots"
  add_foreign_key "reviews", "users"
  add_foreign_key "spot_tags", "spots"
  add_foreign_key "spot_tags", "tags"
  add_foreign_key "spots", "users"
  add_foreign_key "spottings", "fish"
  add_foreign_key "spottings", "reviews"
end
