class Pokemon < ApplicationRecord
  has_many :pokemon_evolutions
  has_many :adoptable_pokemons

  def color
    main_type = types.first&.downcase&.to_sym
    POKEMON_TYPE_COLORS[main_type] || '#83A498' # Defaults to accent color if no color is found
  end

  default_scope { order(id: :asc) }
end
