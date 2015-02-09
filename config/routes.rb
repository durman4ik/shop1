Rails.application.routes.draw do

  get '', to: redirect("/#{I18n.locale}")

  scope '(:locale)', :locale => /ru|by|en/ do

    root 'index#index'

    devise_for :users, skip: :omniauth_callbacks

    match "/users/auth/:provider",
          constraints: { provider: /vkontakte|facebook/ },
          to: "omniauth_callbacks#passthru",
          as: :omniauth_authorize,
          via: [:get, :post]

    match "/users/auth/:action/callback",
          constraints: { action: /vkontakte|facebook/ },
          to: "omniauth_callbacks",
          as: :omniauth_callback,
          via: [:get, :post]

    resources :products
    resources :product_properties
    resources :line_items do
      member do
        post 'increase', as: :increase
        post 'decrease', as: :decrease
      end

    end
    resources :carts


    post 'api/v' => 'store#render_cart_ico', as: :render_cart_ico
    get '404' => 'pages#not_found', as: :not_found
    get 'account' => 'users#account', as: :account
    get 'store' => 'store#index', as: :catalog
    get 'about' => 'pages#about', as: :about
    get 'help' => 'pages#help', as: :help

  end

  # resources :products

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
