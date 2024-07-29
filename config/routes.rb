Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'main#index'
  resources :pokemons, only: %i[index show], path: 'pokedex'
  resources :adoptable_pokemons, only: %i[index show], path: 'pokemons' do
    member do
      get '/adopt', to: 'adoptions#new'
      post '/adopt', to: 'adoptions#create'
      get '/adopt/success', to: 'adoptions#success', as: :success
    end
  end
  # get '/pokemons/adopt/:id', to: 'adoptable_pokemons#adopt', as: 'adopt'
end
