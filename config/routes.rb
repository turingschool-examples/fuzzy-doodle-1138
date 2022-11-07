Rails.application.routes.draw do
  resources :mechanics, only: [:index, :show]
end
