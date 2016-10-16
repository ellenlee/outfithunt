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

ActiveRecord::Schema.define(version: 20161016045549) do

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_colors_on_name", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.string   "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["name"], name: "index_images_on_name", unique: true
  end

  create_table "item_imageships", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_item_imageships_on_image_id"
    t.index ["item_id"], name: "index_item_imageships_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "color_id"
    t.integer  "material_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "img"
    t.integer  "style_id"
    t.integer  "brand_id"
    t.integer  "price"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["color_id"], name: "index_items_on_color_id"
    t.index ["material_id"], name: "index_items_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_materials_on_name", unique: true
  end

  create_table "occasions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_occasions_on_name", unique: true
  end

  create_table "outfit_itemships", force: :cascade do |t|
    t.integer  "outfit_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_outfit_itemships_on_item_id"
    t.index ["outfit_id"], name: "index_outfit_itemships_on_outfit_id"
  end

  create_table "outfit_occasionships", force: :cascade do |t|
    t.integer  "outfit_id"
    t.integer  "occasion_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["occasion_id"], name: "index_outfit_occasionships_on_occasion_id"
    t.index ["outfit_id"], name: "index_outfit_occasionships_on_outfit_id"
  end

  create_table "outfits", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "image_id"
    t.index ["image_id"], name: "index_outfits_on_image_id", unique: true
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "color_id"
    t.integer  "material_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "img"
    t.index ["category_id"], name: "index_requests_on_category_id"
    t.index ["color_id"], name: "index_requests_on_color_id"
    t.index ["material_id"], name: "index_requests_on_material_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_styles_on_name", unique: true
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
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
