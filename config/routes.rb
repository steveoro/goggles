Goggles::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

# FIXME
  devise_for :controllers => { :sessions => "Sessions" } # [Steve, 20140401] Custom controller for additional customization (OmniAuth, ...)
  devise_for :admins
  devise_for :users

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      devise_scope :user do
        get "sessions/create"
        get "sessions/destroy"
      end

      # === Exercises ===
      get    "exercises/index",               to: "exercises#index",        as: "exercises"
      get    "exercises/show/:id",            to: "exercises#show",         as: "exercise_show"
      # TODO Use decorators to return custom-tailored exercise rows for API usage in json_list (becomes => #decorated_index & #decorated_show or use a param for existing actions)
      # TODO => use new decorated action responders with AJAX query for UserTraining exercise look-up

      # === Meetings ===
      get    "meetings/index",                to: "meetings#index",         as: "meetings"
      get    "meetings/show/:id",             to: "meetings#show",          as: "meeting_show"
      # TODO meeting details w/ subentities in dedicated controllers? => No: use decorators to return custom-tailored meeting rows for API usage

      # === News Feeds ===
      get    "news_feed/for_user/:id",        to: "news_feeds#for_user",    as: "news_feed_for_user"
      post   "news_feed/create/:news_feed",   to: "news_feeds#create",      as: "news_feed_create"
      put    "news_feed/read/:id",            to: "news_feeds#read",        as: "news_feed_read"
      delete "news_feed/destroy/:id",         to: "news_feeds#destroy",     as: "news_feed_destroy"

      # === Records ===
      get    "records/for_federation/:id",    to: "records#for_federation", as: "records_ffor_federation"
      get    "records/for_season_type/:id",   to: "records#for_season_type",as: "records_for_season_type"
      get    "records/for_team/:id",          to: "records#for_team",       as: "records_for_team"
      get    "records/for_swimmer/:id",       to: "records#for_swimmer",    as: "records_for_swimmer"
      get    "records/count_records_for_swimmer/:id", to: "records#count_records_for_swimmer", as: "records_count_records_for_swimmer"
      get    "records/for_personal_best/:id", to: "records#for_personal_best", as: "records_for_personal_best"

      # === Swimmers ===
      get    "swimmers/index",                to: "swimmers#index",         as: "swimmers"
      get    "swimmers/show/:id",             to: "swimmers#show",          as: "swimmer_show"

      # === Teams ===
      get    "team/count_meetings/:id",       to: "teams#count_meetings",   as: "team_count_meetings"
      get    "team/count_results/:id",        to: "teams#count_results",    as: "team_count_results"
      get    "team/count_details/:id",        to: "teams#count_details",    as: "team_count_details"
      get    "team/current_swimmers/:id",     to: "teams#current_swimmers", as: "team_current_swimmers"
      get    "teams/index",                   to: "teams#index",            as: "teams"
      get    "teams/show/:id",                to: "teams#show",             as: "team_show"

      # === Trainings ===
      get    "trainings/index",               to: "trainings#index",        as: "trainings"
      get    "trainings/show/:id",            to: "trainings#show",         as: "trainings_show"

      # TODO extract and enlist only the actual routes used:
      resources :user_trainings         #, only: 'json_list'
      resources :user_training_stories
    end
  end

  mount RailsAdmin::Engine => '/goggles_dashboard', as: 'rails_admin' # Feel free to change '/admin' to any namespace you need.
  mount DjMon::Engine => 'goggles_dj_mon'

  netzke                                            # [Steve] Netzke routes are used just by the Goggles-admin sub-app

  # [Steve, 20130716] Root's route required by Devise:
  root :to => "home#index", locale: /en|it/


  scope "/" do
    scope "(:locale)", locale: /en|it/ do
      # === Home ===
      match "wip",                              to: "home#wip"
      match "about",                            to: "home#about"
      match "contact_us",                       to: "home#contact_us"
      match "maintenance",                      to: "home#maintenance"
      match "tutorials",                        to: "home#tutorials"

      # === Socials ===
      # A user associates himself/herself with a swimmer:
      match "associate",                        to: "socials#associate",  via: [:get, :post]
      match "dissociate",                       to: "socials#dissociate", via: :post

      # A user temporary skips the requested association with a swimmer:
      post "social/skip_associate",             to: "socials#skip_associate",           as: "social_skip_associate"

      # A user confirms or unconfirms another user's association with a swimmer:
      post "social/association_confirm/:id",    to: "socials#association_confirm",      as: "social_association_confirm"
      post "social/association_unconfirm/:id",  to: "socials#association_unconfirm",    as: "social_association_unconfirm"

      # Any user can manage his/her swimming buddies:
      get  "socials/show_all",                  to: "socials#show_all"
      match "social/invite/:id",                to: "socials#invite",                   as: "social_invite", via: [:get, :post]
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

      # === Meetings ===
      get "meetings/current",                   to: "meetings#current"
      get "meetings/custom_search",             to: "meetings#custom_search"
      get "meetings/simple_search",             to: "meetings#simple_search"
      # TODO / FUTURE DEV:
#      get "meetings/tagged_by_me",              to: "meetings#tagged_by_me"
#      get "meetings/tagged_by_buddies",         to: "meetings#tagged_by_buddies"
      get "meetings/search_swimmer",            to: "meetings#search_swimmer"
      get "meetings/search_team",               to: "meetings#search_team"
      get "meeting/show_invitation/:id",        to: "meetings#show_invitation",         as: "meeting_show_invitation"
      get "meeting/show_start_list/:id",        to: "meetings#show_start_list",         as: "meeting_show_start_list"
      get "meeting/show_start_list_by_category/:id", to: "meetings#show_start_list_by_category", as: "meeting_show_start_list_by_category"
      get "meeting/show_team_entries/:id",      to: "meetings#show_team_entries",       as: "meeting_show_team_entries"
      get "meeting/show_full/:id",              to: "meetings#show_full",               as: "meeting_show_full"
      get "meeting/show_ranking/:id",           to: "meetings#show_ranking",            as: "meeting_show_ranking"
      get "meeting/show_stats/:id",             to: "meetings#show_stats",              as: "meeting_show_stats"
      get "meeting/show_team_results/:id",      to: "meetings#show_team_results",       as: "meeting_show_team_results"
      get "meeting/show_swimmer_results/:id",   to: "meetings#show_swimmer_results",    as: "meeting_show_swimmer_results"
      get "meeting/show_autoscroll/:id",        to: "meetings#show_autoscroll",         as: "meeting_show_autoscroll"

      # === Records ===
      get  "records/for_season_type",           to: "records#for_season_type"
      get  "records/for_team",                  to: "records#for_team"
      get  "records/for_swimmer",               to: "records#for_swimmer"
      # FIXME
      get  "records/show_for_team",             to: "records#show_for_team"
      get  "records/for_personal_best",         to: "records#for_personal_best"

      # === Swimmers ===
      get  "swimmers/index",                    as: "swimmers"
      get  "swimmer/radio/:id",                 to: "swimmers#radio",                   as: "swimmer_radio"
      get  "swimmer/medals/:id",                to: "swimmers#medals",                  as: "swimmer_medals"
      get  "swimmer/best_timings/:id",          to: "swimmers#best_timings",            as: "swimmer_best_timings"
      get  "swimmer/full_history_1/:id",        to: "swimmers#full_history_1",          as: "swimmer_full_history_1"
      get  "swimmer/full_history_2/:id",        to: "swimmers#full_history_2",          as: "swimmer_full_history_2"
      get  "swimmer/current_goggle_cup/:id",    to: "swimmers#current_goggle_cup",      as: "swimmer_current_goggle_cup"
      get  "swimmer/trainings/:id",             to: "swimmers#trainings",               as: "swimmer_trainings"

      # === Teams ===
      get  "teams/index",                       to: "teams#index",                      as: "teams"
      get  "teams/radio/:id",                   to: "teams#radio",                      as: "team_radio"
      get  "teams/current_swimmers/:id",        to: "teams#current_swimmers",           as: "team_current_swimmers"
      get  "teams/best_timings/:id",            to: "teams#best_timings",               as: "team_best_timings"
      get  "teams/count_meetings/:id",          to: "teams#count_meetings",             as: "team_count_meetings"
      get  "teams/count_results/:id",           to: "teams#count_results",              as: "team_count_results"
      get  "teams/count_details/:id",           to: "teams#count_details",              as: "team_count_results"
      get  "teams/palmares/:id",                to: "teams#palmares",                   as: "team_palmares"
      get  "teams/goggle_cup/:id",              to: "teams#goggle_cup",                 as: "team_goggle_cup"
      get  "teams/goggle_cup_all_of_fame/:id",  to: "teams#goggle_cup_all_of_fame",     as: "team_goggle_cup_all_of_fame"

      # === Swimming Pools ===
      get "swimming_pools/index",               as: "swimming_pools"
      get "swimming_pool/:id",                  to: "swimming_pools#show",              as: "swimming_pool"

      # === Championships ===
      get  "championships/calendar_regional_er_csi(/:id)",  to: "championships#calendar_regional_er_csi",  as: "championships_calendar_regional_er_csi"
      get  "championships/ranking_regional_er_csi(/:id)",   to: "championships#ranking_regional_er_csi",   as: "championships_ranking_regional_er_csi"
      get  "championships/event_ranking_regional_er_csi(/:id)", to: "championships#event_ranking_regional_er_csi", as: "championships_event_ranking_regional_er_csi"
      get  "championships/individual_rank_regional_er_csi(/:id)", to: "championships#individual_rank_regional_er_csi", as: "championships_individual_rank_regional_er_csi"
      get  "championships/rules_regional_er_csi(/:id)",     to: "championships#rules_regional_er_csi",     as: "championships_rules_regional_er_csi"
      get  "championships/history_regional_er_csi(/:id)",   to: "championships#history_regional_er_csi",   as: "championships_history_regional_er_csi"
      get  "championships/calendar_regional_er_uisp(/:id)", to: "championships#calendar_regional_er_uisp", as: "championships_calendar_regional_er_uisp"
      get  "championships/ranking_regional_er_uisp(/:id)",  to: "championships#ranking_regional_er_uisp",  as: "championships_ranking_regional_er_uisp"
      get  "championships/rules_regional_er_uisp(/:id)",    to: "championships#rules_regional_er_uisp",    as: "championships_rules_regional_er_uisp"
      get  "championships/history_regional_er_uisp(/:id)",  to: "championships#history_regional_er_uisp",  as: "championships_history_regional_er_uisp"
      get  "championships/calendar_supermaster_fin(/:id)",  to: "championships#calendar_supermaster_fin",  as: "championships_calendar_supermaster_fin"
      get  "championships/ranking_supermaster_fin(/:id)",   to: "championships#ranking_supermaster_fin",   as: "championships_ranking_supermaster_fin"
      get  "championships/rules_supermaster_fin(/:id)",     to: "championships#rules_supermaster_fin",     as: "championships_rules_supermaster_fin"
      get  "championships/history_supermaster_fin(/:id)",   to: "championships#history_supermaster_fin",   as: "championships_history_supermaster_fin"

      # === Misc ===
      match "misc/fin_score_calculation",       to: "misc#fin_score_calculation",               as: "misc_fin_score_calculation", via: [:get, :post]

      # === Swimming Pool Reviews ===
      resources :swimming_pool_reviews do
        member do
          delete 'destroy',                     to: "swimming_pool_reviews#destroy",            as: "destroy"
          post 'report_abuse',                  to: "swimming_pool_reviews#report_abuse",       as: "report_abuse"
          post 'vote',                          to: "swimming_pool_reviews#vote",               as: "vote"
        end
        collection do
          get 'for_swimming_pool/:id',          to: "swimming_pool_reviews#for_swimming_pool",  as: "for_pool"
          get 'for_user/:id',                   to: "swimming_pool_reviews#for_user",           as: "for_user"
        end
      end

      # === Exercises ===
      get  "exercises/json_list",               to: "exercises#json_list",              as: "exercises_json_list"
      get  "exercise/json_list/:id",            to: "exercises#json_list",              as: "exercise_json_list"

      # === Trainings ===
      resources :trainings
      get  "training/printout/:id",             to: "trainings#printout",               as: "training_printout"
      post "training/duplicate/:id",            to: "trainings#duplicate",              as: "training_duplicate"
      post "training/create_user_training/:id", to: "trainings#create_user_training",   as: "training_create_user_training"

      # === User Trainings ===
      resources :user_trainings
      get  "user_trainings/json_list",          to: "user_trainings#json_list"
      get  "user_training/json_list/:id",       to: "user_trainings#json_list",           as: "user_training_json_list"
      get  "user_training/printout/:id",        to: "user_trainings#printout",            as: "user_training_printout"
      post "user_training/duplicate/:id",       to: "user_trainings#duplicate",           as: "user_training_duplicate"
      post "user_training/create_user_story/:id", to: "user_trainings#create_user_story", as: "user_training_create_user_story"

      # === User Training Stories: ===
      resources :user_training_stories

      # === User Passages: ===
      get     "passages/show/:id",              to: "passages#show",                      as: "passage"
      get     "passages/new",                   to: "passages#new",                       as: "new_passage"
      post    "passages/create",                to: "passages#create",                    as: "create_passage"
      get     "passages/edit/:id",              to: "passages#edit",                      as: "edit_passage"
      put     "passages/update/:id",            to: "passages#update",                    as: "update_passage"
      delete  "passages/destroy/:id",           to: "passages#destroy",                   as: "destroy_passage"
      get     'passages/for_meeting_individual_result/:id', to: "passages#for_meeting_individual_result", as: "passages_for_meeting_individual_result"
    end
  end


  # === OLD (v1 & v2) Admin Interface / Data Import: ===
  scope "goggles_data_import" do
    scope "(:locale)", locale: /en|it/ do
      match "step1_status",                     controller: 'admin_import', action: 'step1_status',                     as: :goggles_di_step1_status
      match "step1_1_team_analysis",            controller: 'admin_import', action: 'step1_1_team_analysis',            as: :goggles_di_step1_1_team_analysis
      match "step1_1_team_analysis_commit",     controller: 'admin_import', action: 'step1_1_team_analysis_commit',     as: :goggles_di_step1_1_team_analysis_commit, method: :post
      match "step1_1_swimmer_analysis",         controller: 'admin_import', action: 'step1_1_swimmer_analysis',         as: :goggles_di_step1_1_swimmer_analysis
      match "step1_1_swimmer_analysis_commit",  controller: 'admin_import', action: 'step1_1_swimmer_analysis_commit',  as: :goggles_di_step1_1_swimmer_analysis_commit, method: :post
      match "step2_checkout",                   controller: 'admin_import', action: 'step2_checkout',                   as: :goggles_di_step2_checkout
      match "step3_commit",                     controller: 'admin_import', action: 'step3_commit',                     as: :goggles_di_step3_commit
      match "kill_import_session",              controller: 'admin_import', action: 'kill_import_session',              as: :goggles_di_kill_import_session, method: :post
    end
  end

  # === OLD (v1) Admin Interface / commands: ===
  scope "goggles_admin" do
    scope "(:locale)", locale: /en|it/ do
      match "/",                      controller: 'admin_index', action: 'index',             as: :goggles_admin_index
      match "index",                  controller: 'admin_index', action: 'index',             as: :goggles_admin_index

      match "db_structure",           controller: 'admin_index', action: 'db_structure'
      match "db_reset",               controller: 'admin_index', action: 'db_reset',          via: :post
      match "run_db_migrations",      controller: 'admin_index', action: 'run_db_migrations', via: :post
      match "run_sql_exec",           controller: 'admin_index', action: 'run_sql_exec',      via: :post

      match "select_meeting",         controller: 'admin_index', action: 'select_meeting'
      match "delete_meeting",         controller: 'admin_index', action: 'delete_meeting',    via: :post
      match "select_teams",           controller: 'admin_index', action: 'select_teams'

      match "run_rake",               controller: 'admin_index', action: 'run_rake',          via: [:get, :post]
      match "run_bundle",             controller: 'admin_index', action: 'run_bundle',        via: [:get, :post]
      match "run_sudo_command",       controller: 'admin_index', action: 'run_sudo_command',  via: [:get, :post]
      match "restart_apache",         controller: 'admin_index', action: 'restart_apache',    via: [:get, :post]

      match "run_src_upgrade",        controller: 'admin_index', action: 'run_src_upgrade',   via: [:get, :post]

      match "upload_db_dump",         controller: 'admin_index', action: 'upload_db_dump',    via: [:get, :post]
      match "upload_db_seed",         controller: 'admin_index', action: 'upload_db_seed',    via: [:get, :post]

      match "download_db_dump",       controller: 'admin_index', action: 'download_db_dump'
      match "download_team_dump",     controller: 'admin_index', action: 'download_team_dump'
      match "download_swimmer_dump",  controller: 'admin_index', action: 'download_swimmer_dump'
      match "download_user_dump",     controller: 'admin_index', action: 'download_user_dump'
      match "cleanup_output_dir",     controller: 'admin_index', action: 'cleanup_output_dir'
    end
  end


  # === Admin Interface V2 / Data Import V3: ===
  namespace :admin, defaults: { format: "json" } do
    namespace :v3 do
      scope "(:locale)", locale: /en|it/ do
        get     "home/index",                                 to: "home#index"

        # Data-import status display:
        get     "data_import/index",                          to: "data_import#index"
        # Phase 1.00, with meta-data serialization:
        post    "data_import/parse_file",                     to: "data_import#parse_file"

        # Phase 1.10, Team analysis:
        get     "data_import/team_analysis/:session_id",      to: "data_import#team_analysis/:session_id",    as: "data_import_team_analysis"
        post    "data_import/team_confirm/:session_id",       to: "data_import#team_confirm/:session_id",     as: "data_import_team_confirm"

        # Phase 1.20, Swimmer analysis:
        get     "data_import/swimmer_analysis/:session_id",   to: "data_import#swimmer_analysis/:session_id", as: "data_import_swimmer_analysis"
        post    "data_import/swimmer_confirm/:session_id",    to: "data_import#swimmer_confirm/:session_id",  as: "data_import_swimmer_confirm"

        # Phase 2.00, serialized data edit & review:
        get     "data_import/edit/:session_id",               to: "data_import#edit/:session_id",             as: "data_import_edit"
        post    "data_import/commit/:session_id",             to: "data_import#commit/:session_id",           as: "data_import_commit"

        # Phase 3.00, post-commit clean-up:
        delete  "data_import/destroy/:session_id",            to: "data_import#destroy/:session_id",          as: "data_import_destroy"
      end
    end
  end


  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  # This route can be invoked with purchase_url(id: product.id)

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
#  match "*path", to: "application#routing_error", via: [:get, :post, :put, :delete, :patch]
end
