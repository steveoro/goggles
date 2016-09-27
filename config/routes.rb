Goggles::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  mount GogglesCore::Engine => "/"

  # [Steve, 20130716] Root's route required by Devise:
  root :to => "home#index", locale: /en|it/

  scope "/" do
    scope "(:locale)", locale: /en|it/ do
      # === Home ===
      get "home/wip",                           to: "home#wip"
      get "home/about",                         to: "home#about"
      get "home/contact_us",                    to: "home#contact_us"
      get "home/maintenance",                   to: "home#maintenance"
      get "home/tutorials",                     to: "home#tutorials"

      # === Socials ===
      # A user associates himself/herself with a swimmer:
      match "socials/associate",                to: "socials#associate",  via: [:get, :post]
      post "socials/dissociate",                to: "socials#dissociate"

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
      get "meeting/edit_passages/:id",          to: "meetings#edit_passages",           as: "meeting_edit_passages"
      post "meeting/update_passages/:id",       to: "meetings#update_passages",         as: "meeting_update_passages"

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
      get  "swimmer/sumpermaster/:id",          to: "swimmers#supermaster",             as: "swimmer_supermaster"
      get  "swimmer/trainings/:id",             to: "swimmers#trainings",               as: "swimmer_trainings"
      get  "swimmer/closed_goggle_cup/:id",     to: "swimmers#closed_goggle_cup",       as: "swimmer_closed_goggle_cup"

      # === Teams ===
      get  "teams/index",                       to: "teams#index",                      as: "teams"
      get  "teams/radio/:id",                   to: "teams#radio",                      as: "team_radio"
      get  "teams/current_swimmers/:id",        to: "teams#current_swimmers",           as: "team_current_swimmers"
      get  "teams/best_timings/:id",            to: "teams#best_timings",               as: "team_best_timings"
      get  "teams/count_meetings/:id",          to: "teams#count_meetings",             as: "team_count_meetings"
      get  "teams/count_results/:id",           to: "teams#count_results",              as: "team_count_results"
      get  "teams/count_details/:id",           to: "teams#count_details",              as: "team_count_details"
      get  "teams/palmares/:id",                to: "teams#palmares",                   as: "team_palmares"
      get  "teams/goggle_cup/:id",              to: "teams#goggle_cup",                 as: "team_goggle_cup"
      get  "teams/goggle_cup_all_of_fame/:id",  to: "teams#goggle_cup_all_of_fame",     as: "team_goggle_cup_all_of_fame"
      get  "teams/closed_goggle_cup/:id",       to: "teams#closed_goggle_cup",          as: "team_closed_goggle_cup"

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
      get  "misc/fin_score_calculation",        to: "misc#fin_score_calculation",     as: "misc_fin_score_calculation"
      post "misc/compute_fin_score",            to: "misc#compute_fin_score",         as: "misc_compute_fin_score"
      get  "misc/fin_timing_calculation",       to: "misc#fin_timing_calculation",    as: "misc_fin_timing_calculation"
      post "misc/compute_fin_timing",           to: "misc#compute_fin_timing",        as: "misc_compute_fin_timing"
      get  "misc/swimmer_matches",              to: "misc#swimmer_matches",           as: "misc_swimmer_matches"
      post "misc/show_swimmer_matches",         to: "misc#show_swimmer_matches",      as: "misc_show_swimmer_matches"

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
    end
  end


  namespace :api, defaults: { format: "json" } do
    namespace :v2 do
      devise_scope :user do
        post "sessions/create"
        post "sessions/destroy"
      end
    end

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

      # === Search ===
      get    "search/simple",                 to: "search#simple",          as: "search_simple"

      # === Meetings ===
      get    "meetings/index",                to: "meetings#index",         as: "meetings"
      get    "meetings/show/:id",             to: "meetings#show",          as: "meeting_show"
      # TODO meeting details w/ subentities in dedicated controllers? => No: use decorators to return custom-tailored meeting rows for API usage

      # === News Feeds ===
      get    "news_feed/for_user/:id",        to: "news_feeds#for_user",    as: "news_feed_for_user"
      put    "news_feed/read/:id",            to: "news_feeds#read",        as: "news_feed_read"
      delete "news_feed/destroy/:id",         to: "news_feeds#destroy",     as: "news_feed_destroy"

      # === Records ===
      get    "records/for_federation/:id",    to: "records#for_federation", as: "records_for_federation"
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

# FIXME NOT REALLY USED:
      # TODO extract and enlist only the actual routes used:
      resources :user_trainings, except: [:new]
      resources :user_training_stories, except: [:new]
      resources :passages, except: [:new]
#      match "passages/create", to: "passages#create", via: :post
    end
  end

  # FIXME Wildcard route NOT working anymore w/ Rails 5:
  # Wildcard route to match all the remaining possibilities:
#  match "*path", to: "exceptions#render_error"

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  # This route can be invoked with purchase_url(id: product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  # ----------------------------------------------------------------------------

  # Any other routes are handled here (since in Rails 3 ActionDispatch prevents
  # RoutingError from hitting ApplicationController::rescue_action).
  # In other words, this wildcard route will catch all the other cases:
#  match "*path", to: "application#routing_error", via: [:get, :post, :put, :delete, :patch]
end
