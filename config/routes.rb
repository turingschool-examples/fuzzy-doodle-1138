Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "mechanics/:mechanic_id", to: "mechanics#show"
  post "mechanics/:mechanic_id/rides", to: "ride_mechanics#update"

  get "amusement_park/:amusement_park_id", to: "amusement_parks#show"
end
