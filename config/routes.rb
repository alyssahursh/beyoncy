Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/create'

  get 'reviews/new'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'

  get 'order_products/index'

  get 'order_products/show'

  get 'order_products/new'

  get 'order_products/create'

  get 'order_products/edit'

  get 'order_products/udpate'

  get 'order_products/destroy'

  get 'categories/index'

  get 'categories/show'

  get 'categories/new'

  get 'categories/create'

  get 'categories/edit'

  get 'categories/udpate'

  get 'categories/destroy'

  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/create'

  get 'products/edit'

  get 'products/update'

  get 'products/destroy'

  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'

  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/create'

  get 'orders/edit'

  get 'orders/udpate'

  get 'orders/destroy'

  get 'o_rder/index'

  get 'o_rder/show'

  get 'o_rder/new'

  get 'o_rder/create'

  get 'o_rder/edit'

  get 'o_rder/update'

  get 'o_rder/destroy'

  get 'addresses/index'

  get 'addresses/show'

  get 'addresses/new'

  get 'addresses/create'

  get 'addresses/edit'

  get 'addresses/update'

  get 'addresses/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  get 'address/index'

  get 'address/show'

  get 'address/new'

  get 'address/create'

  get 'address/edit'

  get 'address/update'

  get 'address/destroy'

  get 'user/index'

  get 'user/show'

  get 'user/new'

  get 'user/create'

  get 'user/edit'

  get 'user/update'

  get 'user/destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
