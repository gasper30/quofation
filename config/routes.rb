Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "products#index"
  #建立設計師館頁面
  resources :designers, only: [:index, :show]

  #建立後台設計師CRUD
  namespace :admin do
    resources :designers
  end
end
