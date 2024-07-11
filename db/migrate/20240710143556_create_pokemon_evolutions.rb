class CreatePokemonEvolutions < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_evolutions do |t|
      t.references :pokemon, foreign_key: { to_table: :pokemons }
      t.references :evolution, foreign_key: { to_table: :evolutions }

      t.timestamps
    end
  end
end
