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

ActiveRecord::Schema.define(version: 20170712123632) do

  create_table "brands", force: :cascade do |t|
    t.string   "brand_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_variety_id"
    t.integer  "quantity"
    t.boolean  "buy_after_flag",     default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "title"
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "method_of_payments", force: :cascade do |t|
    t.string   "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "postage"
    t.integer  "method_of_payment_id", default: 1
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_varieties", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "color"
    t.string   "size"
    t.integer  "price"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "stock",      default: true
  end

  create_table "product_variety_images", force: :cascade do |t|
    t.integer  "product_variety_id"
    t.string   "image"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "price"
    t.string   "p_name"
    t.text     "description"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.string   "image"
    t.integer  "category_id"
    t.integer  "brand_id"
    t.string   "sub_name"
    t.string   "upper_leather"
    t.string   "outsole"
    t.string   "heel"
    t.string   "process"
    t.string   "repair"
    t.string   "width"
    t.string   "made_in"
    t.string   "maker_description"
    t.string   "product_code"
    t.boolean  "sale",              default: false
    t.integer  "discount_rate",     default: 0
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "product_variety_id"
    t.integer  "quantity"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "order_id"
    t.integer  "price"
    t.string   "p_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 0
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
