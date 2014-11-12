#
# Specialized DataImportCityGrid component implementation
#
# - author: Steve A.
# - vers. : 4.00.611
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportCityGrid < EntityGrid

  model 'DataImportCity'
  #-- -------------------------------------------------------------------------
  #++


  def configuration
    super.merge(
      prevent_header: true,
      persistence: true,

      title: I18n.t('activerecord.models.data_import_city'),
      scope_for_i18n: :city,
      add_form_window_config: { width: 500, title: "#{I18n.t(:add)} #{I18n.t('activerecord.models.data_import_city')}" },
      edit_form_window_config: { width: 500, title: "#{I18n.t(:edit)} #{I18n.t('activerecord.models.data_import_city')}" },

      scope: [ "data_import_session_id = ?", super[:data_import_session_id] ],
      columns: [
        { name: :get_verbose_conflicting_row, width: 50,
          label: I18n.t('admin_import.conflicting_row')
        },
        { name: :import_text, flex: 1, summary_type: :count, label: I18n.t('admin_import.import_text') },

        { name: :name, width: 160, label: I18n.t('activerecord.attributes.city.name') },
        { name: :zip, width: 80, label: I18n.t('activerecord.attributes.city.zip') },
        { name: :area, width: 100, label: I18n.t('activerecord.attributes.city.area') },
        { name: :country, width: 100, label: I18n.t('activerecord.attributes.city.country') },
        { name: :country_code, width: 40, label: I18n.t('activerecord.attributes.city.country_code') }
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

      { name: :name, width: 160, label: I18n.t('activerecord.attributes.city.name') },
      { name: :zip, width: 80, label: I18n.t('activerecord.attributes.city.zip') },
      { name: :area, width: 100, label: I18n.t('activerecord.attributes.city.area') },
      { name: :country, width: 100, label: I18n.t('activerecord.attributes.city.country') },
      { name: :country_code, width: 40, label: I18n.t('activerecord.attributes.city.country_code') }
    ]
  end
  #-- -------------------------------------------------------------------------
  #++
end
