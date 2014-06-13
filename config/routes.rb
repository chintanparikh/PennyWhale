Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"}

  devise_scope :user do
    get '/users/upgrade(.:format)', to: "registrations#upgrade", as: "upgrade"
    post '/users/upgrade(.:format)', to: "registrations#upgrade_user", as: "upgrade_user"
  end

  root 'home#index'
  post 'stripe/webhook', to: "stripe#webhook"

  get 'pages/terms_of_use', to:"pages#terms_of_use"
  get 'pages/privacy_policy', to:"pages#privacy_policy"

  namespace :app do
    root 'queries#index'
    get  'queries/index', to: 'queries#index', as: :queries_index
    get 'queries/execute', to: 'queries#execute', as: :queries_execute
    get 'queries/help', to: 'queries#help', as: :queries_help
    get 'queries/autocomplete', to: 'queries#autocomplete', as: :queries_autocomplete 
  end

  namespace :admin do
  end
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
