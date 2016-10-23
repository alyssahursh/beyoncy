Rails.application.routes.draw do

  # omniauth route

  get "/auth/:provider/callback" =>  "sessions#create"

  get "logout" => "sessions#destroy", as: "logout"

  root to: 'pages#index'

  resources :users, :reviews, :products, :categories, :orders, :addresses, :order_products

  get 'account' => 'users#show', as: 'account'

end
