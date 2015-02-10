#
# Specialized DataImportMeetingEntryGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.747
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportMeetingEntryGrid < EntityGrid

  model 'DataImportMeetingEntry'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_meeting_entry'),
      scope_for_i18n: :meeting_entry,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_meeting_entry')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_meeting_entry')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :data_import_meeting_program__get_short_name, width: 180,
          label: I18n.t('activerecord.models.data_import_meeting_program')
        },
        { name: :meeting_program__get_short_name, width: 110,
          label: I18n.t('activerecord.models.meeting_program')
        },

        { name: :athlete_name, width: 160,
          label: I18n.t('activerecord.attributes.meeting_individual_result.athlete_name')
        },
        { name: :data_import_swimmer__get_full_name, width: 110,
          label: I18n.t('activerecord.models.data_import_swimmer')
        },
        { name: :swimmer__get_full_name, width: 110,
          label: I18n.t('activerecord.models.swimmer')
        },
        { name: :team_name, width: 160,
          label: I18n.t('activerecord.attributes.meeting_individual_result.team_name')
        },
        { name: :data_import_team__name, width: 110, label: I18n.t('activerecord.models.data_import_team') },
        { name: :team__name, width: 110, label: I18n.t('activerecord.models.team') },
        { name: :athlete_badge_number, width: 80,
          label: I18n.t('activerecord.attributes.meeting_individual_result.athlete_badge_number')
        },
        { name: :data_import_badge__number, width: 110,
          label: I18n.t('activerecord.models.data_import_badge')
        },
        { name: :badge__number, width: 110, label: I18n.t('activerecord.models.badge') },
        { name: :team_badge_number, width: 80,
          label: I18n.t('activerecord.attributes.meeting_individual_result.team_badge_number')
        },

        { name: :year_of_birth, width: 40,
          label: I18n.t('activerecord.attributes.meeting_individual_result.year_of_birth')
        },
        { name: :start_list_number, width: 30,
          label: I18n.t('activerecord.attributes.meeting_entry.start_list_number')
        },
        { name: :is_no_time, width: 50, default_value: true, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting_entry.is_no_time')
        },
        { name: :lane_number, width: 40,
          label: I18n.t('activerecord.attributes.meeting_entry.lane_number')
        },
        { name: :heat_number, width: 40,
          label: I18n.t('activerecord.attributes.meeting_entry.heat_number')
        },
        { name: :heat_arrival_order, width: 40,
          label: I18n.t('activerecord.attributes.meeting_entry.heat_arrival_order')
        },

        { name: :entry_time_type__i18n_short, width: 50,
          label: I18n.t('activerecord.models.entry_time_type')
        },
        { name: :minutes, width: 30,  label: I18n.t('activerecord.attributes.meeting_individual_result.minutes') },
        { name: :seconds, width: 30,  label: I18n.t('activerecord.attributes.meeting_individual_result.seconds') },
        { name: :hundreds, width: 30, label: I18n.t('activerecord.attributes.meeting_individual_result.hundreds') }
      ],
    )
  end


  js_method :init_component, <<-JS
    function(){
      // Another - more convolute way - to call superclass's initComponent:
      #{js_full_class_name}.superclass.initComponent.call(this);
    }
  JS
  #-- -------------------------------------------------------------------------
  #++


  # Override default fields for forms. Must return an array understood by the
  # items property of the forms.
  #
  def default_fields_for_forms
    [
      { name: :get_verbose_conflicting_row, width: 50,
        label: I18n.t('admin_import.conflicting_row')
      },
      { name: :import_text, flex: 1, label: I18n.t('admin_import.import_text') },

      { name: :data_import_meeting_program__get_short_name, width: 180,
        label: I18n.t('activerecord.models.data_import_meeting_program')
      },
      { name: :meeting_program__get_short_name, width: 110,
        label: I18n.t('activerecord.models.meeting_program')
      },

      { name: :athlete_name, width: 160,
        label: I18n.t('activerecord.attributes.meeting_individual_result.athlete_name')
      },
      { name: :data_import_swimmer__get_full_name, width: 110,
        label: I18n.t('activerecord.models.data_import_swimmer')
      },
      { name: :swimmer__get_full_name, width: 110,
        label: I18n.t('activerecord.models.swimmer')
      },
      { name: :team_name, width: 160,
        label: I18n.t('activerecord.attributes.meeting_individual_result.team_name')
      },
      { name: :data_import_team__name, width: 110, label: I18n.t('activerecord.models.data_import_team') },
      { name: :team__name, width: 110, label: I18n.t('activerecord.models.team') },
      { name: :athlete_badge_number, width: 80,
        label: I18n.t('activerecord.attributes.meeting_individual_result.athlete_badge_number')
      },
      { name: :data_import_badge__number, width: 110,
        label: I18n.t('activerecord.models.data_import_badge')
      },
      { name: :badge__number, width: 110, label: I18n.t('activerecord.models.badge') },
      { name: :team_badge_number, width: 80,
        label: I18n.t('activerecord.attributes.meeting_individual_result.team_badge_number')
      },

      { name: :year_of_birth, width: 40,
        label: I18n.t('activerecord.attributes.meeting_individual_result.year_of_birth')
      },
      { name: :start_list_number, width: 30,
        label: I18n.t('activerecord.attributes.meeting_entry.start_list_number')
      },
      { name: :is_no_time, width: 50, default_value: true, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting_entry.is_no_time')
      },
      { name: :lane_number, width: 40,
        label: I18n.t('activerecord.attributes.meeting_entry.lane_number')
      },
      { name: :heat_number, width: 40,
        label: I18n.t('activerecord.attributes.meeting_entry.heat_number')
      },
      { name: :heat_arrival_order, width: 40,
        label: I18n.t('activerecord.attributes.meeting_entry.heat_arrival_order')
      },

      { name: :entry_time_type__i18n_short, width: 50,
        label: I18n.t('activerecord.models.entry_time_type')
      },
      { name: :minutes, width: 30,  label: I18n.t('activerecord.attributes.meeting_individual_result.minutes') },
      { name: :seconds, width: 30,  label: I18n.t('activerecord.attributes.meeting_individual_result.seconds') },
      { name: :hundreds, width: 30, label: I18n.t('activerecord.attributes.meeting_individual_result.hundreds') }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
