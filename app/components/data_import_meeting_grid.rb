#
# Specialized DataImportMeetingGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportMeetingGrid < EntityGrid

  model 'DataImportMeeting'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_meeting'),
      scope_for_i18n: :meeting,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_meeting')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_meeting')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :description, width: 160, label: I18n.t(:description) },
        { name: :code, width: 80,
          label: I18n.t('activerecord.attributes.meeting.code')
        },
        { name: :edition, width: 50,
          label: I18n.t('activerecord.attributes.meeting.edition')
        },
        { name: :edition_type__i18n_description, width: 80,
          label: I18n.t('activerecord.models.edition_type')
        },
        { name: :header_date, width: 80, format: 'Y-m-d',
          label: I18n.t('activerecord.attributes.meeting.header_date')
        },
        { name: :header_year, width: 80,
          label: I18n.t('activerecord.attributes.meeting.header_year')
        },
        { name: :season__get_full_name, width: 110,
          label: I18n.t('activerecord.models.season')
        },
        { name: :timing_type__i18n_description, width: 80,
          label: I18n.t('activerecord.models.timing_type')
        },
        { name: :entry_deadline, width: 80, format: 'Y-m-d',
          label: I18n.t('activerecord.attributes.meeting.entry_deadline')
        },
        { name: :has_warm_up_pool, default_value: false, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting.has_warm_up_pool')
        },
        { name: :is_under_25_admitted, default_value: false, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting.is_under_25_admitted')
        },
        { name: :notes, label: I18n.t(:notes) },
        { name: :is_out_of_season, default_value: false, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting.is_out_of_season')
        },
        { name: :has_invitation, default_value: false, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting.has_invitation')
        },
        { name: :has_start_list, default_value: false, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting.has_start_list')
        },
        { name: :are_results_acquired, default_value: false, unchecked_value: 'false',
          label: I18n.t('activerecord.attributes.meeting.are_results_acquired')
        },
        { name: :max_individual_events, width: 80,
          label: I18n.t('activerecord.attributes.meeting.max_individual_events')
        },
        { name: :max_individual_events_per_session, width: 80,
          label: I18n.t('activerecord.attributes.meeting.max_individual_events_per_session')
        },
        { name: :configuration_file, width: 80,
          label: I18n.t('activerecord.attributes.meeting.configuration_file')
        },
        { name: :reference_phone,  label: I18n.t('activerecord.attributes.meeting.reference_phone') },
        { name: :reference_e_mail, label: I18n.t('activerecord.attributes.meeting.reference_e_mail') },
        { name: :reference_name,   label: I18n.t('activerecord.attributes.meeting.reference_name') },
        { name: :tag, label: I18n.t(:tag) }
      ]
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

      { name: :description, width: 160, label: I18n.t(:description) },
      { name: :code, width: 80,
        label: I18n.t('activerecord.attributes.meeting.code')
      },
      { name: :edition, width: 50,
        label: I18n.t('activerecord.attributes.meeting.edition')
      },
      { name: :edition_type__i18n_description, width: 80,
        label: I18n.t('activerecord.models.edition_type')
      },
      { name: :header_date, width: 80, format: 'Y-m-d',
        label: I18n.t('activerecord.attributes.meeting.header_date')
      },
      { name: :header_year, width: 80,
        label: I18n.t('activerecord.attributes.meeting.header_year')
      },
      { name: :season__get_full_name, width: 110,
        label: I18n.t('activerecord.models.season')
      },
      { name: :timing_type__i18n_description, width: 80,
        label: I18n.t('activerecord.models.timing_type')
      },
      { name: :entry_deadline, width: 80, format: 'Y-m-d',
        label: I18n.t('activerecord.attributes.meeting.entry_deadline')
      },
      { name: :has_warm_up_pool, default_value: false, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting.has_warm_up_pool')
      },
      { name: :is_under_25_admitted, default_value: false, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting.is_under_25_admitted')
      },
      { name: :notes, label: I18n.t(:notes) },
      { name: :is_out_of_season, default_value: false, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting.is_out_of_season')
      },
      { name: :has_invitation, default_value: false, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting.has_invitation')
      },
      { name: :has_start_list, default_value: false, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting.has_start_list')
      },
      { name: :are_results_acquired, default_value: false, unchecked_value: 'false',
        label: I18n.t('activerecord.attributes.meeting.are_results_acquired')
      },
      { name: :max_individual_events, width: 80,
        label: I18n.t('activerecord.attributes.meeting.max_individual_events')
      },
      { name: :max_individual_events_per_session, width: 80,
        label: I18n.t('activerecord.attributes.meeting.max_individual_events_per_session')
      },
      { name: :configuration_file, width: 80,
        label: I18n.t('activerecord.attributes.meeting.configuration_file')
      },
      { name: :reference_phone,  label: I18n.t('activerecord.attributes.meeting.reference_phone') },
      { name: :reference_e_mail, label: I18n.t('activerecord.attributes.meeting.reference_e_mail') },
      { name: :reference_name,   label: I18n.t('activerecord.attributes.meeting.reference_name') },
      { name: :tag, label: I18n.t(:tag) }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
