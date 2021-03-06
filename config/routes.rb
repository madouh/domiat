Rails.application.routes.draw do

  match 'auth/:provider/callback', to: 'sessions#create' , via: :get
  match 'auth/failure', to: redirect('/'), via: :get
  match 'signout', to: 'sessions#destroy', as: 'signout', via: :get
  get 'find/search'
  get 'find/show'
  get 'find/detail'
  get 'find/advanced'
  get 'find/corrupt'
  get 'find/ads'
  get 'find/nearest'
  get 'find/nearestresult'
  get 'agents/waited'

  devise_for :users #, :controllers => {:registerations=> "registerations"}
  resources :agents do
       member do
         get 'toggle'
         get 'mapandroute'
         
    end
  end

  resources :activities

  resources :neighbours

  resources :regions
  get 'domiat/cleanall'
  get 'domiat/art'
  get 'domiat/users'
  get 'domiat/user/:id' => 'domiat#user'

  get 'domiat/clean'
  get 'domiat/exception'
  get 'domiat/show/:id'  => 'domiat#show'
  get 'domiat/welcome'
  match 'about' => 'domiat#about', :as => 'about', via: :get
  #match 'domiat/about', :as => "about", via: :get
  root 'domiat#welcome'
  resources :posts
  get 'suggest' => 'posts#suggest'
  get 'wantdelete' => 'posts#wantdelete'
  get 'newactivity' => 'posts#newactivity'
  get 'wrongdata' => 'posts#wrongdata'
  get 'complain' => 'posts#complain'
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
