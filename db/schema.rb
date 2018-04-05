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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20180404142256) do
=======
ActiveRecord::Schema.define(version: 20180404135459) do
>>>>>>> 87b58ff998a83bd9544b5f40a6a4c1b977130774

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "street_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_brands_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "billing_address"
    t.string "shipping_address"
    t.string "phone"
    t.integer "brand"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "loc_id"
    t.integer "bin_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "aisle_id"
    t.integer "product_id"
  end

<<<<<<< HEAD
  create_table "order_entries", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.decimal "price"
    t.decimal "cost"
    t.decimal "tax"
    t.integer "quoted_by"
    t.integer "quantity"
    t.integer "vendor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

=======
>>>>>>> 87b58ff998a83bd9544b5f40a6a4c1b977130774
  create_table "orders", force: :cascade do |t|
    t.integer "created_by"
    t.string "status"
    t.integer "customer"
    t.integer "delivery_address"
    t.integer "payment_address"
    t.decimal "total_cost"
    t.decimal "total_tax"
    t.decimal "total_discount"
    t.decimal "margin"
    t.integer "last_updated_by"
    t.datetime "promise_date"
    t.string "notes"
    t.datetime "fulfillment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "approval_status"
    t.datetime "online_date"
    t.datetime "offline_date"
    t.string "unit"
    t.string "description"
    t.string "base_product"
    t.integer "category"
    t.decimal "price"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.string "variant_type"
    t.string "style"
    t.string "variants"
    t.boolean "force_in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vendor_id"
    t.bigint "style_attribute_id"
    t.index ["style_attribute_id"], name: "index_products_on_style_attribute_id"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "style_attributes", force: :cascade do |t|
    t.integer "product_id"
    t.string "name"
    t.string "value"
    t.string "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_style_attributes_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roles_mask"
    t.boolean "admin"
    t.integer "billing_address"
    t.integer "shipping_address"
    t.string "first_name"
    t.string "last_name"
    t.bigint "brand_id"
    t.bigint "group_id"
    t.index ["brand_id"], name: "index_users_on_brand_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_brands", force: :cascade do |t|
    t.integer "user_id"
    t.integer "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_groups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lead_time"
    t.string "country_origin"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_vendors_on_product_id"
  end

  create_table "vendors_products", force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "style_attributes"
  add_foreign_key "users", "addresses", column: "billing_address"
  add_foreign_key "users", "addresses", column: "shipping_address"
  add_foreign_key "users", "brands"
  add_foreign_key "users", "groups"
  add_foreign_key "vendors", "products"
end
