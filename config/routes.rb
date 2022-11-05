Rails.application.routes.draw do
  resources :mechanics, only: [:show]

  post '/mechanics/:mechanic_id/rides', to: 'ride_mechanics#create'
 
end
