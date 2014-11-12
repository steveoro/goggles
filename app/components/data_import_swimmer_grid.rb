#
# Specialized DataImportSwimmerGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportSwimmerGrid < EntityGrid

  model 'DataImportSwimmer'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_swimmer'),
      scope_for_i18n: :swimmer,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_swimmer')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_swimmer')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :complete_name, width: 160,
          label: I18n.t('activerecord.attributes.swimmer.complete_name')
        },
        { name: :last_name, width: 100,
          label: I18n.t('activerecord.attributes.swimmer.last_name')
        },
        { name: :first_name, width: 100,
          label: I18n.t('activerecord.attributes.swimmer.first_name')
        },
        { name: :year_of_birth, width: 40,
          label: I18n.t('activerecord.attributes.swimmer.year_of_birth')
        },
        { name: :gender_type__i18n_short, width: 110,
          label: I18n.t('activerecord.attributes.swimmer.gender_type'),
          # [20121121] For the combo-boxes to have a working query after the 4th
          # char is entered in the edit widget, a Lambda statement must be used.
          # Using a pre-computed scope from the Model class prevents Netzke
          # (as of this version) to append the correct WHERE clause to the scope
          #`itself (while with an inline lambda, instead, it works).
          scope: ->(rel) { rel.order("code ASC") }
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

      { name: :complete_name, width: 160,
        label: I18n.t('activerecord.attributes.swimmer.complete_name')
      },
      { name: :last_name, width: 100,
        label: I18n.t('activerecord.attributes.swimmer.last_name')
      },
      { name: :first_name, width: 100,
        label: I18n.t('activerecord.attributes.swimmer.first_name')
      },
      { name: :year_of_birth, width: 40,
        label: I18n.t('activerecord.attributes.swimmer.year_of_birth')
      },
      { name: :gender_type__i18n_short, width: 110,
        label: I18n.t('activerecord.attributes.swimmer.gender_type')
      }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
