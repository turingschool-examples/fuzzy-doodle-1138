Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :amusement_parks do 
    resources :mechanics 

  end
end
