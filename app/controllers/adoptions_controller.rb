class AdoptionsController < ApplicationController
  def new
    @adoption = Adoption.new
    @adoptable_pokemon = AdoptablePokemon.find(params[:id])
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoptable_pokemon = AdoptablePokemon.find(params[:id])

    if @adoption.save
      redirect_to success_adoptable_pokemon_path(params[:id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def success
    @adoptable_pokemon = AdoptablePokemon.find(params[:id])
  end

  private

  def adoption_params
    params.require(:adoption).permit(:adoptable_pokemon_id, :full_name, :email_address, :phone_number, :city, :household_ownership,
                                     :household_size, :household_children, :has_experience, :why_adopt_pokemon, :desired_pokemon_traits)
  end
end
