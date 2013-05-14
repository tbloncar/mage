Mage::Application.routes.draw do
  get "/" => "Pages#home", :as => "home"
  get "/search" => "Pages#search", :as => "search"

  get "/sign-in" => 'Sessions#new', :as => "sign_in"
  delete "/sign-out" => 'Sessions#destroy', :as => "sign_out"
  post "/sign-in" => "Sessions#create", :as => "sessions"

  get "/register" => "Users#new", :as => "new_user"
  post "/register" => "Users#create", :as => "users"
  get "/users/:user_name" => "Users#show", :as => "user"
  get "/users/:user_name/edit" => "Users#edit", :as => "edit_user"
  put "/users/:user_name" => "Users#update", :as => "user"
  delete "/users/:user_name" => "Users#destroy", :as => "user"

  get "/resources/new" => "Resources#new", :as => "new_resource"
  post "/" => "Resources#create", :as => "resources"
  get "/resources/:id/edit" => "Resources#edit", :as => "edit_resource"
  put "/:classification_path/:craft_path/:resource_path" => "Resources#update", :as => "resource"
  get "/:classification_path/:craft_path/:resource_path" => "Resources#show", :as => "resource"

  get "/bundles/new" => "Bundles#new", :as => "new_bundle"
  post "/bundles" => "Bundles#create", :as => "bundles"
  get "/bundles" => "Bundles#index", :as => "bundles"
  get "/bundles/:bundle_path" => "Bundles#show", :as => "bundle"
  get "/bundles/:bundle_path/edit" => "Bundles#edit", :as => "edit_bundle"
  put "/bundles/:bundle_path" => "Bundles#update", :as => "bundle"
  delete "/bundles/:bundle_path" => "Bundles#destroy", :as => "bundle"

  get "/crafts/new" => "Crafts#new", :as => "new_craft"
  post "/crafts" => "Crafts#create", :as => "crafts"

  get "/:classification_path/:craft_path" => "Crafts#show", :as => "craft"
  get "/:classification_path" => "Classifications#show", :as => "classification"

  post "/relationships/:user_id" => "Relationships#create", :as => "relationship"
  delete "/relationships/:user_id" => "Relationships#destroy", :as => "relationship"

  post "/upvotes" => "Upvotes#create", :as => "upvotes"

  post "/comments/:resource_id" => "Comments#create", :as => "comments"
end
