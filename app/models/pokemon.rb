class Pokemon < ApplicationRecord
  has_many :pokemon_evolutions
  has_many :adoptable_pokemons
  belongs_to :evolution

  def color
    main_type = types.first&.downcase&.to_sym
    POKEMON_TYPE_COLORS[main_type] || '#83A498' # Defaults to accent color if no color is found
  end

  def image
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{id}.png"
  end

  default_scope { order(id: :asc) }
end
