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

ActiveRecord::Schema[7.1].define(version: 2024_07_11_182240) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "health_status", ["healthy", "special_diet"]
  create_enum "pokemon_type", ["Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground", "Fairy", "Steel", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon"]
  create_enum "size", ["small", "medium", "large"]
  create_enum "temperament", ["hardy", "lonely", "brave", "relaxed", "serious", "modest", "quiet", "calm", "gentle", "careful", "quirky"]

  create_table "adoptable_pokemons", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "species_id", null: false
    t.bigint "shelter_id", null: false
    t.date "birth_date", null: false
    t.enum "size", null: false, enum_type: "size"
    t.enum "temperament", null: false, enum_type: "temperament"
    t.enum "health_status", null: false, enum_type: "health_status"
    t.text "background", null: false
    t.text "compatibility", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelter_id"], name: "index_adoptable_pokemons_on_shelter_id"
    t.index ["species_id"], name: "index_adoptable_pokemons_on_species_id"
  end

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
    t.enum "types", array: true, enum_type: "pokemon_type"
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

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "adoptable_pokemons", "pokemons", column: "species_id"
  add_foreign_key "adoptable_pokemons", "shelters"
  add_foreign_key "evolutions", "items"
  add_foreign_key "pokemon_evolutions", "evolutions"
  add_foreign_key "pokemon_evolutions", "pokemons"
  add_foreign_key "pokemons", "evolutions"
end
