class PokemonsController < ApplicationController
  def index
    search = params[:q]
    page = params[:page] || 1

    @pokemons = Pokemon.all
    @pokemons = @pokemons.where('lower(name) LIKE ?', "%#{search.downcase}%") if search.present?
    @pokemons = @pokemons.paginate(page:, per_page: 32)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @evolutions = @pokemon.pokemon_evolutions.map(&:evolution)

    page = params[:page] || 1
    @adoptable_pokemons = AdoptablePokemon.where('species_id = ?', params[:id])
    @adoptable_pokemons = @adoptable_pokemons.paginate(page:, per_page: 16)
  end
end

private

def search_params
  params.permit(:q)
end
