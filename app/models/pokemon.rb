class Pokemon < ApplicationRecord
  has_many :pokemon_evolutions
  has_many :adoptable_pokemons
  belongs_to :evolution

  default_scope { order(id: :asc) }
end
