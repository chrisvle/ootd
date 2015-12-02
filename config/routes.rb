Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons, only: [:create]
  patch 'pokemons/capture', to:'pokemons#capture', as: 'capture'
  patch 'pokemons/damage', to:'pokemons#damage', as: 'damage'
  patch 'pokemons/heal', to:'pokemons#heal', as: 'heal'
  get 'pokemons/new', to:'pokemons#new', as: 'new'
end
