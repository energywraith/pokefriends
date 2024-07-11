class Pokemon < ApplicationRecord
  has_many :pokemon_evolutions
  belongs_to :evolution

  default_scope { order(id: :asc) }
end
