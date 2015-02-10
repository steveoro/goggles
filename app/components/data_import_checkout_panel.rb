#
# Main panel for Data Import checkout/management. Includes several data_import_XXX_grid
# components in a tabbed view.
#
# - author: Steve A.
# - vers. : 4.00.747
#
# == Params
#
# :+session_id+ must be set during component configuration and must point to the current Data Import Session ID
#
class DataImportCheckoutPanel < Netzke::Basepack::TabPanel

  action :row_counter,  text: I18n.t(:click_on_the_grid), disabled: true
  # ---------------------------------------------------------------------------

  action :commit_rows,  text: I18n.t(:commit_rows),
                        tooltip: I18n.t(:commit_rows_tooltip),
                        icon: "/images/icons/database_save.png"
  # ---------------------------------------------------------------------------

  js_properties(
    prevent_header: true,
    header: false,
    border: true,
    active_tab:  0
  )


  # Override for default bottom bar:
  #
  def default_bbar
    [
     :commit_rows.action,
     "-",                                           # Adds a separator
     :row_counter.action
    ]
  end

  # ---------------------------------------------------------------------------


  def configuration
    # ASSERT: assuming current_user is always set for this grid component:
    super.merge(
      min_width: 750,
      min_height: 600,
      items: [
        # [Steve] Dynamic Season creation is currently disabled/not-allowed
        # {
          # class_name: "DataImportSeasonGrid",
          # enable_pagination: true,
          # # [Steve, 20120914] It seems that the LIMIT parameter used during column sort can't be toggled off even when pagination is false, so we put an arbitrary 10Tera row count limit per page to get all the rows:
          # rows_per_page: 1000000000000,
          # data_import_session_id: super[:data_import_session_id]
        # },
        {
          class_name: "DataImportMeetingGrid",
#          title: I18n.t('activerecord.models.data_import_meeting'),
          enable_pagination: true,
          # [Steve, 20120914] It seems that the LIMIT parameter used during column sort can't be toggled off even when pagination is false, so we put an arbitrary 10Tera row count limit per page to get all the rows:
          rows_per_page: 25,
          data_import_session_id: super[:data_import_session_id]
        },
        {
          class_name: "DataImportMeetingSessionGrid",
          title: I18n.t('activerecord.models.data_import_meeting_session'),
          enable_pagination: true,
          rows_per_page: 25,
          data_import_session_id: super[:data_import_session_id],
          lazy_loading: true
        },
        {
          class_name: "DataImportMeetingProgramGrid",
          title: I18n.t('activerecord.models.data_import_meeting_program'),
          enable_pagination: true,
          rows_per_page: 25,
          data_import_session_id: super[:data_import_session_id],
          meeting_id: super[:meeting_id],
          lazy_loading: true
        },
        {
          class_name: "DataImportMeetingEntryGrid",
          title: I18n.t('activerecord.models.data_import_meeting_entry'),
          enable_pagination: true,
          rows_per_page: 25,
          data_import_session_id: super[:data_import_session_id],
          lazy_loading: true
        },
        {
          class_name: "DataImportMeetingIndividualResultGrid",
          title: I18n.t('activerecord.models.data_import_meeting_individual_result'),
          enable_pagination: true,
          rows_per_page: 25,
          data_import_session_id: super[:data_import_session_id],
          lazy_loading: true
        },

        {
          class_name: "DataImportMeetingRelayResultGrid",
          title: I18n.t('activerecord.models.data_import_meeting_relay_result'),
          enable_pagination: true,
          rows_per_page: 1000000000000,
          data_import_session_id: super[:data_import_session_id],
          lazy_loading: true
        },

        {
          class_name: "DataImportMeetingTeamScoreGrid",
          title: I18n.t('activerecord.models.data_import_meeting_team_score'),
          enable_pagination: true,
          rows_per_page: 1000000000000,
          data_import_session_id: super[:data_import_session_id],
          lazy_loading: true
        },

        {
          class_name: "DataImportSwimmerGrid",
          title: I18n.t('activerecord.models.data_import_swimmer'),
          enable_pagination: true,
          rows_per_page: 25,
          data_import_session_id: super[:data_import_session_id],
          lazy_loading: true
        },
        {
          class_name: "DataImportCityGrid",
          title: I18n.t('activerecord.models.data_import_city'),
          enable_pagination: true,
          rows_per_page: 1000000000000,
          data_import_session_id: super[:data_import_session_id],
          lazy_loading: true
        },
        {
          class_name: "DataImportTeamGrid",
          title: I18n.t('activerecord.models.data_import_team'),
          enable_pagination: true,
          rows_per_page: 1000000000000,
          data_import_session_id: super[:data_import_session_id],
          lazy_loading: true
        },
        {
          class_name: "DataImportBadgeGrid",
          title: I18n.t('activerecord.models.data_import_badge'),
          enable_pagination: true,
          rows_per_page: 25,
          data_import_session_id: super[:data_import_session_id],
          lazy_loading: true
        }
      ]
    )
  end

  # ---------------------------------------------------------------------------


  js_method :init_component, <<-JS
    function() {
      #{js_full_class_name}.superclass.initComponent.call(this);
    }
  JS

  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------

  # Front-end JS event handler for the action 'commit_rows'
  #
  js_method :on_commit_rows, <<-JS
    function() {
      Ext.MessageBox.confirm( this.i18n.confirmation, this.i18n.areYouSure,
        function(btn) {
          if (btn == 'yes') {
            this.invokePostOnHiddenForm( 'frmPostImportData', 'data' );
          }
        },
        this
      );
    }
  JS
  # ---------------------------------------------------------------------------


  # Invokes a controller path sending in all the (encoded) IDs currently available on
  # the data store.
  #
  js_method :invoke_post_on_hidden_form, <<-JS
    function( formId, dataFieldId ) {
      var gridStore = this.getStore();
      var rowArray = new Array();
      gridStore.each(
        function( record ) {
          rowArray.push( record.data.id );
        },
        this
      );
                                                    // If there is data, process it:
      if ( rowArray.length > 0 ) {
        var encodedData = Ext.JSON.encode( rowArray );
        var form = Ext.get( formId );
        var hiddenField = Ext.get( dataFieldId );
        hiddenField.dom.value = encodedData;
        form.dom.submit();
      }
      else {
        this.netzkeFeedback( "#{I18n.t(:warning_no_data_to_send)}" );
      }
    }
  JS
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------
end
