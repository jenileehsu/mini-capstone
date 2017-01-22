Rails.application.routes.draw do

  get "/products" => "products#index"

  get "/products/:id" => "products#show"

  get "/littlebee" => "products#get_little_bee"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
