Rails.application.routes.draw do
  get "/mechanics/:id", to: "mechanics#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
