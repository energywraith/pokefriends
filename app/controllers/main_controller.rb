class MainController < ApplicationController
  def index
    @pokemon_count = Pokemon.count
  end
end
