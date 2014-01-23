Goggles::Application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/goggles_dashboard', :as => 'rails_admin' # Feel free to change '/admin' to any namespace you need.
  mount DjMon::Engine => 'goggles_dj_mon'

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
        collection do
          get 'index'
          get 'search_swimmer'
          get 'search_team'
        end
        member do
          get 'show_full'
          get 'show_ranking'
          get 'show_stats'
          get 'show_team_results'
          get 'show_swimmer_results'
        end
      end

      resources :teams do
        member do
          get 'count_meetings'
          get 'count_results'
          get 'count_details'
        end
      end

      resources :meeting_programs
      resources :rankings
      resources :results

      resources :swimming_pools
      resources :trainings do
        member do
          get 'printout'
        end
      end

      resources :exercises do
        collection do
          get 'json_list'
        end
      end

      match "meeting_calendars",        :controller => 'meeting_calendars', :action => 'index'
      match "records_for_everything",   :controller => 'records', :action => 'for_everything'
      match "records_for_season_type",  :controller => 'records', :action => 'for_season_type'
      match "records_for_swimmer",      :controller => 'records', :action => 'for_swimmer'
      match "records_for_team",         :controller => 'records', :action => 'for_team'
      match "records_show_for_team",    :controller => 'records', :action => 'show_for_team'

      resources :swimmers do
        member do
          get 'radio'
          get 'medals'
          get 'best_timings'
          get 'all_races'
          get 'misc'
        end
      end
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

  scope "goggles_admin" do
    scope "(:locale)", :locale => /en|it/ do
      match "/",                      :controller => 'admin_index', :action => 'index',             :as => :goggles_admin_index
      match "index",                  :controller => 'admin_index', :action => 'index',             :as => :goggles_admin_index

      match "db_structure",           :controller => 'admin_index', :action => 'db_structure'
      match "db_reset",               :controller => 'admin_index', :action => 'db_reset',          :via => :post
      match "run_db_migrations",      :controller => 'admin_index', :action => 'run_db_migrations', :via => :post
      match "run_sql_exec",           :controller => 'admin_index', :action => 'run_sql_exec',      :via => :post

      match "select_meeting",         :controller => 'admin_index', :action => 'select_meeting'
      match "delete_meeting",         :controller => 'admin_index', :action => 'delete_meeting',    :via => :post
      match "select_teams",           :controller => 'admin_index', :action => 'select_teams'

      match "run_rake",               :controller => 'admin_index', :action => 'run_rake',          :via => [:get, :post]
      match "run_bundle",             :controller => 'admin_index', :action => 'run_bundle',        :via => [:get, :post]
      match "run_sudo_command",       :controller => 'admin_index', :action => 'run_sudo_command',  :via => [:get, :post]
      match "restart_apache",         :controller => 'admin_index', :action => 'restart_apache',    :via => [:get, :post]

      match "run_src_upgrade",        :controller => 'admin_index', :action => 'run_src_upgrade',   :via => [:get, :post]

      match "upload_db_dump",         :controller => 'admin_index', :action => 'upload_db_dump',    :via => [:get, :post]
      match "upload_db_seed",         :controller => 'admin_index', :action => 'upload_db_seed',    :via => [:get, :post]

      match "download_db_dump",       :controller => 'admin_index', :action => 'download_db_dump'
      match "download_team_dump",     :controller => 'admin_index', :action => 'download_team_dump'
      match "download_swimmer_dump",  :controller => 'admin_index', :action => 'download_swimmer_dump'
      match "download_user_dump",     :controller => 'admin_index', :action => 'download_user_dump'
      match "cleanup_output_dir",     :controller => 'admin_index', :action => 'cleanup_output_dir'
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
