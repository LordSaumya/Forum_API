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

ActiveRecord::Schema[7.0].define(version: 2022_12_24_184604) do
  create_table "comments", force: :cascade do |t|
    t.integer "User_id", null: false
    t.integer "ForumThread_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ForumThread_id"], name: "index_comments_on_ForumThread_id"
    t.index ["User_id"], name: "index_comments_on_User_id"
  end

  create_table "forum_threads", force: :cascade do |t|
    t.integer "User_id", null: false
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag"
    t.index ["User_id"], name: "index_forum_threads_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "Users"
  add_foreign_key "comments", "forum_threads", column: "ForumThread_id"
  add_foreign_key "forum_threads", "Users"
end
