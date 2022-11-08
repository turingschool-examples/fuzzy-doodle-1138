Rails.application.routes.draw do
  get("/mechanics/:id",   to: "mechanics#show")
  post("/mechanics/:id",   to: "mechanics#create")
end
