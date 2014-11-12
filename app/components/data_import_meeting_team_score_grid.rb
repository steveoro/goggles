#
# Specialized DataImportMeetingTeamScoreGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportMeetingTeamScoreGrid < EntityGrid

  model 'DataImportMeetingTeamScore'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_meeting_team_score'),
      scope_for_i18n: :meeting_team_score,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_meeting_team_score')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_meeting_team_score')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :rank, width: 30,
          label: I18n.t('activerecord.attributes.meeting_team_score.rank')
        },
        { name: :sum_individual_points, width: 80,
          label: I18n.t('activerecord.attributes.meeting_team_score.total_individual_points')
        },
        { name: :sum_relay_points, width: 80,
          label: I18n.t('activerecord.attributes.meeting_team_score.total_relay_points')
        },
        { name: :sum_team_points, width: 80,
          label: I18n.t('activerecord.attributes.meeting_team_score.total_relay_points')
        },
        { name: :meeting_individual_points, width: 80,
          label: I18n.t('activerecord.attributes.meeting_team_score.total_individual_points')
        },
        { name: :meeting_relay_points, width: 80,
          label: I18n.t('activerecord.attributes.meeting_team_score.total_relay_points')
        },
        { name: :meeting_team_points, width: 80,
          label: I18n.t('activerecord.attributes.meeting_team_score.total_relay_points')
        },
        { name: :data_import_team__name, width: 160, label: I18n.t('activerecord.models.data_import_team') },
        { name: :team__name, width: 120, label: I18n.t('activerecord.models.team') },

        { name: :data_import_meeting__get_full_name, width: 130,
          label: I18n.t('activerecord.models.data_import_meeting')
        },
        { name: :meeting__get_full_name, width: 120,
          label: I18n.t('activerecord.models.meeting')
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

      { name: :rank, width: 30,
        label: I18n.t('activerecord.attributes.meeting_team_score.rank')
      },
      { name: :sum_individual_points, width: 80,
        label: I18n.t('activerecord.attributes.meeting_team_score.total_individual_points')
      },
      { name: :sum_relay_points, width: 80,
        label: I18n.t('activerecord.attributes.meeting_team_score.total_relay_points')
      },
      { name: :sum_team_points, width: 80,
        label: I18n.t('activerecord.attributes.meeting_team_score.total_relay_points')
      },
      { name: :meeting_individual_points, width: 80,
        label: I18n.t('activerecord.attributes.meeting_team_score.total_individual_points')
      },
      { name: :meeting_relay_points, width: 80,
        label: I18n.t('activerecord.attributes.meeting_team_score.total_relay_points')
      },
      { name: :meeting_team_points, width: 80,
        label: I18n.t('activerecord.attributes.meeting_team_score.total_relay_points')
      },
      { name: :data_import_team__name, width: 160, label: I18n.t('activerecord.models.data_import_team') },
      { name: :team__name, width: 120, label: I18n.t('activerecord.models.team') },

      { name: :data_import_meeting__get_full_name, width: 130,
        label: I18n.t('activerecord.models.data_import_meeting')
      },
      { name: :meeting__get_full_name, width: 120,
        label: I18n.t('activerecord.models.meeting')
      }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
