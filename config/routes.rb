Rails.application.routes.draw do
  devise_for :users
  root to:"products#index"
  resources :products do
    resources :settlemnt_addresses, only: [:index, :create] 
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
