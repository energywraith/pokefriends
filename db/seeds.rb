# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

CSV.foreach('lib/seeds/items.csv', headers: true, encoding: 'ISO-8859-1', col_sep: ',') do |row|
  t = Item.find_or_create_by!(name: row['item'])
  puts "Item #{t.name} saved"
end

CSV.foreach('lib/seeds/pokemons.csv', headers: true, encoding: 'ISO-8859-1', col_sep: ',') do |row|
  t = Pokemon.new
  t.name = row['name']
  t.description = row['description']
  t.types = row['type2'].nil? ? [row['type1']] : [row['type1'], row['type2']]
  t.hp = row['hp']
  t.attack = row['attack']
  t.defense = row['defense']
  t.special_attack = row['sp. atk']
  t.special_defense = row['sp. def']
  t.speed = row['speed']
  t.save
  puts "Pokemon #{t.name} saved"
end

CSV.foreach('lib/seeds/evolutions.csv', headers: true, encoding: 'ISO-8859-1', col_sep: ',') do |row|
  t = Evolution.new
  t.pokemon_id = row['pokemon_id']
  t.evolution_pokemon_id = row['evolution_pokemon_id']
  t.level = row['level']
  t.item_id = row['item_id']
  t.by_trade = row['by_trade']
  t.save
  pokemon = Pokemon.find_by(id: t.pokemon_id)
  pokemon.update(evolution_id: t.id)
  puts "Evolution #{t.id} for #{t.pokemon_id} saved"
end

CSV.foreach('lib/seeds/pokemon_evolutions.csv', headers: true, encoding: 'ISO-8859-1', col_sep: ',') do |row|
  t = PokemonEvolution.new
  t.pokemon_id = row['pokemon_id']
  t.evolution_id = row['evolution_id']
  t.save
  puts "PokemonEvolution #{t.evolution_id} for #{t.pokemon_id} saved"
end

puts "There are now #{Item.count} rows in the items table"
puts "There are now #{Pokemon.count} rows in the pokemons table"
puts "There are now #{Evolution.count} rows in the evolutions table"
puts "There are now #{PokemonEvolution.count} rows in the pokemon_evolutions table"
