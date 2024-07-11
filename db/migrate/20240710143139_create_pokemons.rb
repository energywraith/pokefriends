class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_enum :pokemon_type, %w[Normal
                                  Fire
                                  Water
                                  Electric
                                  Grass
                                  Ice
                                  Fighting
                                  Poison
                                  Ground
                                  Flying
                                  Psychic
                                  Bug
                                  Rock
                                  Ghost
                                  Dragon]

    create_table :pokemons do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :types, array: true
      t.integer :hp, null: false
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.integer :special_attack, null: false
      t.integer :special_defense, null: false
      t.integer :speed, null: false
      t.references :evolution, foreign_key: { to_table: :evolutions }

      t.timestamps
    end
  end
end
