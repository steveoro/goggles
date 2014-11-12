#
# Specialized DataImportMeetingSessionGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportMeetingSessionGrid < EntityGrid

  model 'DataImportMeetingSession'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_meeting_session'),
      scope_for_i18n: :meeting_session,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_meeting_session')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_meeting_session')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :session_order, width: 50,
          label: I18n.t('activerecord.attributes.meeting_session.session_order'),
        },
        { name: :scheduled_date, width: 80, format: 'Y-m-d',
          label: I18n.t('activerecord.attributes.meeting_session.scheduled_date')
        },
        { name: :warm_up_time, width: 80, xtype: 'datecolumn', format: 'H:i',
          label: I18n.t('activerecord.attributes.meeting_session.warm_up_time')
        },
        { name: :begin_time, width: 80, xtype: 'datecolumn', format: 'H:i',
          label: I18n.t('activerecord.attributes.meeting_session.begin_time')
        },
        { name: :day_part_type__i18n_short, width: 80,
          label: I18n.t('activerecord.models.day_part_type')
        },
        { name: :description, label: I18n.t(:description), width: 160 },
        { name: :notes, label: I18n.t(:notes) },

        { name: :data_import_meeting__get_short_name, width: 160,
          label: I18n.t('activerecord.models.data_import_meeting')
        },
        { name: :meeting__get_short_name, width: 120,
          label: I18n.t('activerecord.models.meeting')
        },
        { name: :swimming_pool__nick_name, width: 110,
          label: I18n.t('activerecord.models.swimming_pool')
        }
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

      { name: :session_order, width: 50,
        label: I18n.t('activerecord.attributes.meeting_session.session_order'),
      },
      { name: :scheduled_date, width: 80, format: 'Y-m-d',
        label: I18n.t('activerecord.attributes.meeting_session.scheduled_date')
      },
      { name: :warm_up_time, width: 80, xtype: 'datecolumn', format: 'H:i',
        label: I18n.t('activerecord.attributes.meeting_session.warm_up_time')
      },
      { name: :begin_time, width: 80, xtype: 'datecolumn', format: 'H:i',
        label: I18n.t('activerecord.attributes.meeting_session.begin_time')
      },
      { name: :day_part_type__i18n_short, width: 80,
        label: I18n.t('activerecord.models.day_part_type')
      },
      { name: :description, label: I18n.t(:description), width: 160 },
      { name: :notes, label: I18n.t(:notes) },

      { name: :data_import_meeting__get_short_name, width: 160,
        label: I18n.t('activerecord.models.data_import_meeting')
      },
      { name: :meeting__get_short_name, width: 120,
        label: I18n.t('activerecord.models.meeting')
      },
      { name: :swimming_pool__nick_name, width: 110,
        label: I18n.t('activerecord.models.swimming_pool')
      }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
