Rails.application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.
  mount GogglesCore::Engine => "home/index"

  # [Steve, 20130716] Root's route required by Devise:
  root to: "home#index", locale: /it|en/

  get "/(:locale)", locale: /it|en/, to: "home#index"

  scope "/" do
    scope "(:locale)", locale: /it|en/ do
      # === Home ===
      match "wip",                              to: "home#wip",           via: :get,    as: "home_wip"
      match "about",                            to: "home#about",         via: :get,    as: "home_about"
      match "contact_us",                       to: "home#contact_us",    via: :get,    as: "home_contact_us"
      match "maintenance",                      to: "home#maintenance",   via: :get,    as: "home_maintenance"

      # === Tutorials ===
      get 'tutorials/index'
      get 'tutorials/features'
      get 'tutorials/registration'
      get 'tutorials/radio_swimmer'
      get 'tutorials/radio_team'
      get 'tutorials/meetings'
      get 'tutorials/passages'
      get 'tutorials/reservations'
      get 'tutorials/goggle_cups'
      get 'tutorials/scoring'
      get 'tutorials/pools'
      get 'tutorials/trainings'

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
      get "meetings/my",                        to: "meetings#my"
      get "meetings/current",                   to: "meetings#current"
#      get "meetings/custom_search",             to: "meetings#custom_search"
#      get "meetings/simple_search",             to: "meetings#simple_search"

#      get "meetings/search_swimmer",            to: "meetings#search_swimmer"
#      get "meetings/search_team",               to: "meetings#search_team"
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
      get "meeting/show_autoscroll_start_list/:id", to: "meetings#show_autoscroll_start_list",  as: "meeting_show_autoscroll_start_list"
      get "meeting/show_goggle_cup_results/:id", to: "meetings#show_goggle_cup_results", as: "meeting_show_goggle_cup_results"

      # === Meeting Reservations ===
      get 'meeting_reservations/edit_events'
      get 'meeting_reservations/edit_relays'
      get 'meeting_reservations/show'
      get 'meeting_reservations/printout_event_sheet'
      get 'meeting_reservations/export_csi_csv'
      get 'meeting_reservations/export_fin_csv_matrix'
      get 'meeting_reservations/relayometer'
      post 'meeting_reservations/relayometer'

      # === Meeting Results ===
      get "meeting_results/edit_passages/:id",          to: "meeting_results#edit_passages",           as: "meeting_results_edit_passages"
      get "meeting_results/edit_relay_swimmers/:id",    to: "meeting_results#edit_relay_swimmers",     as: "meeting_results_edit_relay_swimmers"

      # === Search ===
      get 'search/smart'
      get 'search/smart_with_captcha'
      get 'search/meetings'

      # === Team Management ===
      get 'team_management/show_pending_reservations/:id',  to: "team_management#show_pending_reservations",   as: "team_management_show_pending_reservations"
      post 'team_management/show_pending_reservations/:id', to: "team_management#update_pending_reservations", as: "team_management_update_pending_reservations"
      get 'team_management/edit_team/:id',                  to: "team_management#edit_team",                   as: "team_management_edit_team"
      put 'team_management/update_team/:id',                to: "team_management#update_team",                 as: "team_management_update_team"
      get 'team_management/edit_affiliation'
      post 'team_management/update_affiliation'
      get 'team_management/edit_lap_template'
      post 'team_management/update_app_template'
      get 'team_management/supermaster/:id',                to: "team_management#supermaster",                 as: "team_management_supermaster"
      get 'team_management/show_presence/:id',              to: "team_management#show_presence",               as: "team_management_show_presence"

      # === Badge (Team Manager only) ===
      get 'badge/edit_form',        to: "badge#edit_form",  as: "badge_edit_form"
      post 'badge/create/:team_id', to: "badge#create",     as: "badge_create"
      put 'badge/update/:badge_id', to: "badge#update",     as: "badge_update"

      # === Records ===
      get "records/for_season_type", to: "records#for_season_type"
      get "records/for_team",        to: "records#for_team"
      get "records/for_swimmer",     to: "records#for_swimmer"

      # === Swimmers ===
#      get  "swimmers/index",                    as: "swimmers"
      get  "swimmer/radio/:id",                 to: "swimmers#radio",                   as: "swimmer_radio"
      get  "swimmer/medals/:id",                to: "swimmers#medals",                  as: "swimmer_medals"
# FIXME this has not been used yet: (view removed or missing) -- check it out and then remove it, if everything is ok
#      get  "swimmer/records/:id",               to: "swimmers#records",                 as: "swimmer_records"
      get  "swimmer/best_timings/:id",          to: "swimmers#best_timings",            as: "swimmer_best_timings"

      get  "swimmer/full_history_1/:id",        to: "swimmers#full_history_1",          as: "swimmer_full_history_1"
      get  "swimmer/full_history_2/:id",        to: "swimmers#full_history_2",          as: "swimmer_full_history_2"
      get  "swimmer/current_goggle_cup/:id",    to: "swimmers#current_goggle_cup",      as: "swimmer_current_goggle_cup"
      get  "swimmer/supermaster/:id",           to: "swimmers#supermaster",             as: "swimmer_supermaster"
      get  "swimmer/regionalercsi/:id",         to: "swimmers#regionalercsi",           as: "swimmer_regionalercsi"
      get  "swimmer/trainings/:id",             to: "swimmers#trainings",               as: "swimmer_trainings"
      get  "swimmer/closed_goggle_cup/:id",     to: "swimmers#closed_goggle_cup",       as: "swimmer_closed_goggle_cup"
      get  "swimmer/presence/:id",              to: "swimmers#presence",                as: "swimmer_presence"

      # === Taggings (Meeting or Swimmer) ===
      post 'taggings/meeting_for_user/:id',     to: "taggings#meeting_for_user",        as: "taggings_meeting_for_user"
      post 'taggings/meeting_for_team/:id',     to: "taggings#meeting_for_team",        as: "taggings_meeting_for_team"
      post 'taggings/swimmer_for_user/:id',     to: "taggings#swimmer_for_user",        as: "taggings_swimmer_for_user"
      get  'taggings/starred_meetings',         to: "taggings#starred_meetings",        as: "taggings_starred_meetings"

      # === Teams ===
#      get  "teams/index",                       to: "teams#index",                      as: "teams"
      get  "teams/radio/:id",                   to: "teams#radio",                      as: "team_radio"
      get  "teams/current_swimmers/:id",        to: "teams#current_swimmers",           as: "team_current_swimmers"
      get  "teams/best_timings/:id",            to: "teams#best_timings",               as: "team_best_timings"
      get  "teams/printout_best_timings/:id",   to: "teams#printout_best_timings",      as: "team_printout_best_timings"
      get  "teams/count_meetings/:id",          to: "teams#count_meetings",             as: "team_count_meetings"
      get  "teams/count_results/:id",           to: "teams#count_results",              as: "team_count_results"
      get  "teams/count_details/:id",           to: "teams#count_details",              as: "team_count_details"
      get  "teams/palmares/:id",                to: "teams#palmares",                   as: "team_palmares"
      get  "teams/goggle_cup/:id",              to: "teams#goggle_cup",                 as: "team_goggle_cup"
      get  "teams/goggle_cup_all_of_fame/:id",  to: "teams#goggle_cup_all_of_fame",     as: "team_goggle_cup_all_of_fame"
      get  "teams/closed_goggle_cup/:id",       to: "teams#closed_goggle_cup",          as: "team_closed_goggle_cup"
      get  "teams/printout_goggle_cup/:id",     to: "teams#printout_goggle_cup",        as: "team_printout_goggle_cup"

      # === Swimming Pools ===
#      get "swimming_pools/index",               as: "swimming_pools"
      get "swimming_pool/:id",                  to: "swimming_pools#show",              as: "swimming_pool"

      # === Championships ===
      get  "championships/calendar_regional_er_csi(/:id)",  to: "championships#calendar_regional_er_csi",  as: "championships_calendar_regional_er_csi"
      get  "championships/ranking_regional_er_csi(/:id)",   to: "championships#ranking_regional_er_csi",   as: "championships_ranking_regional_er_csi"
      get  "championships/printout_ranking_regional_csi(/:id)",   to: "championships#printout_ranking_regional_csi",   as: "championships_printout_ranking_regional_csi"

      get  "championships/event_ranking_regional_er_csi(/:id)", to: "championships#event_ranking_regional_er_csi", as: "championships_event_ranking_regional_er_csi"
      get  "championships/individual_rank_regional_er_csi(/:id)", to: "championships#individual_rank_regional_er_csi", as: "championships_individual_rank_regional_er_csi"
      get  "championships/printout_indi_ranking_csi(/:id)", to: "championships#printout_indi_ranking_csi", as: "championships_printout_indi_ranking_csi"

      get  "championships/rules_regional_er_csi(/:id)",     to: "championships#rules_regional_er_csi",     as: "championships_rules_regional_er_csi"
      get  "championships/history_regional_er_csi(/:id)",   to: "championships#history_regional_er_csi",   as: "championships_history_regional_er_csi"
      get  "championships/records_regional_er_csi(/:id)",   to: "championships#records_regional_er_csi",   as: "championships_records_regional_er_csi"
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
      get  "misc/training_paces_2000",          to: "misc#training_paces_2000",       as: "misc_training_paces_2000"
      post "misc/show_training_paces_2000",     to: "misc#show_training_paces_2000",  as: "misc_show_training_paces_2000"

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
#      resources :trainings
#      get  "training/printout/:id",             to: "trainings#printout",               as: "training_printout"
#      post "training/duplicate/:id",            to: "trainings#duplicate",              as: "training_duplicate"
#      post "training/create_user_training/:id", to: "trainings#create_user_training",   as: "training_create_user_training"

      # === User Trainings ===
#      resources :user_trainings
#      get  "user_trainings/json_list",          to: "user_trainings#json_list"
#      get  "user_training/json_list/:id",       to: "user_trainings#json_list",           as: "user_training_json_list"
#      get  "user_training/printout/:id",        to: "user_trainings#printout",            as: "user_training_printout"
#      post "user_training/duplicate/:id",       to: "user_trainings#duplicate",           as: "user_training_duplicate"
#      post "user_training/create_user_story/:id", to: "user_trainings#create_user_story", as: "user_training_create_user_story"

      # === User Training Stories: ===
#      resources :user_training_stories
    end
  end


  namespace :api, defaults: { format: "json" } do
    namespace :v2 do
      devise_scope :user do
        post "sessions/create"
        post "sessions/destroy"
      end

      # === Data-Import Microtransactions ===
      post 'data_import/start'
      post 'data_import/edit'
      post 'data_import/commit'

      # === Remote Edit ===
      post 'remote_edit/update_relay_swimmer'
      post 'remote_edit/update_passage'
      post 'remote_edit/update_reservation'
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
      put    "meetings/tag_for_user/:id",     to: "meetings#tag_for_user",  as: "meeting_tag_for_user"
      put    "meetings/tag_for_team/:id",     to: "meetings#tag_for_team",  as: "meeting_tag_for_team"
      # The following is used for info/manifest remote download & enbedding into the page:
      get    "meetings/download",             to: "meetings#download",      as: "meeting_download"

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
      get    "swimmers/unbadged",             to: "swimmers#unbadged",      as: "swimmers_unbadged", format: :json
      get    "swimmers/show/:id",             to: "swimmers#show",          as: "swimmer_show"
      put    "swimmers/tag_for_user/:id",     to: "swimmers#tag_for_user",  as: "swimmer_tag_for_user"

      # === SwimmingPools ===
      get    "swimming_pools/index",          to: "swimming_pools#index",   as: "swimming_pools"
      get    "swimming_pools/show/:id",       to: "swimming_pools#show",    as: "swimming_pool_show"

      # === Teams ===
      get    "team/count_meetings/:id",       to: "teams#count_meetings",   as: "team_count_meetings"
      get    "team/count_results/:id",        to: "teams#count_results",    as: "team_count_results"
      get    "team/count_details/:id",        to: "teams#count_details",    as: "team_count_details"
      get    "team/current_swimmers/:id",     to: "teams#current_swimmers", as: "team_current_swimmers"
      get    "team/get_affiliation/:id",      to: "teams#get_affiliation",  as: "team_get_affiliation", format: :json
      get    "teams/index",                   to: "teams#index",            as: "teams"
      get    "teams/show/:id",                to: "teams#show",             as: "team_show"

      # === Trainings ===
      get    "trainings/index",               to: "trainings#index",        as: "trainings"
      get    "trainings/show/:id",            to: "trainings#show",         as: "trainings_show"

# FIXME NOT REALLY USED:
      # TODO extract and enlist only the actual routes used:
#      resources :user_trainings, except: [:new]
#      resources :user_training_stories, except: [:new]
      resources :passages, except: [:new]
#      match "passages/create", to: "passages#create", via: :post
    end
  end

  # FIXME Wildcard route NOT working anymore w/ Rails 5:
  # Wildcard route to match all the remaining possibilities:
#  match "*path", to: "exceptions#render_error"

  # TODO TEST THESE 2 and customize the error pages:
#  match "/404",  to: "exceptions#error_page", via: :all
#  match "/500",  to: "exceptions#error_page", via: :all
#  match "*path", to: "exceptions#error_page", via: :all

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
#  unless Rails.application.config.consider_all_requests_local
#    match "*path", to: "exceptions#error_page" #, via: :all #[:get, :post, :put, :delete, :patch]
#  end
end
