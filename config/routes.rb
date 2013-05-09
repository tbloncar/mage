Mage::Application.routes.draw do
  get "/" => "Pages#home", :as => "home"
  get "/search" => "Pages#search", :as => "search"

  # Session
  # ---------------------------------------------
  
  get "/sign-in" => 'Sessions#new', :as => "sign_in"
  delete "/sign-out" => 'Sessions#destroy', :as => "sign_out"
  post "/sign-in" => "Sessions#create", :as => "sessions"

  # User
  # ---------------------------------------------

  # CREATE

  get "/register" => "Users#new", :as => "new_user"
  post "/register" => "Users#create", :as => "users"

  # READ

  # get "/users" => "Users#index"
  get "/users/:user_name" => "Users#show", :as => "user"

  # UPDATE

  get "/users/:user_name/edit" => "Users#edit", :as => "edit_user"
  put "/users/:user_name" => "Users#update", :as => "user"

  # DELETE

  delete "/users/:user_name" => "Users#destroy", :as => "user"

  # Resource
  # ---------------------------------------------

  # CREATE

  get "/resources/new" => "Resources#new", :as => "new_resource"
  post "/" => "Resources#create", :as => "resources"


  # READ

  get "/:classification_path/:craft_path/:resource_path" => "Resources#show", :as => "resource"

  # UPDATE

  put "/:classification_path/:craft_path/:resource_path" => "Resources#update", :as => "resource"

  # DELETE

  # SEARCH

  # Craft
  # ---------------------------------------------

  get "/:classification_path/:craft_path" => "Crafts#show", :as => "craft"


  # Classification
  # ---------------------------------------------

  # READ

  get "/:classification_path" => "Classifications#show", :as => "classification"

  # Relationships
  # ----------------------------------------------

  post "/relationships/:user_id" => "Relationships#create", :as => "relationship"



end
