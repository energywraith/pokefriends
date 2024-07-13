class MainController < ApplicationController
  def index
    @pokemon_count = Pokemon.count
    @recent_adoptable_pokemons = AdoptablePokemon.last(6).reverse
  end
end
