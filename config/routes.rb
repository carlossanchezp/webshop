Webshop::Application.routes.draw do
  #get "menu/login"

  #get "sessions/destroy"
  #get "sessions/create"



  # Verbo -- RUTA -- ACCION -- HELPER
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "new_user"
  get "reviews" => "reviews#index"
  get "reviews/:id" => "reviews#show", :as => "review"
  delete "reviews/:id" => "reviews#destroy", :as => "review"


  #get "signup" => "users#new", :as => "new_user"
  #get "login" => "sessions#new", :as => "new_session"
  #get "logout"  => "sessions#destroy", :as => "logout"

  #root :to => "products#index"
  root :to => "sessions#new"
  resources :users, :except => [:new]

  # Definirlo en el controlador
  resources :products  do
    member do
      put 'publish'
      put 'unpublish'
    end
    collection do
      put 'publish_all'
      put 'unpublish_all'
    end
    collection    do
      put 'delete_all'
    end
    resources :reviews,  :only =>  [:index, :new, :create]
  end
  #resources :sessions

  resources :reviews, :only => [:index, :show, :destroy, :edit, :update]
  resources :sessions, :only => [:new, :create]
  resources :users, :except => [:new]


  #resources  :reviews, :only => [:index]

  #resources :reviews
  #ver primero si rails nos da una ruta valida por si no es necesario helpers como es el caso
  #get "reviews"  => "reviews#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
