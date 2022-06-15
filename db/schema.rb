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

ActiveRecord::Schema.define(version: 2020_10_02_050227) do

  create_table "average_rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "onsenpost_id"
    t.float "average_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["onsenpost_id", "created_at"], name: "index_average_rates_on_onsenpost_id_and_created_at"
    t.index ["onsenpost_id"], name: "index_average_rates_on_onsenpost_id"
  end

  create_table "bookmarks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "onsenpost_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["onsenpost_id"], name: "index_bookmarks_on_onsenpost_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.text "comment_content"
    t.bigint "user_id"
    t.bigint "onsenpost_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "rate"
    t.index ["onsenpost_id"], name: "index_comments_on_onsenpost_id"
    t.index ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "microposts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "picture"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "onsenposts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "onsen_name"
    t.string "address"
    t.string "title"
    t.text "content"
    t.float "rate"
    t.integer "kind"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "picture"
    t.integer "prefecture"
    t.float "latitude"
    t.float "longitude"
    t.float "average_rate"
    t.integer "kind_b"
    t.integer "kind_c"
    t.integer "kind_d"
    t.index ["user_id", "created_at"], name: "index_onsenposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_onsenposts_on_user_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "picture"
    t.text "content"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "average_rates", "onsenposts"
  add_foreign_key "bookmarks", "onsenposts"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "onsenposts"
  add_foreign_key "comments", "users"
  add_foreign_key "microposts", "users"
  add_foreign_key "onsenposts", "users"
end
