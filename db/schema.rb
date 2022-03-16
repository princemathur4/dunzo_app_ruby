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

ActiveRecord::Schema.define(version: 20220315101055) do

  create_table "cart_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "cart_id"
    t.bigint "menu_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["menu_item_id"], name: "index_cart_items_on_menu_item_id"
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_carts_on_store_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "mrp", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.string "city"
    t.string "state"
    t.integer "pincode"
    t.string "address_line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "store_id"
    t.bigint "item_id"
    t.float "item_price", limit: 24
    t.integer "available_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_menu_items_on_item_id"
    t.index ["store_id"], name: "index_menu_items_on_store_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_stores_on_location_id"
  end

  create_table "user_locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_user_locations_on_location_id"
    t.index ["user_id"], name: "index_user_locations_on_user_id"
  end

  create_table "user_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "menu_items"
  add_foreign_key "carts", "stores"
  add_foreign_key "carts", "users"
  add_foreign_key "menu_items", "items"
  add_foreign_key "menu_items", "stores"
  add_foreign_key "stores", "locations"
  add_foreign_key "user_locations", "locations"
  add_foreign_key "user_locations", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
