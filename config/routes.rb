Rails.application.routes.draw do

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get 'homes/about'
  resources :books
  resources :users, only:[:show, :edit, :index, :update]
end
