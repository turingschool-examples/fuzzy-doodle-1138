Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mechanics/:id', to: 'mechanics#show'
  patch '/mechanics/:id', to: 'mechanics#update'

  get '/amusement_parks/:id', to: 'amusement_parks#show'
end
