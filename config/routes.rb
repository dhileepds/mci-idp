Myapp::Application.routes.draw do
  scope "(:locale)", :locale => /en|ar/ do
    devise_scope :user do
      root :to => 'devise/sessions#new'
      delete "sign out" => "devise/session#destroy"
    end
    devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: '', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
   
     get "home/index"
     get "home/minor"
     get "langs/show"
     get 'source_data/chart'
     get 'view_lang' => 'langs#view'
     get 'show_lang' => 'langs#show'
     #post 'langs/update'
     #post "langs/update"
     get 'update_lang' => 'langs#update'
     post 'update_lang' => 'langs#update'
     get 'source' => 'source_data#source'
     get 'edit' => 'source_data#edit'
     get 'nsnlist' => 'source_data#nsnlist'
     get 'dictionary_detail' => 'source_data#dictionary_detail'
     get 'sourceinv' => 'source_data#sourceinv'
     get 'view' => 'source_data#view'
     get 'viewsource' => 'source_data#viewsource'
     get 'sourceref' => 'source_data#sourceref'
     get "madein_ksa/show"
    get 'show_ksa' => 'madein_ksa#show'
    get 'viewksa' => 'madein_ksa#view'
    post 'image_upload' => 'madein_ksa#view'
    get "exemption/show"
    get 'show_exemption' => 'exemption#show'
    get 'view_exemption' => 'exemption#view'
     #post 'update' => 'langs#update'
    # post "update"

  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
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
