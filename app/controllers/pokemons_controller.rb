class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @evolutions = @pokemon.pokemon_evolutions.map(&:evolution)
  end
end
