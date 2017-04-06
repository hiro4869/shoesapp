Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}
  
  root 'products#index'
  resources :products
  resources :users ,only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
