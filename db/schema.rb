# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131008175822) do

  create_table "accreditation_time_types", :force => true do |t|
    t.integer  "lock_version",              :default => 0
    t.string   "code",         :limit => 1,                :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "accreditation_time_types", ["code"], :name => "index_accreditation_time_types_on_code", :unique => true

  create_table "admins", :force => true do |t|
    t.string   "email",                            :default => "", :null => false
    t.string   "encrypted_password",               :default => "", :null => false
    t.integer  "sign_in_count",                    :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                  :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "lock_version",                     :default => 0
    t.string   "name",                                             :null => false
    t.string   "description",        :limit => 50
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["name"], :name => "index_admins_on_name", :unique => true
  add_index "admins", ["unlock_token"], :name => "index_admins_on_unlock_token", :unique => true

  create_table "app_parameters", :force => true do |t|
    t.integer  "lock_version",                                                  :default => 0
    t.integer  "code"
    t.string   "controller_name"
    t.string   "action_name"
    t.boolean  "is_a_post",                                                     :default => false, :null => false
    t.string   "confirmation_text"
    t.string   "a_string"
    t.boolean  "a_bool"
    t.integer  "a_integer"
    t.datetime "a_date"
    t.decimal  "a_decimal",                      :precision => 10, :scale => 2
    t.decimal  "a_decimal_2",                    :precision => 10, :scale => 2
    t.decimal  "a_decimal_3",                    :precision => 10, :scale => 2
    t.decimal  "a_decimal_4",                    :precision => 10, :scale => 2
    t.integer  "range_x",           :limit => 8
    t.integer  "range_y",           :limit => 8
    t.string   "a_name"
    t.string   "a_filename"
    t.string   "tooltip_text"
    t.integer  "view_height",                                                   :default => 0,     :null => false
    t.integer  "code_type_1",       :limit => 8
    t.integer  "code_type_2",       :limit => 8
    t.integer  "code_type_3",       :limit => 8
    t.integer  "code_type_4",       :limit => 8
    t.text     "free_text_1"
    t.text     "free_text_2"
    t.text     "free_text_3"
    t.text     "free_text_4"
    t.boolean  "free_bool_1"
    t.boolean  "free_bool_2"
    t.boolean  "free_bool_3"
    t.boolean  "free_bool_4"
    t.text     "description"
    t.datetime "created_at",                                                                       :null => false
    t.datetime "updated_at",                                                                       :null => false
  end

  add_index "app_parameters", ["code"], :name => "index_app_parameters_on_code", :unique => true

  create_table "articles", :force => true do |t|
    t.integer  "lock_version",               :default => 0
    t.string   "title",        :limit => 80,                    :null => false
    t.text     "entry_text",                                    :null => false
    t.boolean  "is_sticky",                  :default => false, :null => false
    t.integer  "user_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "articles", ["title"], :name => "index_articles_on_title"

  create_table "badges", :force => true do |t|
    t.integer  "lock_version",                             :default => 0
    t.string   "number",                     :limit => 40,                :null => false
    t.integer  "season_id"
    t.integer  "swimmer_id"
    t.integer  "team_id"
    t.integer  "category_type_id"
    t.integer  "accreditation_time_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  add_index "badges", ["accreditation_time_type_id"], :name => "fk_badges_accreditation_time_types"
  add_index "badges", ["category_type_id"], :name => "fk_badges_category_types"
  add_index "badges", ["number"], :name => "index_badges_on_number"
  add_index "badges", ["season_id"], :name => "fk_badges_seasons"
  add_index "badges", ["swimmer_id"], :name => "fk_badges_swimmers"
  add_index "badges", ["team_id"], :name => "fk_badges_teams"

  create_table "category_types", :force => true do |t|
    t.integer  "lock_version",                   :default => 0
    t.string   "code",            :limit => 6,                      :null => false
    t.string   "federation_code", :limit => 2,                      :null => false
    t.string   "description",     :limit => 100
    t.string   "short_name",      :limit => 50
    t.string   "group_name",      :limit => 50
    t.integer  "age_begin",       :limit => 3
    t.integer  "age_end",         :limit => 3
    t.boolean  "is_a_relay",                     :default => false, :null => false
    t.integer  "season_type_id"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "category_types", ["federation_code", "is_a_relay"], :name => "federation_code"
  add_index "category_types", ["season_type_id", "is_a_relay", "code"], :name => "season_type_and_code", :unique => true

  create_table "cities", :force => true do |t|
    t.integer  "lock_version",               :default => 0
    t.string   "name",         :limit => 50,                :null => false
    t.string   "zip",          :limit => 6
    t.string   "area",         :limit => 50,                :null => false
    t.string   "country",      :limit => 50,                :null => false
    t.string   "country_code", :limit => 10,                :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "user_id"
  end

  add_index "cities", ["name"], :name => "index_cities_on_name"
  add_index "cities", ["zip"], :name => "index_cities_on_zip"

  create_table "comments", :force => true do |t|
    t.integer  "lock_version",            :default => 0
    t.string   "entry_text",                             :null => false
    t.integer  "user_id"
    t.integer  "swimming_pool_review_id"
    t.integer  "comment_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "comments", ["comment_id"], :name => "fk_comments_comments"
  add_index "comments", ["swimming_pool_review_id"], :name => "fk_comments_swimming_pool_reviews"

  create_table "data_import_badges", :force => true do |t|
    t.integer  "lock_version",                             :default => 0
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_badge_id",       :limit => 8,  :default => 0
    t.string   "import_text",                                             :null => false
    t.string   "number",                     :limit => 40
    t.integer  "data_import_swimmer_id"
    t.integer  "data_import_team_id"
    t.integer  "data_import_season_id"
    t.integer  "swimmer_id"
    t.integer  "team_id"
    t.integer  "season_id"
    t.integer  "category_type_id"
    t.integer  "accreditation_time_type_id"
    t.integer  "user_id"
  end

  add_index "data_import_badges", ["number"], :name => "index_data_import_badges_on_number"

  create_table "data_import_cities", :force => true do |t|
    t.integer  "lock_version",                         :default => 0
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_city_id",    :limit => 8,  :default => 0
    t.string   "import_text",                                         :null => false
    t.string   "name",                   :limit => 50,                :null => false
    t.string   "zip",                    :limit => 6
    t.string   "area",                   :limit => 50
    t.string   "country",                :limit => 50
    t.string   "country_code",           :limit => 10
    t.integer  "user_id"
  end

  add_index "data_import_cities", ["name"], :name => "index_data_import_cities_on_name"
  add_index "data_import_cities", ["zip"], :name => "index_data_import_cities_on_zip"

  create_table "data_import_meeting_individual_results", :force => true do |t|
    t.integer  "lock_version",                                                                           :default => 0
    t.datetime "created_at",                                                                                                :null => false
    t.datetime "updated_at",                                                                                                :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_meeting_individual_result_id", :limit => 8,                                  :default => 0
    t.string   "import_text",                                                                                               :null => false
    t.string   "athlete_name",                             :limit => 100,                                                   :null => false
    t.string   "team_name",                                :limit => 60,                                                    :null => false
    t.string   "athlete_badge_number",                     :limit => 40
    t.string   "team_badge_number",                        :limit => 40
    t.integer  "year_of_birth",                                                                          :default => 1900,  :null => false
    t.integer  "rank",                                                                                   :default => 0,     :null => false
    t.boolean  "is_play_off",                                                                            :default => false, :null => false
    t.boolean  "is_out_of_race",                                                                         :default => false, :null => false
    t.boolean  "is_disqualified",                                                                        :default => false, :null => false
    t.decimal  "standard_points",                                         :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "meeting_points",                                          :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.integer  "minutes",                                  :limit => 3,                                  :default => 0,     :null => false
    t.integer  "seconds",                                  :limit => 2,                                  :default => 0,     :null => false
    t.integer  "hundreds",                                 :limit => 2,                                  :default => 0,     :null => false
    t.integer  "data_import_meeting_program_id"
    t.integer  "meeting_program_id"
    t.integer  "result_type_id"
    t.integer  "data_import_swimmer_id"
    t.integer  "data_import_team_id"
    t.integer  "data_import_badge_id"
    t.integer  "swimmer_id"
    t.integer  "team_id"
    t.integer  "badge_id"
    t.integer  "user_id"
    t.integer  "disqualification_code_type_id"
  end

  create_table "data_import_meeting_programs", :force => true do |t|
    t.integer  "lock_version",                                :default => 0
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_meeting_program_id", :limit => 8, :default => 0
    t.string   "import_text",                                                :null => false
    t.integer  "event_order",                    :limit => 3, :default => 0, :null => false
    t.time     "begin_time"
    t.integer  "data_import_meeting_session_id"
    t.integer  "meeting_session_id"
    t.integer  "event_type_id"
    t.integer  "category_type_id"
    t.integer  "gender_type_id"
    t.integer  "user_id"
    t.integer  "minutes",                        :limit => 3, :default => 0
    t.integer  "seconds",                        :limit => 2, :default => 0
    t.integer  "hundreds",                       :limit => 2, :default => 0
    t.integer  "accreditation_time_type_id"
  end

  add_index "data_import_meeting_programs", ["meeting_session_id", "category_type_id"], :name => "meeting_category_type"
  add_index "data_import_meeting_programs", ["meeting_session_id", "event_order"], :name => "meeting_order"
  add_index "data_import_meeting_programs", ["meeting_session_id", "event_type_id"], :name => "meeting_event_type"
  add_index "data_import_meeting_programs", ["meeting_session_id", "gender_type_id"], :name => "meeting_gender_type"

  create_table "data_import_meeting_relay_results", :force => true do |t|
    t.integer  "lock_version",                                                                    :default => 0
    t.datetime "created_at",                                                                                         :null => false
    t.datetime "updated_at",                                                                                         :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_meeting_relay_result_id", :limit => 8,                                :default => 0
    t.string   "import_text",                                                                                        :null => false
    t.integer  "rank",                                                                            :default => 0,     :null => false
    t.boolean  "is_play_off",                                                                     :default => false, :null => false
    t.boolean  "is_out_of_race",                                                                  :default => false, :null => false
    t.boolean  "is_disqualified",                                                                 :default => false, :null => false
    t.decimal  "standard_points",                                  :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "meeting_points",                                   :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.integer  "minutes",                             :limit => 3,                                :default => 0,     :null => false
    t.integer  "seconds",                             :limit => 2,                                :default => 0,     :null => false
    t.integer  "hundreds",                            :limit => 2,                                :default => 0,     :null => false
    t.integer  "data_import_team_id"
    t.integer  "team_id"
    t.integer  "result_type_id"
    t.integer  "user_id"
    t.integer  "data_import_meeting_program_id"
    t.integer  "meeting_program_id"
    t.integer  "disqualification_code_type_id"
  end

  create_table "data_import_meeting_sessions", :force => true do |t|
    t.integer  "lock_version",                                  :default => 0
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_meeting_session_id", :limit => 8,   :default => 0
    t.string   "import_text",                                                  :null => false
    t.integer  "session_order",                  :limit => 2,   :default => 0, :null => false
    t.date     "scheduled_date",                                               :null => false
    t.time     "warm_up_time"
    t.time     "begin_time"
    t.text     "notes"
    t.integer  "data_import_meeting_id"
    t.integer  "meeting_id"
    t.integer  "swimming_pool_id"
    t.integer  "user_id"
    t.string   "description",                    :limit => 100,                :null => false
  end

  add_index "data_import_meeting_sessions", ["scheduled_date"], :name => "index_data_import_meeting_sessions_on_scheduled_date"

  create_table "data_import_meeting_team_scores", :force => true do |t|
    t.integer  "lock_version",                                                               :default => 0
    t.datetime "created_at",                                                                                  :null => false
    t.datetime "updated_at",                                                                                  :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_challenge_score_id", :limit => 8,                                :default => 0
    t.string   "import_text",                                                                                 :null => false
    t.decimal  "total_individual_points",                     :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total_relay_points",                          :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer  "data_import_team_id"
    t.integer  "data_import_meeting_id"
    t.integer  "team_id"
    t.integer  "meeting_id"
    t.integer  "rank",                                                                       :default => 0,   :null => false
    t.integer  "user_id"
  end

  create_table "data_import_meetings", :force => true do |t|
    t.integer  "lock_version",                          :default => 0
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_meeting_id", :limit => 8,   :default => 0
    t.string   "import_text",                                              :null => false
    t.string   "description",            :limit => 100
    t.date     "entry_deadline"
    t.boolean  "has_warm_up_pool",                      :default => false
    t.boolean  "is_under_25_admitted",                  :default => false
    t.string   "reference_phone",        :limit => 40
    t.string   "reference_e_mail",       :limit => 50
    t.string   "reference_name",         :limit => 50
    t.text     "notes"
    t.string   "tag",                    :limit => 20
    t.boolean  "has_invitation",                        :default => false
    t.boolean  "has_start_list",                        :default => false
    t.boolean  "are_results_acquired",                  :default => false
    t.integer  "max_individual_events",  :limit => 1,   :default => 2
    t.string   "configuration_file",     :limit => 50
    t.integer  "challenge_number",       :limit => 3,   :default => 0
    t.integer  "data_import_season_id"
    t.integer  "season_id"
    t.integer  "user_id"
  end

  add_index "data_import_meetings", ["entry_deadline"], :name => "index_data_import_meetings_on_entry_deadline"

  create_table "data_import_seasons", :force => true do |t|
    t.integer  "lock_version",                           :default => 0
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_season_id",   :limit => 8,   :default => 0
    t.string   "import_text",                                               :null => false
    t.string   "description",             :limit => 100,                    :null => false
    t.date     "begin_date",                                                :null => false
    t.date     "end_date"
    t.boolean  "must_use_time_standards",                :default => false, :null => false
    t.integer  "max_points",                             :default => 0,     :null => false
    t.integer  "season_type_id"
  end

  add_index "data_import_seasons", ["begin_date"], :name => "index_data_import_seasons_on_begin_date"

  create_table "data_import_sessions", :force => true do |t|
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "file_name"
    t.text     "source_data"
    t.integer  "phase"
    t.integer  "total_data_rows"
    t.string   "file_format"
    t.text     "phase_1_log"
    t.text     "phase_2_log"
    t.text     "phase_3_log"
    t.integer  "data_import_season_id"
    t.integer  "season_id"
    t.integer  "user_id"
  end

  add_index "data_import_sessions", ["user_id"], :name => "user_id"

  create_table "data_import_swimmers", :force => true do |t|
    t.integer  "lock_version",                          :default => 0
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_swimmer_id", :limit => 8,   :default => 0
    t.string   "import_text",                                             :null => false
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "year_of_birth",                         :default => 1900, :null => false
    t.integer  "gender_type_id"
    t.integer  "user_id"
    t.string   "complete_name",          :limit => 100,                   :null => false
  end

  add_index "data_import_swimmers", ["complete_name"], :name => "index_data_import_swimmers_on_complete_name"
  add_index "data_import_swimmers", ["last_name", "first_name"], :name => "full_name"

  create_table "data_import_teams", :force => true do |t|
    t.integer  "lock_version",                         :default => 0
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.integer  "data_import_session_id"
    t.integer  "conflicting_team_id",    :limit => 8,  :default => 0
    t.string   "import_text",                                         :null => false
    t.string   "name",                   :limit => 60,                :null => false
    t.string   "badge_number",           :limit => 40
    t.integer  "data_import_city_id"
    t.integer  "city_id"
    t.integer  "user_id"
  end

  add_index "data_import_teams", ["city_id"], :name => "city_id"
  add_index "data_import_teams", ["data_import_city_id"], :name => "data_import_city_id"
  add_index "data_import_teams", ["name"], :name => "index_data_import_teams_on_name"

  create_table "disqualification_code_types", :force => true do |t|
    t.integer  "lock_version",                :default => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "code",           :limit => 4,                    :null => false
    t.boolean  "is_a_relay",                  :default => false, :null => false
    t.integer  "stroke_type_id"
  end

  add_index "disqualification_code_types", ["is_a_relay", "code"], :name => "code", :unique => true
  add_index "disqualification_code_types", ["is_a_relay"], :name => "index_disqualification_code_types_on_is_a_relay"

  create_table "event_types", :force => true do |t|
    t.integer  "lock_version",                   :default => 0
    t.string   "code",             :limit => 10,                    :null => false
    t.integer  "length_in_meters", :limit => 8
    t.boolean  "is_a_relay",                     :default => false, :null => false
    t.integer  "stroke_type_id"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "event_types", ["is_a_relay", "code"], :name => "code", :unique => true
  add_index "event_types", ["is_a_relay"], :name => "index_event_types_on_is_a_relay"
  add_index "event_types", ["stroke_type_id"], :name => "fk_event_types_stroke_types"

  create_table "events_by_pool_types", :force => true do |t|
    t.integer  "lock_version",  :default => 0
    t.integer  "pool_type_id"
    t.integer  "event_type_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "events_by_pool_types", ["event_type_id"], :name => "fk_events_by_pool_types_event_types"
  add_index "events_by_pool_types", ["pool_type_id"], :name => "fk_events_by_pool_types_pool_types"

  create_table "federation_types", :force => true do |t|
    t.integer  "lock_version",                :default => 0
    t.string   "code",         :limit => 4,                  :null => false
    t.string   "description",  :limit => 100
    t.string   "short_name",   :limit => 10
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "federation_types", ["code"], :name => "index_federation_types_on_code", :unique => true

  create_table "gender_types", :force => true do |t|
    t.integer  "lock_version",              :default => 0
    t.string   "code",         :limit => 1,                :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "gender_types", ["code"], :name => "index_gender_types_on_code", :unique => true

  create_table "hair_dryer_types", :force => true do |t|
    t.integer  "lock_version",              :default => 0
    t.string   "code",         :limit => 3,                :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "hair_dryer_types", ["code"], :name => "index_hair_dryer_types_on_code", :unique => true

  create_table "individual_accreditations", :force => true do |t|
    t.integer  "lock_version",                            :default => 0
    t.integer  "minutes",                    :limit => 3, :default => 0, :null => false
    t.integer  "seconds",                    :limit => 2, :default => 0, :null => false
    t.integer  "hundreds",                   :limit => 2, :default => 0, :null => false
    t.text     "notes"
    t.integer  "meeting_program_id"
    t.integer  "badge_id"
    t.integer  "accreditation_time_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  add_index "individual_accreditations", ["accreditation_time_type_id"], :name => "fk_individual_accreditations_accreditation_time_types"
  add_index "individual_accreditations", ["badge_id"], :name => "fk_individual_accreditations_badges"
  add_index "individual_accreditations", ["meeting_program_id", "badge_id"], :name => "accreditations_x_badges"

  create_table "locker_cabinet_types", :force => true do |t|
    t.integer  "lock_version",              :default => 0
    t.string   "code",         :limit => 3,                :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "locker_cabinet_types", ["code"], :name => "index_locker_cabinet_types_on_code", :unique => true

  create_table "meeting_individual_results", :force => true do |t|
    t.integer  "lock_version",                                                                :default => 0
    t.string   "athlete_name",                  :limit => 100,                                                   :null => false
    t.string   "team_name",                     :limit => 60,                                                    :null => false
    t.string   "athlete_badge_number",          :limit => 40
    t.string   "team_badge_number",             :limit => 40
    t.integer  "year_of_birth",                                                               :default => 1900,  :null => false
    t.integer  "rank",                                                                        :default => 0,     :null => false
    t.boolean  "is_play_off",                                                                 :default => false, :null => false
    t.boolean  "is_out_of_race",                                                              :default => false, :null => false
    t.boolean  "is_disqualified",                                                             :default => false, :null => false
    t.decimal  "standard_points",                              :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "meeting_points",                               :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.integer  "minutes",                       :limit => 3,                                  :default => 0,     :null => false
    t.integer  "seconds",                       :limit => 2,                                  :default => 0,     :null => false
    t.integer  "hundreds",                      :limit => 2,                                  :default => 0,     :null => false
    t.integer  "meeting_program_id"
    t.integer  "result_type_id"
    t.integer  "swimmer_id"
    t.integer  "team_id"
    t.integer  "badge_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                                                     :null => false
    t.datetime "updated_at",                                                                                     :null => false
    t.integer  "disqualification_code_type_id"
  end

  add_index "meeting_individual_results", ["badge_id"], :name => "fk_meeting_individual_results_badges"
  add_index "meeting_individual_results", ["meeting_program_id"], :name => "fk_meeting_individual_results_meeting_programs"
  add_index "meeting_individual_results", ["result_type_id"], :name => "fk_meeting_individual_results_result_types"
  add_index "meeting_individual_results", ["swimmer_id"], :name => "fk_meeting_individual_results_swimmers"
  add_index "meeting_individual_results", ["team_id"], :name => "fk_meeting_individual_results_teams"

  create_table "meeting_programs", :force => true do |t|
    t.integer  "lock_version",                            :default => 0
    t.integer  "event_order",                :limit => 3, :default => 0,     :null => false
    t.datetime "begin_time"
    t.integer  "meeting_session_id"
    t.integer  "event_type_id"
    t.integer  "category_type_id"
    t.integer  "gender_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.integer  "minutes",                    :limit => 3, :default => 0
    t.integer  "seconds",                    :limit => 2, :default => 0
    t.integer  "hundreds",                   :limit => 2, :default => 0
    t.integer  "accreditation_time_type_id"
    t.boolean  "is_autofilled",                           :default => false, :null => false
  end

  add_index "meeting_programs", ["accreditation_time_type_id"], :name => "fk_meeting_programs_accreditation_time_types"
  add_index "meeting_programs", ["category_type_id"], :name => "fk_meeting_programs_category_types"
  add_index "meeting_programs", ["event_type_id"], :name => "fk_meeting_programs_event_types"
  add_index "meeting_programs", ["gender_type_id"], :name => "fk_meeting_programs_gender_types"
  add_index "meeting_programs", ["meeting_session_id", "category_type_id"], :name => "meeting_category_type"
  add_index "meeting_programs", ["meeting_session_id", "event_order"], :name => "meeting_order"
  add_index "meeting_programs", ["meeting_session_id", "event_type_id"], :name => "meeting_event_type"
  add_index "meeting_programs", ["meeting_session_id", "gender_type_id"], :name => "meeting_gender_type"

  create_table "meeting_relay_results", :force => true do |t|
    t.integer  "lock_version",                                                              :default => 0
    t.datetime "created_at",                                                                                   :null => false
    t.datetime "updated_at",                                                                                   :null => false
    t.integer  "rank",                                                                      :default => 0,     :null => false
    t.boolean  "is_play_off",                                                               :default => false, :null => false
    t.boolean  "is_out_of_race",                                                            :default => false, :null => false
    t.boolean  "is_disqualified",                                                           :default => false, :null => false
    t.decimal  "standard_points",                            :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "meeting_points",                             :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.integer  "minutes",                       :limit => 3,                                :default => 0,     :null => false
    t.integer  "seconds",                       :limit => 2,                                :default => 0,     :null => false
    t.integer  "hundreds",                      :limit => 2,                                :default => 0,     :null => false
    t.integer  "team_id"
    t.integer  "result_type_id"
    t.integer  "user_id"
    t.integer  "meeting_program_id"
    t.integer  "disqualification_code_type_id"
  end

  add_index "meeting_relay_results", ["meeting_program_id", "rank"], :name => "results_x_relay"
  add_index "meeting_relay_results", ["result_type_id"], :name => "fk_meeting_relay_results_result_types"
  add_index "meeting_relay_results", ["team_id"], :name => "fk_meeting_relay_results_teams"

  create_table "meeting_relay_swimmers", :force => true do |t|
    t.integer  "lock_version",                    :default => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "relay_order",        :limit => 1, :default => 0, :null => false
    t.integer  "swimmer_id"
    t.integer  "badge_id"
    t.integer  "stroke_type_id"
    t.integer  "user_id"
    t.integer  "meeting_program_id"
  end

  add_index "meeting_relay_swimmers", ["badge_id"], :name => "fk_meeting_relay_swimmers_badges"
  add_index "meeting_relay_swimmers", ["meeting_program_id", "relay_order"], :name => "relay_order"
  add_index "meeting_relay_swimmers", ["stroke_type_id"], :name => "fk_meeting_relay_swimmers_stroke_types"
  add_index "meeting_relay_swimmers", ["swimmer_id"], :name => "fk_meeting_relay_swimmers_swimmers"

  create_table "meeting_sessions", :force => true do |t|
    t.integer  "lock_version",                    :default => 0
    t.integer  "session_order",    :limit => 2,   :default => 0,     :null => false
    t.date     "scheduled_date",                                     :null => false
    t.time     "warm_up_time"
    t.time     "begin_time"
    t.text     "notes"
    t.integer  "meeting_id"
    t.integer  "swimming_pool_id"
    t.integer  "user_id"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "description",      :limit => 100,                    :null => false
    t.boolean  "is_autofilled",                   :default => false, :null => false
  end

  add_index "meeting_sessions", ["meeting_id"], :name => "fk_meeting_sessions_meetings"
  add_index "meeting_sessions", ["scheduled_date"], :name => "index_meeting_sessions_on_scheduled_date"
  add_index "meeting_sessions", ["swimming_pool_id"], :name => "fk_meeting_sessions_swimming_pools"

  create_table "meeting_team_scores", :force => true do |t|
    t.integer  "lock_version",                                           :default => 0
    t.decimal  "total_individual_points", :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total_relay_points",      :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer  "team_id"
    t.integer  "meeting_id"
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
    t.integer  "rank",                                                   :default => 0,   :null => false
    t.integer  "user_id"
  end

  add_index "meeting_team_scores", ["meeting_id", "team_id"], :name => "teams_x_meeting"
  add_index "meeting_team_scores", ["team_id"], :name => "fk_meeting_team_scores_teams"

  create_table "meetings", :force => true do |t|
    t.integer  "lock_version",                         :default => 0
    t.string   "description",           :limit => 100,                    :null => false
    t.date     "entry_deadline"
    t.boolean  "has_warm_up_pool",                     :default => false
    t.boolean  "is_under_25_admitted",                 :default => false
    t.string   "reference_phone",       :limit => 40
    t.string   "reference_e_mail",      :limit => 50
    t.string   "reference_name",        :limit => 50
    t.text     "notes"
    t.boolean  "has_invitation",                       :default => false
    t.boolean  "has_start_list",                       :default => false
    t.boolean  "are_results_acquired",                 :default => false
    t.integer  "max_individual_events", :limit => 1,   :default => 2
    t.string   "configuration_file"
    t.integer  "challenge_number",      :limit => 3,   :default => 0
    t.integer  "season_id"
    t.integer  "user_id"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.boolean  "is_autofilled",                        :default => false, :null => false
  end

  add_index "meetings", ["entry_deadline"], :name => "index_meetings_on_entry_deadline"
  add_index "meetings", ["season_id"], :name => "fk_meetings_seasons"

  create_table "ober_cup_standards", :force => true do |t|
    t.integer  "lock_version",               :default => 0
    t.integer  "minutes",       :limit => 3, :default => 0, :null => false
    t.integer  "seconds",       :limit => 2, :default => 0, :null => false
    t.integer  "hundreds",      :limit => 2, :default => 0, :null => false
    t.integer  "ober_cup_id"
    t.integer  "badge_id"
    t.integer  "event_type_id"
    t.integer  "pool_type_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "ober_cup_standards", ["badge_id"], :name => "fk_ober_cup_standards_badges"
  add_index "ober_cup_standards", ["event_type_id"], :name => "fk_ober_cup_standards_event_types"
  add_index "ober_cup_standards", ["ober_cup_id"], :name => "fk_ober_cup_standards_ober_cups"
  add_index "ober_cup_standards", ["pool_type_id"], :name => "fk_ober_cup_standards_pool_types"

  create_table "ober_cups", :force => true do |t|
    t.integer  "lock_version",               :default => 0
    t.string   "description",  :limit => 60,                   :null => false
    t.integer  "year",                       :default => 2010, :null => false
    t.integer  "max_points",                 :default => 1000, :null => false
    t.integer  "team_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "ober_cups", ["team_id"], :name => "fk_ober_cups_teams"
  add_index "ober_cups", ["year"], :name => "index_ober_cups_on_year"

  create_table "passage_types", :force => true do |t|
    t.integer  "lock_version",                  :default => 0
    t.string   "code",             :limit => 6,                :null => false
    t.integer  "length_in_meters", :limit => 3
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "passage_types", ["code"], :name => "index_passage_types_on_code", :unique => true

  create_table "passages", :force => true do |t|
    t.integer  "lock_version",                    :default => 0
    t.integer  "minutes",            :limit => 3, :default => 0, :null => false
    t.integer  "seconds",            :limit => 2, :default => 0, :null => false
    t.integer  "hundreds",           :limit => 2, :default => 0, :null => false
    t.integer  "meeting_program_id"
    t.integer  "badge_id"
    t.integer  "passage_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "passages", ["badge_id"], :name => "fk_passages_badges"
  add_index "passages", ["meeting_program_id", "badge_id"], :name => "passages_x_badges"
  add_index "passages", ["passage_type_id"], :name => "fk_passages_passage_types"

  create_table "pool_types", :force => true do |t|
    t.integer  "lock_version",                  :default => 0
    t.string   "code",             :limit => 3,                :null => false
    t.integer  "length_in_meters", :limit => 3
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "pool_types", ["code"], :name => "index_pool_types_on_code", :unique => true

  create_table "presence_types", :force => true do |t|
    t.integer  "lock_version",              :default => 0
    t.string   "code",         :limit => 1,                :null => false
    t.integer  "value",        :limit => 3
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "presence_types", ["code"], :name => "index_presence_types_on_code", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "relay_types", :force => true do |t|
    t.integer  "lock_version",                         :default => 0
    t.string   "code",                   :limit => 10,                 :null => false
    t.integer  "mixed_gender",           :limit => 1,  :default => 0
    t.integer  "partecipants",           :limit => 2,  :default => 4
    t.integer  "phases",                 :limit => 2,  :default => 4
    t.integer  "phase_length_in_meters", :limit => 3,  :default => 50
    t.integer  "stroke_type_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "relay_types", ["code"], :name => "index_relay_types_on_code", :unique => true
  add_index "relay_types", ["stroke_type_id"], :name => "fk_relay_types_stroke_types"

  create_table "result_types", :force => true do |t|
    t.integer  "lock_version",                :default => 0
    t.string   "code",          :limit => 10,                :null => false
    t.integer  "default_value", :limit => 1
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "result_types", ["code"], :name => "index_result_types_on_code", :unique => true

  create_table "season_types", :force => true do |t|
    t.integer  "lock_version",                      :default => 0
    t.string   "code",               :limit => 10,                 :null => false
    t.string   "description",        :limit => 100
    t.string   "short_name",         :limit => 40
    t.integer  "federation_type_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "season_types", ["code"], :name => "index_season_types_on_code", :unique => true
  add_index "season_types", ["federation_type_id"], :name => "fk_season_types_federation_types"

  create_table "seasons", :force => true do |t|
    t.integer  "lock_version",                           :default => 0
    t.string   "description",             :limit => 100,                    :null => false
    t.date     "begin_date",                                                :null => false
    t.date     "end_date"
    t.boolean  "must_use_time_standards",                :default => false, :null => false
    t.integer  "max_points",                             :default => 0,     :null => false
    t.integer  "season_type_id"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  add_index "seasons", ["begin_date"], :name => "index_seasons_on_begin_date"
  add_index "seasons", ["season_type_id"], :name => "fk_seasons_season_types"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shower_types", :force => true do |t|
    t.integer  "lock_version",              :default => 0
    t.string   "code",         :limit => 3,                :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "shower_types", ["code"], :name => "index_shower_types_on_code", :unique => true

  create_table "stroke_types", :force => true do |t|
    t.integer  "lock_version",              :default => 0
    t.string   "code",         :limit => 2,                :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "stroke_types", ["code"], :name => "index_stroke_types_on_code", :unique => true

  create_table "swimmer_results", :force => true do |t|
    t.integer  "lock_version",                                                              :default => 0
    t.decimal  "standard_points",                            :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.decimal  "obercup_points",                             :precision => 10, :scale => 2, :default => 0.0,   :null => false
    t.integer  "rank",                          :limit => 8,                                :default => 0,     :null => false
    t.boolean  "is_disqualified",                                                           :default => false, :null => false
    t.integer  "minutes",                       :limit => 3,                                :default => 0,     :null => false
    t.integer  "seconds",                       :limit => 2,                                :default => 0,     :null => false
    t.integer  "hundreds",                      :limit => 2,                                :default => 0,     :null => false
    t.integer  "swimmer_id"
    t.integer  "badge_id"
    t.integer  "meeting_program_id"
    t.integer  "season_type_id"
    t.integer  "category_type_id"
    t.integer  "result_type_id"
    t.integer  "pool_type_id"
    t.integer  "meeting_individual_result_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                                                   :null => false
    t.datetime "updated_at",                                                                                   :null => false
    t.integer  "disqualification_code_type_id"
  end

  add_index "swimmer_results", ["badge_id"], :name => "fk_swimmer_results_badges"
  add_index "swimmer_results", ["category_type_id"], :name => "fk_swimmer_results_category_types"
  add_index "swimmer_results", ["meeting_individual_result_id", "meeting_program_id", "rank"], :name => "meeting_id_rank"
  add_index "swimmer_results", ["meeting_program_id"], :name => "fk_swimmer_results_meeting_programs"
  add_index "swimmer_results", ["pool_type_id"], :name => "fk_swimmer_results_pool_types"
  add_index "swimmer_results", ["result_type_id"], :name => "fk_swimmer_results_result_types"
  add_index "swimmer_results", ["season_type_id"], :name => "fk_swimmer_results_season_types"
  add_index "swimmer_results", ["swimmer_id"], :name => "fk_swimmer_results_swimmers"

  create_table "swimmers", :force => true do |t|
    t.integer  "lock_version",                      :default => 0
    t.string   "last_name",          :limit => 50
    t.string   "first_name",         :limit => 50
    t.integer  "year_of_birth",                     :default => 1900, :null => false
    t.string   "phone_mobile",       :limit => 40
    t.string   "phone_number",       :limit => 40
    t.string   "e_mail",             :limit => 100
    t.string   "nickname",           :limit => 25,  :default => ""
    t.integer  "associated_user_id", :limit => 8
    t.integer  "gender_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "complete_name",      :limit => 100,                   :null => false
  end

  add_index "swimmers", ["associated_user_id"], :name => "index_swimmers_on_associated_user_id"
  add_index "swimmers", ["complete_name", "year_of_birth"], :name => "name_and_year", :unique => true
  add_index "swimmers", ["complete_name"], :name => "index_swimmers_on_complete_name"
  add_index "swimmers", ["gender_type_id"], :name => "fk_swimmers_gender_types"
  add_index "swimmers", ["last_name", "first_name"], :name => "full_name"
  add_index "swimmers", ["nickname"], :name => "index_swimmers_on_nickname"

  create_table "swimming_pool_reviews", :force => true do |t|
    t.integer  "lock_version",                    :default => 0
    t.string   "title",            :limit => 100,                :null => false
    t.text     "entry_text",                                     :null => false
    t.integer  "user_id"
    t.integer  "swimming_pool_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "swimming_pool_reviews", ["swimming_pool_id"], :name => "fk_swimming_pool_reviews_swimming_pools"
  add_index "swimming_pool_reviews", ["title"], :name => "index_swimming_pool_reviews_on_title"

  create_table "swimming_pools", :force => true do |t|
    t.integer  "lock_version",                          :default => 0
    t.string   "name",                   :limit => 100,                    :null => false
    t.string   "address",                :limit => 100
    t.string   "zip",                    :limit => 6
    t.string   "nick_name",              :limit => 50,                     :null => false
    t.string   "phone_number",           :limit => 40
    t.string   "fax_number",             :limit => 40
    t.string   "e_mail",                 :limit => 100
    t.string   "contact_name",           :limit => 100
    t.string   "maps_uri"
    t.integer  "lanes_number",           :limit => 2,   :default => 8,     :null => false
    t.boolean  "has_multiple_pools",                    :default => false, :null => false
    t.boolean  "has_open_area",                         :default => false, :null => false
    t.boolean  "has_bar",                               :default => false, :null => false
    t.boolean  "has_restaurant_service",                :default => false, :null => false
    t.boolean  "has_gym_area",                          :default => false, :null => false
    t.boolean  "has_children_area",                     :default => false, :null => false
    t.text     "notes"
    t.integer  "city_id"
    t.integer  "pool_type_id"
    t.integer  "shower_type_id"
    t.integer  "hair_dryer_type_id"
    t.integer  "locker_cabinet_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  add_index "swimming_pools", ["city_id"], :name => "fk_swimming_pools_cities"
  add_index "swimming_pools", ["hair_dryer_type_id"], :name => "fk_swimming_pools_hair_dryer_types"
  add_index "swimming_pools", ["locker_cabinet_type_id"], :name => "fk_swimming_pools_locker_cabinet_types"
  add_index "swimming_pools", ["name"], :name => "index_swimming_pools_on_name"
  add_index "swimming_pools", ["nick_name"], :name => "index_swimming_pools_on_nick_name", :unique => true
  add_index "swimming_pools", ["pool_type_id"], :name => "fk_swimming_pools_pool_types"
  add_index "swimming_pools", ["shower_type_id"], :name => "fk_swimming_pools_shower_types"

  create_table "tag4_entities", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "entity_name", :null => false
    t.integer  "entity_id",   :null => false
    t.integer  "tag_id"
    t.integer  "user_id"
  end

  add_index "tag4_entities", ["entity_name", "entity_id"], :name => "entity_name_entity_id"
  add_index "tag4_entities", ["tag_id", "entity_name", "entity_id"], :name => "tag_id_entity_name_entity_id", :unique => true
  add_index "tag4_entities", ["user_id"], :name => "user_id"

  create_table "tags", :force => true do |t|
    t.integer  "lock_version",               :default => 0
    t.string   "name",         :limit => 40,                :null => false
    t.integer  "user_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "team_affiliations", :force => true do |t|
    t.integer  "lock_version",                         :default => 0
    t.string   "number",                :limit => 20
    t.string   "name",                  :limit => 100,                    :null => false
    t.boolean  "must_compute_ober_cup",                :default => false, :null => false
    t.integer  "team_id"
    t.integer  "season_id"
    t.integer  "user_id"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.boolean  "is_autofilled",                        :default => false, :null => false
  end

  add_index "team_affiliations", ["name"], :name => "index_team_affiliations_on_name"
  add_index "team_affiliations", ["number"], :name => "index_team_affiliations_on_number"
  add_index "team_affiliations", ["season_id"], :name => "fk_team_affiliations_seasons"
  add_index "team_affiliations", ["team_id"], :name => "fk_team_affiliations_teams"

  create_table "teams", :force => true do |t|
    t.integer  "lock_version",                   :default => 0
    t.string   "name",            :limit => 60,                 :null => false
    t.string   "editable_name",   :limit => 60,                 :null => false
    t.string   "address",         :limit => 100
    t.string   "zip",             :limit => 6
    t.string   "phone_mobile",    :limit => 40
    t.string   "phone_number",    :limit => 40
    t.string   "fax_number",      :limit => 40
    t.string   "e_mail",          :limit => 100
    t.string   "contact_name",    :limit => 100
    t.text     "notes"
    t.text     "name_variations"
    t.integer  "city_id"
    t.integer  "user_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "teams", ["city_id"], :name => "fk_teams_cities"
  add_index "teams", ["editable_name"], :name => "index_teams_on_editable_name"
  add_index "teams", ["name"], :name => "index_teams_on_name"

  create_table "time_standards", :force => true do |t|
    t.integer  "lock_version",                  :default => 0
    t.integer  "minutes",          :limit => 3, :default => 0, :null => false
    t.integer  "seconds",          :limit => 2, :default => 0, :null => false
    t.integer  "hundreds",         :limit => 2, :default => 0, :null => false
    t.integer  "season_id"
    t.integer  "gender_type_id"
    t.integer  "pool_type_id"
    t.integer  "event_type_id"
    t.integer  "category_type_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "time_standards", ["category_type_id"], :name => "fk_time_standards_category_types"
  add_index "time_standards", ["event_type_id"], :name => "fk_time_standards_event_types"
  add_index "time_standards", ["gender_type_id"], :name => "fk_time_standards_gender_types"
  add_index "time_standards", ["pool_type_id"], :name => "fk_time_standards_pool_types"
  add_index "time_standards", ["season_id"], :name => "fk_time_standards_seasons"

  create_table "users", :force => true do |t|
    t.integer  "lock_version",                                :default => 0
    t.string   "name",                                                          :null => false
    t.string   "description",                   :limit => 50
    t.integer  "swimmer_id"
    t.integer  "badge_id"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.string   "email",                                       :default => "",   :null => false
    t.string   "encrypted_password",                          :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                               :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                             :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "use_email_data_updates_notify",               :default => true, :null => false
    t.boolean  "use_email_achievements_notify",               :default => true, :null => false
    t.boolean  "use_email_newsletter_notify",                 :default => true, :null => false
    t.boolean  "use_email_community_notify",                  :default => true, :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
