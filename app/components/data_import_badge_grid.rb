#
# Specialized DataImportBadgeGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportBadgeGrid < EntityGrid

  model 'DataImportBadge'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_badge'),
      scope_for_i18n: :badge,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_badge')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_badge')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],

      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :number, width: 80,
          label: I18n.t('activerecord.attributes.badge.number')
        },
        { name: :data_import_swimmer__get_full_name, width: 180,
          label: I18n.t('activerecord.models.data_import_swimmer')
        },
        { name: :swimmer__get_full_name, width: 150,
          label: I18n.t('activerecord.models.swimmer')
        },
        { name: :data_import_team__get_full_name, width: 180,
          label: I18n.t('activerecord.models.data_import_team')
        },
        { name: :team__get_full_name, width: 150,
          label: I18n.t('activerecord.models.team')
        },
        { name: :data_import_season__get_full_name, width: 100,
          label: I18n.t('activerecord.models.data_import_season')
        },
        { name: :season__get_full_name,  width: 100,
          label: I18n.t('activerecord.models.season')
        },
        { name: :category_type__code, width: 50,
          label: I18n.t('activerecord.models.category_type')
        },
        { name: :entry_time_type__i18n_short, width: 50,
          label: I18n.t('activerecord.models.accreditation_time_type')
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

      { name: :number, width: 180,
        label: I18n.t('activerecord.attributes.badge.number')
      },
      { name: :data_import_swimmer__get_full_name, width: 100,
        label: I18n.t('activerecord.models.data_import_swimmer')
      },
      { name: :swimmer__get_full_name, width: 100,
        label: I18n.t('activerecord.models.swimmer')
      },
      { name: :data_import_team__get_full_name, width: 100,
        label: I18n.t('activerecord.models.data_import_team')
      },
      { name: :team__get_full_name, width: 100,
        label: I18n.t('activerecord.models.team')
      },
      { name: :data_import_season__get_full_name, width: 100,
        label: I18n.t('activerecord.models.data_import_season')
      },
      { name: :season__get_full_name,  width: 100,
        label: I18n.t('activerecord.models.season')
      },
      { name: :category_type__code, width: 80,
        label: I18n.t('activerecord.models.category_type')
      },
      { name: :entry_time_type__i18n_short, width: 80,
        label: I18n.t('activerecord.models.accreditation_time_type')
      }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
