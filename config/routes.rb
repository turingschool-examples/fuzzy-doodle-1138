Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mechanics, only: [:show]

  resources :amusement_parks, only: [:show]

  post '/mechanics/:mechanic_id/rides/new', to: 'ride_mechanics#create'
end
