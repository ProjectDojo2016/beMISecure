Rails.application.routes.draw do

  resources :commands
  resources :phone_requests
  resources :parking_events
  get 'home/welcome'

  devise_for :users
  resources :users
<<<<<<< HEAD
  resources :stations
  get 'stations/:id/my_commands', to: "stations#my_commands", as: "my_commands"
  resources :chains
=======
  resources :stations do 
    member do
      get 'my_commands'
    end
  end

  resources :stations
  resources :chains 
>>>>>>> d520d55045af21722eebdb873ceb9672a453bce8
  root "home#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
