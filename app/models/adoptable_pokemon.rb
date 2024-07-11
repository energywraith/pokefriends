class AdoptablePokemon < ApplicationRecord
  belongs_to :shelter
  belongs_to :pokemon
end
