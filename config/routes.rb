Rails.application.routes.draw do
  get 'product_varieties/new'

  get 'product_varieties/create'

  # devise_for :users
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

  root 'root#index'

  resources :products do
    resources :product_images, only: [:destroy]
    resources :product_varieties, except: [:index] do
      resources :product_variety_images, only: [:destroy]
    end
    resource :purchases, only: [:new, :create]
  end

  get "purchases/index" => "purchases#index"

  resources :categories, only: [:show]

  resources :users , only: [:new, :create] do
    resources :carts , only: [:index, :create, :destroy] do
      collection do
        get :cart_added_confirm
        get :confirmation
        patch :raise_flag
        patch :down_flag
      end
    end
  end

  resources :orders, only: [:create, :index] do
    collection do
      get :confirmation
    end
  end

  get "users/new" => "users#new"
  get "user/:id" => "users#show"
  get "user/:id/edit" => "users#edit"
  patch "user/:id" => "users#update"
  get "users/privacy_policy" => "users#privacy_policy"
  post "/users/admin/" => "users#create"
  get "users/adminpage" => "users#adminpage"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
