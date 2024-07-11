class AdoptablePokemonsController < ApplicationController
  def index
    @adoptable_pokemons = AdoptablePokemon.all
  end

  def show
    @adoptable_pokemon = AdoptablePokemon.find(params[:id])
    @species = @adoptable_pokemon.species
  end
end
