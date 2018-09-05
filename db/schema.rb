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

ActiveRecord::Schema.define(version: 20180905165157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

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

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
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

  create_table "chat_thread_users", force: :cascade do |t|
    t.integer "chat_thread_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_threads", force: :cascade do |t|
    t.string "channel_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatroom_users", force: :cascade do |t|
    t.bigint "chatroom_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_read_at"
    t.index ["chatroom_id"], name: "index_chatroom_users_on_chatroom_id"
    t.index ["user_id"], name: "index_chatroom_users_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_chatrooms_on_order_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "billing_address"
    t.string "shipping_address"
    t.string "phone"
    t.integer "brand_id"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "status"
    t.integer "manage_by"
    t.integer "owned_by"
    t.boolean "po_required"
    t.text "payment_terms"
    t.text "notes"
    t.string "website"
    t.decimal "balance"
    t.decimal "balance_total"
    t.string "bill_1"
    t.string "bill_2"
    t.string "bill_3"
    t.string "bill_4"
    t.string "bill_5"
    t.string "ship_1"
    t.string "ship_2"
    t.string "ship_3"
    t.string "ship_4"
    t.string "ship_5"
    t.string "terms"
    t.string "rep"
    t.string "sales_tax_code"
    t.string "tax_item"
    t.boolean "active", default: true
    t.string "fax"
  end

  create_table "default_attributes", force: :cascade do |t|
    t.string "field_name"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "input_type"
  end

  create_table "email_template_attachments", force: :cascade do |t|
    t.integer "email_template_id"
    t.string "attachment_file_file_name"
    t.string "attachment_file_content_type"
    t.integer "attachment_file_file_size"
    t.datetime "attachment_file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_template_order_entries", force: :cascade do |t|
    t.integer "email_template_id"
    t.integer "order_entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_template_users", force: :cascade do |t|
    t.integer "email_template_id"
    t.integer "user_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
  end

  create_table "email_templates", force: :cascade do |t|
    t.integer "order_id"
    t.integer "user_id"
    t.text "content"
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

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.integer "brand_id"
    t.integer "shipping_address"
    t.integer "address_id"
    t.string "email"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_number"
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

  create_table "item_messages", force: :cascade do |t|
    t.text "body"
    t.text "attachment_data"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_entry_id"
    t.index ["order_entry_id"], name: "index_item_messages_on_order_entry_id"
    t.index ["user_id"], name: "index_item_messages_on_user_id"
  end

  create_table "mailboxer_conversation_opt_outs", id: :integer, default: nil, force: :cascade do |t|
    t.string "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", id: :integer, default: nil, force: :cascade do |t|
    t.string "subject", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_notifications", id: :integer, default: nil, force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.string "subject", default: ""
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "conversation_id"
    t.boolean "draft", default: false
    t.string "notification_code"
    t.string "notified_object_type"
    t.integer "notified_object_id"
    t.string "attachment"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.boolean "global", default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", id: :integer, default: nil, force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id"
    t.integer "notification_id", null: false
    t.boolean "is_read", default: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.string "mailbox_type", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_delivered", default: false
    t.string "delivery_method"
    t.string "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.text "attachment_data"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chatroom_order_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "order_branches", force: :cascade do |t|
    t.integer "address_id"
    t.integer "brand_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer "category_id"
    t.integer "status", default: 1
    t.string "dynamic_fields"
    t.text "specs"
    t.text "vendor_quote_prices"
    t.text "notes"
  end

  create_table "order_entry_attachments", force: :cascade do |t|
    t.integer "order_entry_id"
    t.string "attachment_file_file_name"
    t.string "attachment_file_content_type"
    t.integer "attachment_file_file_size"
    t.datetime "attachment_file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
  end

  create_table "order_entry_vendors", force: :cascade do |t|
    t.integer "order_entry_id"
    t.integer "vendor_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_histories", force: :cascade do |t|
    t.integer "order_id"
    t.integer "order_entry_id"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_users", force: :cascade do |t|
    t.integer "regional"
    t.integer "comms"
    t.integer "art"
    t.integer "processor"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_contact"
    t.integer "designer"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "created_by"
    t.integer "order_status_id"
    t.integer "customer_id"
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
    t.decimal "lead_time"
    t.decimal "total_budget"
    t.boolean "urgent"
    t.integer "brand_id"
    t.string "chatroom_name"
  end

  create_table "product_accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_asset_accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_category_vendors", force: :cascade do |t|
    t.integer "product_id"
    t.integer "category_id"
    t.integer "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_cogs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
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
    t.integer "item_category_id"
    t.text "image_data"
    t.string "dynamic_fields"
    t.text "specs"
    t.text "vendor_quote_prices"
    t.text "notes"
    t.decimal "cost", precision: 12, scale: 3
    t.boolean "active", default: true
    t.integer "product_type_id"
    t.boolean "sales_tax", default: true
    t.integer "product_account_id"
    t.string "product_cog_id"
    t.string "product_asset_account_id"
    t.decimal "depreciation", precision: 12, scale: 3
    t.string "purchase_description"
    t.decimal "purchase_price", precision: 12, scale: 3
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
    t.decimal "height"
    t.decimal "width"
    t.string "finish"
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
    t.string "mobile"
    t.text "notes"
    t.boolean "active"
    t.string "title"
    t.string "phone"
    t.integer "customer_id"
    t.integer "vendor_id"
    t.datetime "last_notified"
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
    t.boolean "main_contact", default: false
  end

  create_table "users_groups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_categories", force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_reviews", force: :cascade do |t|
    t.text "review"
    t.integer "vendor_id"
    t.integer "user_id"
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
    t.string "email"
    t.integer "billing_address"
    t.decimal "balance", precision: 12, scale: 3
    t.decimal "balance_total", precision: 12, scale: 3
    t.string "bill_from_1"
    t.string "bill_from_2"
    t.string "bill_from_3"
    t.string "bill_from_4"
    t.string "bill_from_5"
    t.string "phone"
    t.string "fax"
    t.boolean "active", default: true
    t.string "company"
    t.index ["product_id"], name: "index_vendors_on_product_id"
  end

  create_table "vendors_products", force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chatroom_users", "chatrooms"
  add_foreign_key "chatroom_users", "users"
  add_foreign_key "chatrooms", "orders"
  add_foreign_key "item_messages", "order_entries"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "products", "style_attributes"
  add_foreign_key "users", "brands"
  add_foreign_key "users", "groups"
  add_foreign_key "vendors", "products"

  create_view "search_results",  sql_definition: <<-SQL
      SELECT order_entries.order_id AS searchable_id,
      'Order'::text AS searchable_type,
      products.name AS search_term
     FROM (order_entries
       JOIN products ON ((products.id = order_entries.product_id)))
  UNION
   SELECT order_entries.order_id AS searchable_id,
      'Order'::text AS searchable_type,
      (products.id)::text AS search_term
     FROM (order_entries
       JOIN products ON ((products.id = order_entries.product_id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      (orders.brand_id)::text AS search_term
     FROM orders
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      brands.name AS search_term
     FROM (orders
       JOIN brands ON ((brands.id = orders.brand_id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      (order_users.regional)::text AS search_term
     FROM (orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
    WHERE (order_users.regional IS NOT NULL)
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      (order_users.comms)::text AS search_term
     FROM (orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
    WHERE (order_users.comms IS NOT NULL)
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      (order_users.art)::text AS search_term
     FROM (orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
    WHERE (order_users.art IS NOT NULL)
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      (order_users.processor)::text AS search_term
     FROM (orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
    WHERE (order_users.processor IS NOT NULL)
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      (order_users.designer)::text AS search_term
     FROM (orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
    WHERE (order_users.designer IS NOT NULL)
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      (order_users.client_contact)::text AS search_term
     FROM (orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
    WHERE (order_users.client_contact IS NOT NULL)
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.email AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.regional = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.first_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.regional = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.last_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.regional = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      concat(users.first_name, ' ', users.last_name) AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.regional = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.email AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.comms = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.first_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.comms = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.last_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.comms = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      concat(users.first_name, ' ', users.last_name) AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.comms = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.email AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.art = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.first_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.art = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.last_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.art = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      concat(users.first_name, ' ', users.last_name) AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.art = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.email AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.processor = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.first_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.processor = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.last_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.processor = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      concat(users.first_name, ' ', users.last_name) AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.processor = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.email AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.designer = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.first_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.designer = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.last_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.designer = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      concat(users.first_name, ' ', users.last_name) AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.designer = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.email AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.client_contact = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.first_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.client_contact = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      users.last_name AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.client_contact = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      concat(users.first_name, ' ', users.last_name) AS search_term
     FROM ((orders
       JOIN order_users ON ((order_users.order_id = orders.id)))
       JOIN users ON ((order_users.client_contact = users.id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      (orders.id)::text AS search_term
     FROM orders
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      categories.name AS search_term
     FROM ((orders
       JOIN order_entries ON ((order_entries.order_id = orders.id)))
       JOIN categories ON ((categories.id = order_entries.category_id)))
  UNION
   SELECT orders.id AS searchable_id,
      'Order'::text AS searchable_type,
      vendors.name AS search_term
     FROM ((orders
       JOIN order_entries ON ((order_entries.order_id = orders.id)))
       JOIN vendors ON ((vendors.id = order_entries.vendor)))
  UNION
   SELECT users.id AS searchable_id,
      'User'::text AS searchable_type,
      users.email AS search_term
     FROM users
  UNION
   SELECT users.id AS searchable_id,
      'User'::text AS searchable_type,
      users.first_name AS search_term
     FROM users
  UNION
   SELECT users.id AS searchable_id,
      'User'::text AS searchable_type,
      users.last_name AS search_term
     FROM users
  UNION
   SELECT messages.id AS searchable_id,
      'Message'::text AS searchable_type,
      messages.body AS search_term
     FROM messages
    WHERE ((messages.body IS NOT NULL) AND (COALESCE(messages.body, ''::text) <> ''::text))
  UNION
   SELECT item_messages.id AS searchable_id,
      'ItemMessage'::text AS searchable_type,
      item_messages.body AS search_term
     FROM item_messages
    WHERE ((item_messages.body IS NOT NULL) AND (COALESCE(item_messages.body, ''::text) <> ''::text))
  UNION
   SELECT users.id AS searchable_id,
      'User'::text AS searchable_type,
      concat(users.first_name, ' ', users.last_name) AS search_term
     FROM users
  UNION
   SELECT products.id AS searchable_id,
      'Product'::text AS searchable_type,
      products.name AS search_term
     FROM products
  UNION
   SELECT categories.id AS searchable_id,
      'Category'::text AS searchable_type,
      categories.name AS search_term
     FROM categories
  UNION
   SELECT brands.id AS searchable_id,
      'Brand'::text AS searchable_type,
      brands.name AS search_term
     FROM brands;
  SQL

end
