class PokemonEvolution < ApplicationRecord
  belongs_to :pokemon
  belongs_to :evolution
end
