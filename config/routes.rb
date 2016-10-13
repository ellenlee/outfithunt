Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :requests do
  	resources :outfits
  end
  resources :items, only: :show
  resources :tags

  get "/outfit" => "guide#outfits"
  get "/outfit/show" => "guide#outfit_show"
  get "/item/show" => "guide#item_show"


  namespace :admin do
  	resources :outfits
  	resources :items
  	resources :users
  	resources :tags
  end

  root "guide#index"

end
