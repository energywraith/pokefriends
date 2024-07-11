class Pokemon < ApplicationRecord
  has_many :pokemon_evolutions
  has_many :adoptable_pokemons

  default_scope { order(id: :asc) }
end
