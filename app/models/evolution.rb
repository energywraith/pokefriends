class Evolution < ApplicationRecord
  has_many :pokemon_evolutions
  belongs_to :item, optional: true
  belongs_to :pokemon, class_name: 'Pokemon', optional: true
  belongs_to :evolution_pokemon, class_name: 'Pokemon', optional: true
end
