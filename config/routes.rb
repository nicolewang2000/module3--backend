Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    resources :drinks
    resources :ingredients
    resources :users
    resources :drink_ingredients
    resources :ratings
    post "/login", to: "auth#create"
    get "/ratings/drinks/:drink_id", to: "ratings#drinks"
  end

end
