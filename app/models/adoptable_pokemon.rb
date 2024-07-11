class AdoptablePokemon < ApplicationRecord
  belongs_to :shelter
  belongs_to :species, class_name: 'Pokemon'
end
