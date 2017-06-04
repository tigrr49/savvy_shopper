Rails.application.routes.draw do

  # Routes for the Shopping_list_item resource:
  # CREATE
  get "/shopping_list_items/new", :controller => "shopping_list_items", :action => "new"
  post "/create_shopping_list_item", :controller => "shopping_list_items", :action => "create"

  # READ
  get "/shopping_list_items", :controller => "shopping_list_items", :action => "index"
  get "/shopping_list_items/:id", :controller => "shopping_list_items", :action => "show"

  # UPDATE
  get "/shopping_list_items/:id/edit", :controller => "shopping_list_items", :action => "edit"
  post "/update_shopping_list_item/:id", :controller => "shopping_list_items", :action => "update"

  # DELETE
  get "/delete_shopping_list_item/:id", :controller => "shopping_list_items", :action => "destroy"
  #------------------------------

  # Routes for the Price_entry resource:
  # CREATE
  get "/price_entries/new", :controller => "price_entries", :action => "new"
  post "/create_price_entry", :controller => "price_entries", :action => "create"

  # READ
  get "/price_entries", :controller => "price_entries", :action => "index"
  get "/price_entries/:id", :controller => "price_entries", :action => "show"

  # UPDATE
  get "/price_entries/:id/edit", :controller => "price_entries", :action => "edit"
  post "/update_price_entry/:id", :controller => "price_entries", :action => "update"

  # DELETE
  get "/delete_price_entry/:id", :controller => "price_entries", :action => "destroy"
  #------------------------------

  # Routes for the Unit resource:
  # CREATE
  get "/units/new", :controller => "units", :action => "new"
  post "/create_unit", :controller => "units", :action => "create"

  # READ
  get "/units", :controller => "units", :action => "index"
  get "/units/:id", :controller => "units", :action => "show"

  # UPDATE
  get "/units/:id/edit", :controller => "units", :action => "edit"
  post "/update_unit/:id", :controller => "units", :action => "update"

  # DELETE
  get "/delete_unit/:id", :controller => "units", :action => "destroy"
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"

  # READ
  get "/items", :controller => "items", :action => "index"
  get "/items/:id", :controller => "items", :action => "show"

  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"

  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------

  # Routes for the Category resource:
  # CREATE
  get "/categories/new", :controller => "categories", :action => "new"
  post "/create_category", :controller => "categories", :action => "create"

  # READ
  get "/categories", :controller => "categories", :action => "index"
  get "/categories/:id", :controller => "categories", :action => "show"

  # UPDATE
  get "/categories/:id/edit", :controller => "categories", :action => "edit"
  post "/update_category/:id", :controller => "categories", :action => "update"

  # DELETE
  get "/delete_category/:id", :controller => "categories", :action => "destroy"
  #------------------------------

  # Routes for the Store resource:
  # CREATE
  get "/stores/new", :controller => "stores", :action => "new"
  post "/create_store", :controller => "stores", :action => "create"

  # READ
  get "/stores", :controller => "stores", :action => "index"
  get "/stores/:id", :controller => "stores", :action => "show"

  # UPDATE
  get "/stores/:id/edit", :controller => "stores", :action => "edit"
  post "/update_store/:id", :controller => "stores", :action => "update"

  # DELETE
  get "/delete_store/:id", :controller => "stores", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "home#index"

devise_for :users

end
