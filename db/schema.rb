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

ActiveRecord::Schema.define(version: 2018_10_25_190041) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size_name"
    t.integer "color_id"
    t.string "color_name"
    t.integer "inventory_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_chat_rooms_on_product_id"
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hexcode"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "privacy", default: "open"
  end

  create_table "designers", force: :cascade do |t|
    t.string "name"
    t.string "brandname"
    t.text "description"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount", default: 0
    t.integer "product_id"
    t.integer "color_id"
    t.integer "size_id"
    t.string "color_name"
    t.string "size_name"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size_name"
    t.string "color_name"
    t.string "shipping_status", default: "not_shipped"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "sn"
    t.integer "amount"
    t.integer "user_id"
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "payment_status", default: "not_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shipping_count", default: 0
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id"
    t.integer "sn", null: false
    t.string "payment_method"
    t.integer "amount"
    t.datetime "paid_at"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rand_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.string "image"
    t.boolean "thirtydays_status"
    t.integer "designer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "add_to_cart_count", default: 0
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "realname"
    t.string "phone"
    t.string "role"
    t.string "avatar"
    t.string "zip"
    t.string "city"
    t.string "dist"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
