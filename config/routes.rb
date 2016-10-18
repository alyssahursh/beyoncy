Rails.application.routes.draw do
  
  # omniauth route
  get "/auth/:provider/callback" =>  "sessions#create"
  
  # review routes
  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/create'

  get 'reviews/new'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'


  # order routes
  get 'order_products/index'

  get 'order_products/show'

  get 'order_products/new'

  get 'order_products/create'

  get 'order_products/edit'

  get 'order_products/udpate'

  get 'order_products/destroy'


  # categorey routes
  get 'categories/index'

  get 'categories/show'

  get 'categories/new'

  get 'categories/create'

  get 'categories/edit'

  get 'categories/udpate'

  get 'categories/destroy'


  # products routes
  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/create'

  get 'products/edit'

  get 'products/update'

  get 'products/destroy'


  # review routes
  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'


  # order routes
  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/create'

  get 'orders/edit'

  get 'orders/udpate'

  get 'orders/destroy'


  # o_rder routes
  get 'o_rder/index'

  get 'o_rder/show'

  get 'o_rder/new'

  get 'o_rder/create'

  get 'o_rder/edit'

  get 'o_rder/update'

  get 'o_rder/destroy'


  # addressess routes
  get 'addresses/index'

  get 'addresses/show'

  get 'addresses/new'

  get 'addresses/create'

  get 'addresses/edit'

  get 'addresses/update'

  get 'addresses/destroy'


  # user routes
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'


  # address routes
  get 'address/index'

  get 'address/show'

  get 'address/new'

  get 'address/create'

  get 'address/edit'

  get 'address/update'

  get 'address/destroy'


  # second set of user routes
  get 'user/index'

  get 'user/show'

  get 'user/new'

  get 'user/create'

  get 'user/edit'

  get 'user/update'

  get 'user/destroy'

end
