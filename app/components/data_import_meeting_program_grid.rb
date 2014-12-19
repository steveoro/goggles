#
# Specialized DataImportMeetingProgramGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportMeetingProgramGrid < EntityGrid

  model 'DataImportMeetingProgram'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_meeting_program'),
      scope_for_i18n: :meeting_program,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_meeting_program')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_meeting_program')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :event_order, width: 50,
          label: I18n.t('activerecord.attributes.meeting_program.event_order')
        },
        { name: :begin_time, width: 80, xtype: 'datecolumn', format: 'H:i',
          label: I18n.t('activerecord.attributes.meeting_program.begin_time')
        },
        { name: :notes, label: I18n.t(:notes) },

        { name: :data_import_meeting_session__get_full_name, width: 100,
          label: I18n.t('activerecord.models.data_import_meeting_session')
        },
        { name: :meeting_session__get_short_name, width: 160,
          scope: lambda { |rel| rel.where( meeting_id: super[:meeting_id] ) },
          label: I18n.t('activerecord.models.meeting_session')
        },
        { name: :event_type__i18n_short, width: 110,
          label: I18n.t('activerecord.models.event_type')
        },
        { name: :category_type__short_name, width: 60,
          label: I18n.t('activerecord.models.category_type')
        },
                                              # Base timings:
        { name: :minutes, width: 30,  label: I18n.t('activerecord.attributes.meeting_program.minutes') },
        { name: :seconds, width: 30,  label: I18n.t('activerecord.attributes.meeting_program.seconds') },
        { name: :hundreds, width: 30, label: I18n.t('activerecord.attributes.meeting_program.hundreds') },
        { name: :time_standard__get_timing, width: 110,
          label: I18n.t('activerecord.models.time_standard')
        },
        { name: :heat_type__i18n_description, width: 80,
          label: I18n.t('activerecord.models.heat_type')
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

      { name: :event_order, width: 50,
        label: I18n.t('activerecord.attributes.meeting_program.event_order')
      },
      { name: :begin_time, width: 80, xtype: 'datecolumn', format: 'H:i',
        label: I18n.t('activerecord.attributes.meeting_program.begin_time')
      },
      { name: :notes, label: I18n.t(:notes) },

      { name: :data_import_meeting_session__get_full_name, width: 160,
        label: I18n.t('activerecord.models.data_import_meeting_session')
      },
      { name: :meeting_session__get_full_name, width: 110,
        label: I18n.t('activerecord.models.meeting_session')
      },
      { name: :event_type__i18n_short, width: 110,
        label: I18n.t('activerecord.models.event_type')
      },
      { name: :category_type__short_name, width: 60,
        label: I18n.t('activerecord.models.category_type')
      },
                                            # Base timings:
      { name: :minutes, width: 30,  label: I18n.t('activerecord.attributes.meeting_program.minutes') },
      { name: :seconds, width: 30,  label: I18n.t('activerecord.attributes.meeting_program.seconds') },
      { name: :hundreds, width: 30, label: I18n.t('activerecord.attributes.meeting_program.hundreds') },
      { name: :time_standard__get_timing, width: 110,
        label: I18n.t('activerecord.models.time_standard')
      },
      { name: :heat_type__i18n_description, width: 80,
        label: I18n.t('activerecord.models.heat_type')
      }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
