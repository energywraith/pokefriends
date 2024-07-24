class AdoptablePokemonsController < ApplicationController
  def index
    search = params[:q]
    page = params[:page] || 1

    @adoptable_pokemons = AdoptablePokemon.joins(:species).all
    if search.present?
      @adoptable_pokemons = @adoptable_pokemons.where('lower(adoptable_pokemons.name) LIKE ? OR lower(pokemons.name) LIKE ?',
                                                      "%#{search.downcase}%", "%#{search.downcase}%")
    end
    @adoptable_pokemons = @adoptable_pokemons.paginate(page:, per_page: 16)
  end

  def show
    @adoptable_pokemon = AdoptablePokemon.find(params[:id])
    @species = @adoptable_pokemon.species
  end
end

private

def search_params
  params.permit(:q)
end
