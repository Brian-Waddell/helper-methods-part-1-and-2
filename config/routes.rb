Rails.application.routes.draw do
  #get "/",  controller:  "movies", action: "index" 

  # Routes for the Movie resource:

  root "movies#index"

  # CREATE
  post "/movies" =>   "movies#create", as: :movies #movies url and movie path
  get "/movies/new" =>  "movies#new" , as: :new_movie #new_movie url and path
          
  # READ
  get "/movies" =>   "movies#index" 
  get"/movies/:id" =>  "movies#show", as: :details 
  
  # UPDATE
  patch "/movies/:id" =>  "movies#update" 
  get "/movies/:id/edit" =>  "movies#edit", as: :edit_movie
  
  # DELETE
  delete "/movies/:id" =>  "movies#destroy"

  #------------------------------
end
