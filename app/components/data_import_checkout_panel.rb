#
# Main panel for Data Import checkout/management. Includes several data_import_XXX_grid
# components in a tabbed view.
#
# - author: Steve A.
# - vers. : 4.00.11.20130912
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportCheckoutPanel < Netzke::Basepack::TabPanel

  action :row_counter,  :text => I18n.t(:click_on_the_grid), :disabled => true
  # ---------------------------------------------------------------------------

  action :commit_rows,  :text => I18n.t(:commit_rows),
                        :tooltip => I18n.t(:commit_rows_tooltip),
                        :icon =>"/images/icons/database_save.png"
  # ---------------------------------------------------------------------------

  js_properties(
    :prevent_header => true,
    :header => false,
    :border => true,
    :active_tab => 0
  )


  # Override for default bottom bar:
  #
  def default_bbar
    [
     :commit_rows.action,
     "-",                                           # Adds a separator
     :row_counter.action
    ]
  end

  # ---------------------------------------------------------------------------


  def configuration
    # ASSERT: assuming current_user is always set for this grid component:
    super.merge(
      :persistence => true,
      :min_width => 800,
      :min_height => 650,
      :items => [
        # {
          # :class_name => "EntityGrid",
          # :model => 'DataImportSeason',
          # :prevent_header => true,
          # :title => I18n.t(:season, {:scope=>[:activerecord, :models]}),
          # :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:season, {:scope=>[:activerecord, :models]})}" },
          # :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:season, {:scope=>[:activerecord, :models]})}" },
# 
          # :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          # :columns => [
# #              { :name => :created_at,               :label => I18n.t(:created_at), :width => 80, :read_only => true,
# #                :format => 'Y-m-d', :summary_type => :count },
# #              { :name => :updated_at,               :label => I18n.t(:updated_at), :width => 80, :read_only => true,
# #                :format => 'Y-m-d' },
              # { :name => :get_verbose_conflicting_row,  :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :flex => 1 },
              # { :name => :import_text,              :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :width => 100 },
              # { :name => :description,              :label => I18n.t(:description), :width => 80 },
              # { :name => :begin_date,               :label => I18n.t(:begin_date, {:scope=>[:activerecord, :attributes, :season]}),
                # :width => 80, :format => 'Y-m-d' },
              # { :name => :end_date,                 :label => I18n.t(:end_date, {:scope=>[:activerecord, :attributes, :season]}),
                # :width => 80, :format => 'Y-m-d' },
              # { :name => :must_use_time_standards,  :label => I18n.t(:must_use_time_standards, {:scope=>[:activerecord, :attributes, :season]}),
                # :width => 80, :default_value => false, :unchecked_value => 'false' },
              # { :name => :max_points,               :label => I18n.t(:max_points, {:scope=>[:activerecord, :attributes, :season]}),
                # :width => 80 },
              # { :name => :season_type__short_name,  :label => I18n.t(:season_type, {:scope=>[:activerecord, :models]}),
                # :width => 110 }
          # ]
        # },
        {
          :class_name => "EntityGrid",
          :model => 'DataImportMeeting',
          :prevent_header => true,
          :title => I18n.t(:data_import_meeting, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :meeting,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_meeting, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_meeting, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count
              },
              { :name => :import_text,            :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },
              { :name => :description,            :label => I18n.t(:description), :width => 160 },

              { :name => :challenge_number,       :label => I18n.t(:challenge_number, {:scope=>[:activerecord, :attributes, :meeting]}),
                :width => 50 },
              { :name => :season__description,    :label => I18n.t(:season, {:scope=>[:activerecord, :models]}),
                :width => 110 },

              { :name => :entry_deadline,         :label => I18n.t(:entry_deadline, {:scope=>[:activerecord, :attributes, :meeting]}),
                :width => 80, :format => 'Y-m-d' },
              { :name => :has_warm_up_pool,       :label => I18n.t(:has_warm_up_pool, {:scope=>[:activerecord, :attributes, :meeting]}),
                :default_value => false, :unchecked_value => 'false' },
              { :name => :is_under_25_admitted,   :label => I18n.t(:is_under_25_admitted, {:scope=>[:activerecord, :attributes, :meeting]}),
                :default_value => false, :unchecked_value => 'false' },

              { :name => :reference_phone,        :label => I18n.t(:reference_phone, {:scope=>[:activerecord, :attributes, :meeting]}) },
              { :name => :reference_e_mail,       :label => I18n.t(:reference_e_mail, {:scope=>[:activerecord, :attributes, :meeting]}) },
              { :name => :reference_name,         :label => I18n.t(:reference_name, {:scope=>[:activerecord, :attributes, :meeting]}) },
              { :name => :notes,                  :label => I18n.t(:notes) },
              { :name => :tag,                    :label => I18n.t(:tag) },

              { :name => :has_invitation,         :label => I18n.t(:has_invitation, {:scope=>[:activerecord, :attributes, :meeting]}),
                :default_value => false, :unchecked_value => 'false' },
              { :name => :has_start_list,         :label => I18n.t(:has_start_list, {:scope=>[:activerecord, :attributes, :meeting]}),
                :default_value => false, :unchecked_value => 'false' },
              { :name => :are_results_acquired,   :label => I18n.t(:are_results_acquired, {:scope=>[:activerecord, :attributes, :meeting]}),
                :default_value => false, :unchecked_value => 'false' },

              { :name => :max_individual_events,  :label => I18n.t(:max_individual_events, {:scope=>[:activerecord, :attributes, :meeting]}),
                :width => 80 },
              { :name => :configuration_file,     :label => I18n.t(:configuration_file, {:scope=>[:activerecord, :attributes, :meeting]}),
                :width => 80 }
          ]
        },
        {
          :class_name => "EntityGrid",
          :model => 'DataImportMeetingSession',
          :prevent_header => true,
          :title => I18n.t(:data_import_meeting_session, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :meeting_session,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_meeting_session, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_meeting_session, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count },
              { :name => :import_text,            :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },

              { :name => :session_order,          :label => I18n.t(:session_order, {:scope=>[:activerecord, :attributes, :meeting_session]}),
                :width => 50 },
              { :name => :scheduled_date,         :label => I18n.t(:scheduled_date, {:scope=>[:activerecord, :attributes, :meeting_session]}),
                :width => 80, :format => 'Y-m-d' },
              { :name => :warm_up_time,           :label => I18n.t(:warm_up_time, {:scope=>[:activerecord, :attributes, :meeting_session]}),
                :width => 80, :xtype => 'datecolumn', :format => 'H:i' },
              { :name => :begin_time,             :label => I18n.t(:begin_time, {:scope=>[:activerecord, :attributes, :meeting_session]}),
                :width => 80, :xtype => 'datecolumn', :format => 'H:i' },
              { :name => :notes,                  :label => I18n.t(:notes) },

              { :name => :data_import_meeting__description, :label => I18n.t(:data_import_meeting, {:scope=>[:activerecord, :models]}),
                :width => 160 },
              { :name => :meeting__description,   :label => I18n.t(:meeting, {:scope=>[:activerecord, :models]}),
                :width => 120 },
              { :name => :swimming_pool__nick_name, :label => I18n.t(:swimming_pool, {:scope=>[:activerecord, :models]}),
                :width => 110 }
          ],
          :lazy_loading => true
        },
        {
          :class_name => "EntityGrid",
          :model => 'DataImportMeetingProgram',
          :prevent_header => true,
          :title => I18n.t(:data_import_meeting_program, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :meeting_program,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_meeting_program, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_meeting_program, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count },
              { :name => :import_text,            :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },

              { :name => :event_order,            :label => I18n.t(:event_order, {:scope=>[:activerecord, :attributes, :meeting_program]}),
                :width => 50 },
              { :name => :begin_time,             :label => I18n.t(:begin_time, {:scope=>[:activerecord, :attributes, :meeting_program]}),
                :width => 80, :xtype => 'datecolumn', :format => 'H:i' },
              { :name => :notes,                  :label => I18n.t(:notes) },

              { :name => :data_import_meeting_session__get_full_name, :label => I18n.t(:data_import_meeting_session, {:scope=>[:activerecord, :models]}),
                :width => 160 },
              { :name => :meeting_session__get_full_name,   :label => I18n.t(:meeting_session, {:scope=>[:activerecord, :models]}),
                :width => 110 },
              { :name => :event_type__i18n_short, :label => I18n.t(:event_type, {:scope=>[:activerecord, :models]}),
                :width => 110 },
              { :name => :category_type__short_name, :label => I18n.t(:category_type, {:scope=>[:activerecord, :models]}),
                :width => 60 },
                                                    # Base timings:
              { :name => :minutes,                :label => I18n.t(:minutes, {:scope=>[:activerecord, :attributes, :meeting_program]}),
                :width => 30 },
              { :name => :seconds,                :label => I18n.t(:seconds, {:scope=>[:activerecord, :attributes, :meeting_program]}),
                :width => 30 },
              { :name => :hundreds,               :label => I18n.t(:hundreds, {:scope=>[:activerecord, :attributes, :meeting_program]}),
                :width => 30 },

              { :name => :accreditation_time_type__i18n_description, :label => I18n.t(:accreditation_time_type, {:scope=>[:activerecord, :models]}),
                :width => 80 }
          ],
          :lazy_loading => true
        },
        {
          :class_name => "EntityGrid",
          :model => 'DataImportMeetingIndividualResult',
          :prevent_header => true,
          :title => I18n.t(:data_import_meeting_individual_result, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :meeting_individual_result,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_meeting_individual_result, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_meeting_individual_result, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count },
              { :name => :import_text,            :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },

              { :name => :data_import_meeting_program__get_short_name, :label => I18n.t(:data_import_meeting_program, {:scope=>[:activerecord, :models]}),
                :width => 180 },
              { :name => :meeting_program__get_short_name, :label => I18n.t(:meeting_program, {:scope=>[:activerecord, :models]}),
                :width => 110 },

              { :name => :athlete_name,           :label => I18n.t(:athlete_name, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 160 },
              { :name => :data_import_swimmer__get_full_name, :label => I18n.t(:data_import_swimmer, {:scope=>[:activerecord, :models]}),
                :width => 110 },
              { :name => :swimmer__get_full_name, :label => I18n.t(:swimmer, {:scope=>[:activerecord, :models]}),
                :width => 110 },

              { :name => :team_name,              :label => I18n.t(:team_name, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 160 },
              { :name => :data_import_team__name, :label => I18n.t(:data_import_team, {:scope=>[:activerecord, :models]}),
                :width => 110 },
              { :name => :team__name, :label => I18n.t(:team, {:scope=>[:activerecord, :models]}),
                :width => 110 },

              { :name => :athlete_badge_number,   :label => I18n.t(:athlete_badge_number, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 80 },
              { :name => :data_import_badge__number, :label => I18n.t(:data_import_badge, {:scope=>[:activerecord, :models]}),
                :width => 110 },
              { :name => :badge__number, :label => I18n.t(:badge, {:scope=>[:activerecord, :models]}),
                :width => 110 },
              { :name => :team_badge_number,      :label => I18n.t(:team_badge_number, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 80 },

              { :name => :year_of_birth,          :label => I18n.t(:year_of_birth, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 40 },
              { :name => :rank,                   :label => I18n.t(:rank, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 30 },

              { :name => :is_play_off,            :label => I18n.t(:is_play_off, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 50, :default_value => true, :unchecked_value => 'false' },
              { :name => :is_out_of_race,         :label => I18n.t(:is_out_of_race, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 50, :default_value => false, :unchecked_value => 'false' },
              { :name => :is_disqualified,        :label => I18n.t(:is_disqualified, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 50, :default_value => false, :unchecked_value => 'false' },

              { :name => :standard_points,        :label => I18n.t(:standard_points, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 50 },
              { :name => :meeting_points,         :label => I18n.t(:meeting_points, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 50 },
              { :name => :minutes,                :label => I18n.t(:minutes, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 30 },
              { :name => :seconds,                :label => I18n.t(:seconds, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 30 },
              { :name => :hundreds,               :label => I18n.t(:hundreds, {:scope=>[:activerecord, :attributes, :meeting_individual_result]}),
                :width => 30 },

              { :name => :result_type__i18n_short, :label => I18n.t(:result_type, {:scope=>[:activerecord, :models]}),
                :width => 50 }
          ],
          :lazy_loading => true
        },

        {
          :class_name => "EntityGrid",
          :model => 'DataImportMeetingRelayResult',
          :prevent_header => true,
          :title => I18n.t(:data_import_meeting_relay_result, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :meeting_relay_result,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_meeting_relay_result, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_meeting_relay_result, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count },
              { :name => :import_text,            :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },

              { :name => :data_import_meeting_program__get_short_name, :label => I18n.t(:data_import_meeting_program, {:scope=>[:activerecord, :models]}),
                :width => 210 },
              { :name => :meeting_program__get_short_name, :label => I18n.t(:meeting_program, {:scope=>[:activerecord, :models]}),
                :width => 110 },

              { :name => :data_import_team__name, :label => I18n.t(:data_import_team, {:scope=>[:activerecord, :models]}),
                :width => 110 },
              { :name => :team__name, :label => I18n.t(:team, {:scope=>[:activerecord, :models]}),
                :width => 110 },

              { :name => :rank,                   :label => I18n.t(:rank, {:scope=>[:activerecord, :attributes, :meeting_relay_result]}),
                :width => 30 },

              { :name => :is_play_off,            :label => I18n.t(:is_play_off, {:scope=>[:activerecord, :attributes, :meeting_relay_result]}),
                :width => 50, :default_value => true, :unchecked_value => 'false' },
              { :name => :is_out_of_race,         :label => I18n.t(:is_out_of_race, {:scope=>[:activerecord, :attributes, :meeting_relay_result]}),
                :width => 50, :default_value => false, :unchecked_value => 'false' },
              { :name => :is_disqualified,        :label => I18n.t(:is_disqualified, {:scope=>[:activerecord, :attributes, :meeting_relay_result]}),
                :width => 50, :default_value => false, :unchecked_value => 'false' },

              { :name => :standard_points,        :label => I18n.t(:standard_points, {:scope=>[:activerecord, :attributes, :meeting_relay_result]}),
                :width => 50 },
              { :name => :meeting_points,         :label => I18n.t(:meeting_points, {:scope=>[:activerecord, :attributes, :meeting_relay_result]}),
                :width => 50 },
              { :name => :minutes,                :label => I18n.t(:minutes, {:scope=>[:activerecord, :attributes, :meeting_relay_result]}),
                :width => 30 },
              { :name => :seconds,                :label => I18n.t(:seconds, {:scope=>[:activerecord, :attributes, :meeting_relay_result]}),
                :width => 30 },
              { :name => :hundreds,               :label => I18n.t(:hundreds, {:scope=>[:activerecord, :attributes, :meeting_relay_result]}),
                :width => 30 },

              { :name => :result_type__i18n_short, :label => I18n.t(:result_type, {:scope=>[:activerecord, :models]}),
                :width => 50 }
          ],
          :lazy_loading => true
        },

        {
          :class_name => "EntityGrid",
          :model => 'DataImportMeetingTeamScore',
          :prevent_header => true,
          :title => I18n.t(:data_import_meeting_team_score, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :meeting_team_score,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_meeting_team_score, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_meeting_team_score, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count },
              { :name => :import_text,            :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },

              { :name => :rank,                   :label => I18n.t(:rank, {:scope=>[:activerecord, :attributes, :meeting_team_score]}),
                :width => 30 },
              { :name => :total_individual_points, :label => I18n.t(:total_individual_points, {:scope=>[:activerecord, :attributes, :meeting_team_score]}),
                :width => 80 },
              { :name => :total_relay_points, :label => I18n.t(:total_relay_points, {:scope=>[:activerecord, :attributes, :meeting_team_score]}),
                :width => 80 },

              { :name => :data_import_team__name, :label => I18n.t(:data_import_team, {:scope=>[:activerecord, :models]}),
                :width => 160 },
              { :name => :team__name, :label => I18n.t(:team, {:scope=>[:activerecord, :models]}),
                :width => 120 },

              { :name => :data_import_meeting__get_full_name, :label => I18n.t(:data_import_meeting, {:scope=>[:activerecord, :models]}),
                :width => 130 },
              { :name => :meeting__get_full_name, :label => I18n.t(:meeting, {:scope=>[:activerecord, :models]}),
                :width => 120 }
          ],
          :lazy_loading => true
        },

        {
          :class_name => "EntityGrid",
          :model => 'DataImportSwimmer',
          :prevent_header => true,
          :title => I18n.t(:data_import_swimmer, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :swimmer,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_swimmer, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_swimmer, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count },
              { :name => :import_text, :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },

              { :name => :complete_name, :label => I18n.t(:complete_name, {:scope=>[:activerecord, :attributes, :swimmer]}),
                :width => 160 },
              { :name => :last_name, :label => I18n.t(:last_name, {:scope=>[:activerecord, :attributes, :swimmer]}),
                :width => 100 },
              { :name => :first_name, :label => I18n.t(:first_name, {:scope=>[:activerecord, :attributes, :swimmer]}),
                :width => 100 },
              { :name => :year_of_birth, :label => I18n.t(:year_of_birth, {:scope=>[:activerecord, :attributes, :swimmer]}),
                :width => 40 },
              { :name => :gender_type__i18n_short, :label => I18n.t(:gender_type, {:scope=>[:activerecord, :attributes, :swimmer]}),
                :width => 110 }
          ],
          :lazy_loading => true
        },
        {
          :class_name => "EntityGrid",
          :model => 'DataImportCity',
          :prevent_header => true,
          :title => I18n.t(:data_import_city, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :city,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_city, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_city, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count },
              { :name => :import_text, :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },

              { :name => :name, :label => I18n.t(:name, {:scope=>[:activerecord, :attributes, :city]}),
                :width => 160 },
              { :name => :zip, :label => I18n.t(:zip, {:scope=>[:activerecord, :attributes, :city]}),
                :width => 80 },
              { :name => :area, :label => I18n.t(:area, {:scope=>[:activerecord, :attributes, :city]}),
                :width => 100 },
              { :name => :country, :label => I18n.t(:country, {:scope=>[:activerecord, :attributes, :city]}),
                :width => 100 },
              { :name => :country_code, :label => I18n.t(:country_code, {:scope=>[:activerecord, :attributes, :city]}),
                :width => 40 }
          ],
          :lazy_loading => true
        },
        {
          :class_name => "EntityGrid",
          :model => 'DataImportTeam',
          :prevent_header => true,
          :title => I18n.t(:data_import_team, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :team,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_team, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_team, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count },
              { :name => :import_text, :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },

              { :name => :name, :label => I18n.t(:name, {:scope=>[:activerecord, :attributes, :team]}),
                :width => 180 },
              { :name => :badge_number, :label => I18n.t(:zip, {:scope=>[:activerecord, :attributes, :team]}),
                :width => 100 },
              { :name => :data_import_city__name, :label => I18n.t(:data_import_city, {:scope=>[:activerecord, :models]}),
                :width => 120 },
              { :name => :city__get_full_name, :label => I18n.t(:city, {:scope=>[:activerecord, :models]}),
                :width => 120 }
          ],
          :lazy_loading => true
        },
        {
          :class_name => "EntityGrid",
          :model => 'DataImportBadge',
          :prevent_header => true,
          :title => I18n.t(:data_import_badge, {:scope=>[:activerecord, :models]}),
          :scope_for_i18n => :badge,
          :add_form_window_config => { :width => 500, :title => "#{I18n.t(:add)} #{I18n.t(:data_import_badge, {:scope=>[:activerecord, :models]})}" },
          :edit_form_window_config => { :width => 500, :title => "#{I18n.t(:edit)} #{I18n.t(:data_import_badge, {:scope=>[:activerecord, :models]})}" },

          :scope => [ "data_import_session_id = ?", super[:data_import_session_id] ],
          :columns => [
#              { :name => :created_at,             :label => I18n.t(:created_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d', :summary_type => :count },
#              { :name => :updated_at,             :label => I18n.t(:updated_at), :width => 80, :read_only => true,
#                :format => 'Y-m-d' },
              { :name => :get_verbose_conflicting_row, :label => I18n.t(:conflicting_row, {:scope=>[:admin_import]}), :width => 100,
                :summary_type => :count },
              { :name => :import_text, :label => I18n.t(:import_text, {:scope=>[:admin_import]}), :flex => 1 },

              { :name => :number, :label => I18n.t(:number, {:scope=>[:activerecord, :attributes, :badge]}),
                :width => 180 },

              { :name => :data_import_swimmer__get_full_name, :label => I18n.t(:data_import_swimmer, {:scope=>[:activerecord, :models]}),
                :width => 100 },
              { :name => :swimmer__get_full_name, :label => I18n.t(:swimmer, {:scope=>[:activerecord, :models]}),
                :width => 100 },
              { :name => :data_import_team__get_full_name, :label => I18n.t(:data_import_team, {:scope=>[:activerecord, :models]}),
                :width => 100 },
              { :name => :team__get_full_name, :label => I18n.t(:team, {:scope=>[:activerecord, :models]}),
                :width => 100 },
              { :name => :data_import_season__get_full_name, :label => I18n.t(:data_import_season, {:scope=>[:activerecord, :models]}),
                :width => 100 },
              { :name => :season__get_full_name, :label => I18n.t(:season, {:scope=>[:activerecord, :models]}),
                :width => 100 },

              { :name => :category_type__code, :label => I18n.t(:category_type, {:scope=>[:activerecord, :models]}),
                :width => 80 },
              { :name => :accreditation_time_type__i18n_short, :label => I18n.t(:accreditation_time_type, {:scope=>[:activerecord, :models]}),
                :width => 80 }
          ],
          :lazy_loading => true
        }
      ]
    )
  end

  # ---------------------------------------------------------------------------


  js_method :init_component, <<-JS
    function() {
      #{js_full_class_name}.superclass.initComponent.call(this);

/*
   // TODO METTERE dentro a singoli components:

      // Update in real time the enabled state of the available actions:
      this.getSelectionModel().on(
        'selectionchange',
        function(selModel) {
          var gridStore = this.getStore();
          var iConflictIDFound = 0;
          gridStore.each (
            function( record ) {
              if ( record.data.get_verbose_conflicting_row.length > 0  ) {
                iConflictIDFound += 1;
              }
            },
            this
          );
          this.actions.rowCounter.setText( '#{I18n.t(:tot_rows)}: ' + gridStore.getCount() + ' / #{I18n.t(:selected)}: ' + selModel.getCount() + ' / #{I18n.t(:in_conflict)}: ' + iConflictIDFound );
        },
        this
      );
                                                    // As soon as the grid is ready, sort it by default:
      this.on( 'viewready',
        function( gridPanel, eOpts ) {
          gridPanel.store.sort([ { property: 'begin_date', direction: 'ASC' } ]);
        },
        this
      );
*/
    }  
  JS

  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------

  # Front-end JS event handler for the action 'commit_rows'
  #
  js_method :on_commit_rows, <<-JS
    function() {
      Ext.MessageBox.confirm( this.i18n.confirmation, this.i18n.areYouSure,
        function(btn) {
          if (btn == 'yes') {
            this.invokePostOnHiddenForm( 'frmPostImportData', 'data' );
          }
        },
        this
      );
    }
  JS
  # ---------------------------------------------------------------------------


  # Invokes a controller path sending in all the (encoded) IDs currently available on
  # the data store.
  #
  js_method :invoke_post_on_hidden_form, <<-JS
    function( formId, dataFieldId ) {
      var gridStore = this.getStore();
      var rowArray = new Array();
      gridStore.each(
        function( record ) {
          rowArray.push( record.data.id );
        },
        this
      );
                                                    // If there is data, process it:
      if ( rowArray.length > 0 ) {
        var encodedData = Ext.JSON.encode( rowArray );
        var form = Ext.get( formId );
        var hiddenField = Ext.get( dataFieldId );
        hiddenField.dom.value = encodedData;
        form.dom.submit();
      }
      else {
        this.netzkeFeedback( "#{I18n.t(:warning_no_data_to_send)}" );
      }
    }
  JS
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------
end
