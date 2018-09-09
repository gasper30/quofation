Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :brands, only: [:show]
  root "brands#index"


  resource :products, only: [:index, :show]
  root "products#index"


  resources :thirtydays, only: [:index, :show] do
    collection do
      get :designers, to: "thirtydays#designers"
      get :products, to: "thirtydays#products"
    end
  end

  #建立設計師館頁面
  resources :designers, only: [:index, :show]

  #建立後台設計師CRUD
  namespace :admin do
    resources :designers
  end

  namespace :admin do
    resources :products
    root "products#index"
  end



end
