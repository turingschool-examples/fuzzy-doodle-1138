Rails.application.routes.draw do
  resources :mechanics, only: [:show]

  resources :amusement_parks, only: [:show]

  post '/mechanics/:mechanic_id/rides', to: 'ride_mechanics#create'
end
