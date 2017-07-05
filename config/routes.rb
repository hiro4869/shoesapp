Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

  root 'root#index'

  resources :products do
    resource :purchases, only: [:new, :create]
  end
  get "purchases/index" => "purchases#index"

  
  resources :categories, only: [:show]


  get "users/new" => "users#new"
  get "user/:id" => "users#show"
  get "users/privacy_policy" => "users#privacy_policy"
  post "/users/admin/" => "users#create"
  get "users/adminpage" => "users#adminpage"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
