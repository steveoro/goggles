#
# Specialized DataImportMeetingRelayResultGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportMeetingRelayResultGrid < EntityGrid

  model 'DataImportMeetingRelayResult'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_meeting_relay_result'),
      scope_for_i18n: :meeting_relay_result,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_meeting_relay_result')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_meeting_relay_result')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :data_import_meeting_program__get_short_name, width: 210,
          label: I18n.t('activerecord.models.data_import_meeting_program')
        },
        { name: :meeting_program__get_short_name, width: 110,
          label: I18n.t('activerecord.models.meeting_program')
        },
        { name: :data_import_team__name, width: 110, label: I18n.t('activerecord.models.data_import_team') },
        { name: :team__name, width: 110, label: I18n.t('activerecord.models.team') },

        { name: :rank, width: 30,
          label: I18n.t('activerecord.attributes.meeting_relay_result.rank')
        },
        { name: :is_play_off, width: 50, default_value: true, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting_relay_result.is_play_off')
        },
        { name: :is_out_of_race, width: 50, default_value: false, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting_relay_result.is_out_of_race')
        },
        { name: :is_disqualified, width: 50, default_value: false, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting_relay_result.is_disqualified')
        },
        { name: :disqualification_code_type__i18n_short, width: 50,
          label: I18n.t('activerecord.models.result_type')
        },
        { name: :standard_points, width: 50,
          label: I18n.t('activerecord.attributes.meeting_relay_result.standard_points')
        },
        { name: :meeting_points, width: 50,
          label: I18n.t('activerecord.attributes.meeting_relay_result.meeting_points')
        },
        { name: :minutes, width: 30,  label: I18n.t('activerecord.attributes.meeting_relay_result.minutes') },
        { name: :seconds, width: 30,  label: I18n.t('activerecord.attributes.meeting_relay_result.seconds') },
        { name: :hundreds, width: 30, label: I18n.t('activerecord.attributes.meeting_relay_result.hundreds') }
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

      { name: :data_import_meeting_program__get_short_name, width: 210,
        label: I18n.t('activerecord.models.data_import_meeting_program')
      },
      { name: :meeting_program__get_short_name, width: 110,
        label: I18n.t('activerecord.models.meeting_program')
      },
      { name: :data_import_team__name, width: 110, label: I18n.t('activerecord.models.data_import_team') },
      { name: :team__name, width: 110, label: I18n.t('activerecord.models.team') },

      { name: :rank, width: 30,
        label: I18n.t('activerecord.attributes.meeting_relay_result.rank')
      },
      { name: :is_play_off, width: 50, default_value: true, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting_relay_result.is_play_off')
      },
      { name: :is_out_of_race, width: 50, default_value: false, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting_relay_result.is_out_of_race')
      },
      { name: :is_disqualified, width: 50, default_value: false, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting_relay_result.is_disqualified')
      },
      { name: :disqualification_code_type__i18n_short, width: 50,
        label: I18n.t('activerecord.models.result_type')
      },
      { name: :standard_points, width: 50,
        label: I18n.t('activerecord.attributes.meeting_relay_result.standard_points')
      },
      { name: :meeting_points, width: 50,
        label: I18n.t('activerecord.attributes.meeting_relay_result.meeting_points')
      },
      { name: :minutes, width: 30,  label: I18n.t('activerecord.attributes.meeting_relay_result.minutes') },
      { name: :seconds, width: 30,  label: I18n.t('activerecord.attributes.meeting_relay_result.seconds') },
      { name: :hundreds, width: 30, label: I18n.t('activerecord.attributes.meeting_relay_result.hundreds') }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
