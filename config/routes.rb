Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

  root 'products#index'
  resources :products
  resources :categories, only: [:show]
  resources :purchases, only: [:new, :create]


  get "users/new" => "users#new"
  get "user/:id" => "users#show"
  post "/users/admin/" => "users#create"
  get "users/adminpage" => "users#adminpage"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
