Rails.application.routes.draw do
  

  resources :mechanics, only: [:show] 
    # resources :ride_mechanics, only: [:create]

  post '/mechanics/:mechanic_id/ride_mechanics', to: 'ride_mechanics#create'
  
  
end
