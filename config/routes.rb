Rails.application.routes.draw do
  get("/mechanics/:id",   to: "mechanics#show")
  post("/mechanics/:id",   to: "mechanics#create")
  resources(:amusement_park,   only: [:show])
end
