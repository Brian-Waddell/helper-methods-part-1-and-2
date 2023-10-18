Rails.application.routes.draw do
  #get "/",  controller:  "movies", action: "index" 

  # Routes for the Movie resource:

  root "movies#index"

  # CREATE
  post "/movies" =>   "movies#create" 
  get "/movies/new" =>  "movies#new" 
          
  # READ
  ge"/movies" =>   "movies#index" 
  get"/movies/:id" =>  "movies#show" 
  
  # UPDATE
  patch "/movies/:id" =>  "movies#update" 
  get "/movies/:id/edit" =>  "movies#edit" 
  
  # DELETE
  delete "/movies/:id" =>  "movies#destroy"

  #------------------------------
end
