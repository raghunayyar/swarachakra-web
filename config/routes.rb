Rails.application.routes.draw do

  get 'languages/index'

  get 'languages/all'

  get 'languages/enabled'

  root 'home#index'

  # All Resources
  resource :csv

  # All Admin Related URIs are here.
  get 'admin/new'
  get 'admin/dashboard'

  match '/admin/upload', to: 'admin#upload', via: 'post'
  match 'languages/all/:id', to: 'admin#destroy', via: 'delete'
  match 'languages/all/:id', to: 'admin#update', via: 'patch'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'home/index'
  get 'home/login'

  match '/login', to: 'home#login', via: 'get'
  match '/login', to: 'home#login', via: 'post'
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
