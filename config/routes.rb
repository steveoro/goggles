Goggles::Application.routes.draw do

  resources :swimmers


  # The priority is based upon order of creation:
  # first created -> highest priority.

  devise_for :controllers => { :sessions => "Sessions" } # [Steve, 20140401] Custom controller for additional customization (OmniAuth, ...)
  devise_for :admins
  devise_for :users

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      devise_scope :user do
        get "sessions/create"
        get "sessions/destroy"

        resource :team do
          member do
            get 'count_meetings'
            get 'count_results'
            get 'count_details'
          end
        end
        resources :exercises              #, only: 'json_list'
        resources :trainings              #, only: 'json_list'
        resources :user_trainings         #, only: 'json_list'
        resources :user_training_stories

        get    "news_feed/for_user/:id",        to: "news_feeds#for_user",  as: "news_feed_for_user"
        post   "news_feed/create/:news_feed",   to: "news_feeds#create",    as: "news_feed_create"
        delete "news_feed/delete/:id",          to: "news_feeds#delete",    as: "news_feed_delete"

        # TODO Extract/duplicate all API-actions into API-dedicated routes, like this one:
        # resources :exercises do
          # member do
            # get 'json_list', controller: :exercises, action: :json_list
          # end
          # collection do
            # get 'json_list', controller: :exercises, action: :json_list
          # end
        # end
      end
    end
  end

  mount RailsAdmin::Engine => '/goggles_dashboard', :as => 'rails_admin' # Feel free to change '/admin' to any namespace you need.
  mount DjMon::Engine => 'goggles_dj_mon'

  netzke                                            # [Steve] Netzke routes are used just by the Goggles-admin sub-app

  # [Steve, 20130716] Root's route required by Devise:
  root :to => "home#index", :locale => /en|it/


  scope "/" do
    scope "(:locale)", :locale => /en|it/ do
      match "wip",        to: "home#wip"
      match "about",      to: "home#about"
      match "contact_us", to: "home#contact_us"
      match "associate",  to: "home#associate", via: [:get, :post]
      match "dissociate", to: "home#dissociate", via: :post
#      get "meetings/index",                     to: "meetings#index",                   as: "meetings"

#      resources :meetings # do
        # collection do
          # get 'index'
          # get 'search_swimmer'
          # get 'search_team'
        # end
        # member do
          # get 'show_full'
          # get 'show_ranking'
          # get 'show_stats'
          # get 'show_team_results'
          # get 'show_swimmer_results'
        # end
      # end

#      get 'photos/:id', to: 'photos#show'
#      get 'exit', to: 'sessions#destroy', as: :logout

      get "meetings/index",                     to: "meetings#index",                   as: "meetings"
      get "meetings/search_swimmer",            to: "meetings#search_swimmer"
      get "meetings/search_team",               to: "meetings#search_team"
      get "meeting/show_full/:id",              to: "meetings#show_full",               as: "meeting_show_full"
      get "meeting/show_ranking/:id",           to: "meetings#show_ranking",            as: "meeting_show_ranking"
      get "meeting/show_stats/:id",             to: "meetings#show_stats",              as: "meeting_show_stats"
      get "meeting/show_team_results/:id",      to: "meetings#show_team_results",       as: "meeting_show_team_results"
      get "meeting/show_swimmer_results/:id",   to: "meetings#show_swimmer_results",    as: "meeting_show_swimmer_results"

#      resources :teams # do
        # member do
          # get 'count_meetings'
          # get 'count_results'
          # get 'count_details'
        # end
      # end
      get "teams/count_meetings/:id",           to: "teams#count_meetings",             as: "team_count_meetings"
      get "teams/count_results/:id",            to: "teams#count_results",              as: "team_count_results"
      get "teams/count_details/:id",            to: "teams#count_details",              as: "team_count_results"

#      resources :meeting_programs
      get "meeting_programs/index",             as: "meeting_programs"

#      resources :rankings
      get "rankings/index",                     as: "rankings"
      get "ranking/:id",                        to: "rankings#show",                    as: "ranking"

#      resources :results
      get "results/index",                      as: "results"
      get "result/:id",                         to: "results#show",                     as: "result"

#      resources :swimming_pools
      get "swimming_pools/index",               as: "swimming_pools"
      get "swimming_pool/:id",                  to: "swimming_pools#show",              as: "swimming_pool"

      resources :trainings # do
        # member do
          # get 'printout'
          # post 'duplicate'
          # post 'create_user_training'
        # end
#      end
      get  "training/printout/:id",             to: "trainings#printout",               as: "training_printout"
      post "training/duplicate/:id",            to: "trainings#duplicate",              as: "training_duplicate"
      post "training/create_user_training/:id", to: "trainings#create_user_training",   as: "training_create_user_training"

      resources :user_trainings # do
        # member do
# #          get 'json_list'
          # get 'printout'
          # post 'duplicate'
          # post 'create_user_story'
        # end
# #        collection do
# #          get 'json_list'
# #        end
      # end
      get  "user_trainings/json_list",          to: "user_trainings#json_list"
      get  "user_training/json_list/:id",       to: "user_trainings#json_list",           as: "user_training_json_list"
      get  "user_training/printout/:id",        to: "user_trainings#printout",            as: "user_training_printout"
      post "user_training/duplicate/:id",       to: "user_trainings#duplicate",           as: "user_training_duplicate"
      post "user_training/create_user_story/:id", to: "user_trainings#create_user_story", as: "user_training_create_user_story"

      resources :user_training_stories

      resources :exercises # do
        # member do
          # get 'json_list'
        # end
        # collection do
          # get 'json_list'
        # end
      # end
      get  "exercises/json_list",               to: "exercises#json_list"
      get  "exercise/json_list/:id",            to: "exercises#json_list",              as: "exercise_json_list"

      get  "socials/show_all",                  to: "socials#show_all"
      post "social/association_confirm/:id",    to: "socials#association_confirm",      as: "social_association_confirm"
      post "social/association_unconfirm/:id",  to: "socials#association_unconfirm",    as: "social_association_unconfirm"
      match "social/invite/:id",                to: "socials#invite",                   as: "social_invite", via: [:get, :post]
#      post "social/invite/:id",                 to: "socials#invite"
      get  "social/approve/:id",                to: "socials#approve",                  as: "social_approve"
      post "social/approve/:id",                to: "socials#approve"
      get  "social/block/:id",                  to: "socials#block",                    as: "social_block"
      post "social/block/:id",                  to: "socials#block"
      get  "social/unblock/:id",                to: "socials#unblock",                  as: "social_unblock"
      post "social/unblock/:id",                to: "socials#unblock"
      get  "social/remove/:id",                 to: "socials#remove",                   as: "social_remove"
      post "social/remove/:id",                 to: "socials#remove"
      get  "social/edit/:id",                   to: "socials#edit",                     as: "social_edit"
      post "social/edit/:id",                   to: "socials#edit"

      get  "meeting_calendars/index",           as: "meeting_calendars"

      get  "records/for_everything",            to: "records#for_everything"
      get  "records/for_season_type",           to: "records#for_season_type"
      get  "records/for_swimmer",               to: "records#for_swimmer"
      get  "records/for_team",                  to: "records#for_team"
      get  "records/show_for_team",             to: "records#show_for_team"

#      resources :swimmers # do
        # member do
          # get 'radio'
          # get 'medals'
          # get 'best_timings'
          # get 'all_races'
          # get 'misc'
        # end
      # end
      get  "swimmers/index",                    as: "swimmers"
      get  "swimmer/radio/:id",                 to: "swimmers#radio",                   as: "swimmer_radio"
      get  "swimmer/medals/:id",                to: "swimmers#medals",                  as: "swimmer_medals"
      get  "swimmer/best_timings/:id",          to: "swimmers#best_timings",            as: "swimmer_best_timings"
      get  "swimmer/all_races/:id",             to: "swimmers#all_races",               as: "swimmer_all_races"
      get  "swimmer/misc/:id",                  to: "swimmers#misc",                    as: "swimmer_misc"
    end
  end


# TODO Rewrite all the following routes using the above format:
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

  # ----------------------------------------------------------------------------


  # Any other routes are handled here (since in Rails 3 ActionDispatch prevents
  # RoutingError from hitting ApplicationController::rescue_action).
  # In other words, this wildcard route will catch all the other cases:
#  match "*path", :to => "application#routing_error"
end
