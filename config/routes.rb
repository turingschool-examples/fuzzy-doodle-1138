Rails.application.routes.draw do
  resources :mechanics, only: [:index, :show, :update]

  resources :amusementparks, only: [:index, :show]
end
