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
  end
end

private

def search_params
  params.permit(:q)
end
