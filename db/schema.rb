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

ActiveRecord::Schema.define(version: 20180522072634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "user_id"
    t.string "user_name"
    t.text "contact_content"
    t.integer "contact_user_id"
    t.string "contact_user_name"
    t.string "contact_user_email"
    t.string "contact_user_fbmsg"
    t.string "contact_img"
    t.text "timestamps"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "post_id"
    t.string "post_title"
    t.text "post_content"
    t.string "post_image_1"
    t.string "post_image_2"
    t.string "post_image_3"
    t.string "post_user_name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searchs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "professional"
    t.text "skill"
    t.text "hobby"
    t.string "facebook"
  end

  create_table "sessions", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "user_email"
    t.string "user_address"
    t.string "user_icon"
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.string "professional"
    t.text "skill"
    t.text "hobby"
    t.string "user_fb_msg"
    t.string "password_digest"
    t.string "favorite_user"
    t.index ["user_email"], name: "index_users_on_user_email", unique: true
  end

  add_foreign_key "posts", "users"
end
