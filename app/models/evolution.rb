class Evolution < ApplicationRecord
  has_many :pokemon_evolutions
  belongs_to :item
  belongs_to :pokemon, class_name: 'Pokemon'
  belongs_to :evolution_pokemon, class_name: 'Pokemon'
end
