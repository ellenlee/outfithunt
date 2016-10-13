Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :requests do
  	resources :outfits
  end
  resources :items, only: :show

  namespace :admin do
  	resources :outfits
  	resources :items
  	resources :users
  	resources :tags
  end

  root to: "guide#index"

end
