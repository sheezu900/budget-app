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

ActiveRecord::Schema[7.1].define(version: 2023_12_01_195618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories_transactions", id: false, force: :cascade do |t|
    t.bigint "transaction_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id", "transaction_id"], name: "idx_on_category_id_transaction_id_a9683369a2"
    t.index ["transaction_id", "category_id"], name: "idx_on_transaction_id_category_id_99363cd349"
  end

  create_table "categoriestabels", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categoriestabels_on_user_id"
  end

  create_table "transactionstabels", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_transactionstabels_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "surname"
  end

  add_foreign_key "categories_transactions", "categoriestabels", column: "category_id", on_delete: :cascade
  add_foreign_key "categories_transactions", "transactionstabels", column: "transaction_id", on_delete: :cascade
  add_foreign_key "categoriestabels", "users", on_delete: :cascade
  add_foreign_key "transactionstabels", "users", column: "author_id", on_delete: :cascade
end
