PersonalBlog::Application.routes.draw do
  devise_for :users
  resources :admin, :only => [:index]
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # See how all your routes lay out with "rake routes"

  root :to => "posts#overview"
  resource :profile, :only => [:show, :update]
  resource :projects
  resources :posts do
    collection do
      get 'overview'
    end
  end

  resources :contacts

  match "blog"  => "posts#overview", :as => "blog"
  match "about"  => "profiles#index", :as => "about"
  match "blog/:id"  => "posts#show", :as => "blog_item"
  match "get_in_touch" => "contacts#new" , :as => "get_in_touch"

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

  #Sample resource route with options:
    #resources :products do
      #member do
        #get 'short'
        #post 'toggle'
      #end

      #collection do
        #get 'sold'
      #end
    #end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  #Sample resource route with more complex sub-resources
    #resources :products do
      #resources :comments
      #resources :sales do
        #get 'recent', :on => :collection
      #end
    #end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
