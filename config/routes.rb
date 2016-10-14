Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :requests do
  	resources :outfits
  end
  resources :items, only: :show

  get "/guide" => "guide#index"
  get "/guide/request" => "guide#request"
  get "/guide/tag" => "guide#tag"
  get "/guide/outfit" => "guide#outfit"
  get "/guide/outfit/show" => "guide#outfit_show"
  get "/guide/item/show" => "guide#item_show"


  namespace :admin do
  	resources :outfits
  	resources :items
  	resources :users
  	resources :tags
  end

  root "guide#index"

end
