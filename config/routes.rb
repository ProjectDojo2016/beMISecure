Rails.application.routes.draw do

  resources :phone_requests
  resources :parking_events
  get 'home/welcome'

  devise_for :users
  resources :users
  resources :stations
  resources :chains 

  resources :chains
  root "home#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
