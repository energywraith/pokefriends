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

ActiveRecord::Schema[7.1].define(version: 2024_07_10_143556) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_enum :pokemon_type, [
    "Normal",
    "Fire",
    "Water",
    "Electric",
    "Grass",
    "Ice",
    "Fighting",
    "Poison",
    "Ground",
    "Flying",
    "Psychic",
    "Bug",
    "Rock",
    "Ghost",
    "Dragon",
  ], force: :cascade

  create_table "evolutions", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "evolution_pokemon_id"
    t.integer "level"
    t.bigint "item_id"
    t.boolean "by_trade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_evolutions_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon_evolutions", force: :cascade do |t|
    t.bigint "pokemon_id"
    t.bigint "evolution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evolution_id"], name: "index_pokemon_evolutions_on_evolution_id"
    t.index ["pokemon_id"], name: "index_pokemon_evolutions_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "types", array: true
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.integer "special_attack", null: false
    t.integer "special_defense", null: false
    t.integer "speed", null: false
    t.bigint "evolution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evolution_id"], name: "index_pokemons_on_evolution_id"
  end

  add_foreign_key "evolutions", "items"
  add_foreign_key "pokemon_evolutions", "evolutions"
  add_foreign_key "pokemon_evolutions", "pokemons"
  add_foreign_key "pokemons", "evolutions"
end
