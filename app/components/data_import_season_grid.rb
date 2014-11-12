#
# Specialized DataImportSeasonGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportSeasonGrid < EntityGrid

  model 'DataImportSeason'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.season'),
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.season')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.season')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        # { name: :created_at, format: 'Y-m-d', summary_type: :count, width: 80, read_only: true,
          # label: I18n.t(:created_at)
        # },
        # { name: :updated_at, format: 'Y-m-d', width: 80, read_only: true,
          # label: I18n.t(:updated_at)
        # },
        { name: :get_verbose_conflicting_row, flex: 1, label: I18n.t('admin_import.conflicting_row') },
        { name: :import_text, width: 100, label: I18n.t('admin_import.import_text') },
        { name: :description, width: 80, label: I18n.t(:description) },
        { name: :begin_date, width: 80, format: 'Y-m-d',
          label: I18n.t('activerecord.attributes.season.begin_date')
        },
        { name: :end_date, width: 80, format: 'Y-m-d',
          label: I18n.t('activerecord.attributes.season.end_date')
        },
        { name: :header_year, width: 80,
          label: I18n.t('activerecord.attributes.meeting.header_year')
        },
        { name: :edition, width: 80,
          label: I18n.t('activerecord.attributes.meeting.edition')
        },
        { name: :season_type__short_name, width: 110,
          label: I18n.t('activerecord.models.season_type')
        },
        { name: :edition_type__i18n_short, width: 80,
          label: I18n.t('activerecord.models.edition_type')
        },
        { name: :timing_type__i18n_short, width: 80,
          label: I18n.t('activerecord.models.timing_type')
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
      # { name: :created_at, format: 'Y-m-d', summary_type: :count, width: 80, read_only: true,
        # label: I18n.t(:created_at)
      # },
      # { name: :updated_at, format: 'Y-m-d', width: 80, read_only: true,
        # label: I18n.t(:updated_at)
      # },
      { name: :get_verbose_conflicting_row, flex: 1, label: I18n.t('admin_import.conflicting_row') },
      { name: :import_text, width: 100, label: I18n.t('admin_import.import_text') },
      { name: :description, width: 80, label: I18n.t(:description) },
      { name: :begin_date, width: 80, format: 'Y-m-d',
        label: I18n.t('activerecord.attributes.season.begin_date')
      },
      { name: :end_date, width: 80, format: 'Y-m-d',
        label: I18n.t('activerecord.attributes.season.end_date')
      },
      { name: :header_year, width: 80,
        label: I18n.t('activerecord.attributes.meeting.header_year')
      },
      { name: :edition, width: 80,
        label: I18n.t('activerecord.attributes.meeting.edition')
      },
      { name: :season_type__short_name, width: 110,
        label: I18n.t('activerecord.models.season_type')
      },
      { name: :edition_type__i18n_short, width: 80,
        label: I18n.t('activerecord.models.edition_type')
      },
      { name: :timing_type__i18n_short, width: 80,
        label: I18n.t('activerecord.models.timing_type')
      }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
