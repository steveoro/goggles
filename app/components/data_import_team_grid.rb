#
# Specialized DataImportTeamGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportTeamGrid < EntityGrid

  model 'DataImportTeam'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_team'),
      scope_for_i18n: :team,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_team')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_team')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :name, width: 180, label: I18n.t('activerecord.attributes.team.name') },
        { name: :badge_number, width: 100, label: I18n.t('activerecord.attributes.team.zip') },

        { name: :data_import_city__name, width: 200,
          label: I18n.t('activerecord.models.data_import_city'),
          # [20121121] For the combo-boxes to have a working query after the 4th
          # char is entered in the edit widget, a Lambda statement must be used.
          # Using a pre-computed scope from the Model class prevents Netzke
          # (as of this version) to append the correct WHERE clause to the scope
          #`itself (while with an inline lambda, instead, it works).
          scope: ->(rel) { rel.order("name ASC") }
        },
        { name: :city__get_full_name, width: 200,
          label: I18n.t('activerecord.models.city'),
          scope: ->(rel) { rel.order("name ASC") }
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

      { name: :name, width: 180, label: I18n.t('activerecord.attributes.team.name') },
      { name: :badge_number, width: 100, label: I18n.t('activerecord.attributes.team.zip') },

      { name: :data_import_city__name, width: 200,
        label: I18n.t('activerecord.models.data_import_city')
      },
      { name: :city__get_full_name, width: 200, label: I18n.t('activerecord.models.city')
      }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
