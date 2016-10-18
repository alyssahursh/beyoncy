Rails.application.routes.draw do

  # omniauth route
  get "/auth/:provider/callback" =>  "sessions#create"

  root to: 'pages#index', as: '/'

  resources :users, :reviews, :products, :categories, :orders, :addresses, :order_products

end
