Goggles::Application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin' # Feel free to change '/admin' to any namespace you need.
  mount DjMon::Engine => 'dj_mon'

  devise_for :users

  netzke

  # [Steve, 20130716] Root's route required by Devise:
  root :to => "home#index", :locale => /en|it/

  # The priority is based upon order of creation:
  # first created -> highest priority.


  scope "/" do
    scope "(:locale)", :locale => /en|it/ do
      match "wip",        :controller => 'home', :action => 'wip',          :as => :wip
      match "about",      :controller => 'home', :action => 'about',        :as => :about
      match "contact_us", :controller => 'home', :action => 'contact_us',   :as => :contact_us

      resources :meetings do
        member do
          get 'show_full'
          get 'show_swimmer_results'
          get 'show_team_results'
        end
      end

      resources :meeting_programs
      resources :rankings
      resources :results
#      resources :meetings do
#        collection do
#          get 'index'
#        end
#      end
    end
  end


  scope "goggles_data_import" do
    scope "(:locale)", :locale => /en|it/ do
      match "get_step_progress",      :controller => 'admin_import', :action => 'get_step_progress',      :as => :goggles_di_get_step_progress
      match "step1_status",           :controller => 'admin_import', :action => 'step1_status',           :as => :goggles_di_step1_status
      match "step2_checkout",         :controller => 'admin_import', :action => 'step2_checkout',         :as => :goggles_di_step2_checkout
      match "step3_commit",           :controller => 'admin_import', :action => 'step3_commit',           :as => :goggles_di_step3_commit
      match "kill_import_session",    :controller => 'admin_import', :action => 'kill_import_session',    :as => :goggles_di_kill_import_session, :method => :post

      match "step2_analysis",         :controller => 'admin_import', :action => 'step2_analysis',         :as => :goggles_di_step2_analysis
      match "step3_analysis_commit",  :controller => 'admin_import', :action => 'step3_analysis_commit',  :as => :goggles_di_step3_analysis_commit, :method => :post
    end
  end

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
  # match ':controller(/:action(/:id(.:format)))'
end
