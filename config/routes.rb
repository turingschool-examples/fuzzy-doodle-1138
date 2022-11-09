Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mechanics
  post '/mechanic_rides', to: 'mechanic_rides#create'
  resources :amusement_parks
end
