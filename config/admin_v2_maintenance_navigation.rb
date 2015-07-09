# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  navigation.selected_class = 'active'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  navigation.active_leaf_class = 'active'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>if: Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>.
    #
    primary.item :key_separator1,             '&nbsp;', '#', class: 'disabled', if: Proc.new { admin_signed_in? }
    primary.item( :key_sections,              content_tag(:span, t('admin_index.sections') ), '#', if: Proc.new { admin_signed_in? }
    ) do |lev2_nav|
      lev2_nav.item :key_admin_index,         content_tag(:span, t('admin_index.title') ), admin_v2_maintenance_path()
      lev2_nav.item :key_separator21,         content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_admin_dashboard,     content_tag(:span, t('admin.actions.dashboard.menu') ), rails_admin_path()
      lev2_nav.item :key_admin_data_import,   content_tag(:span, t('admin_import.menu') ), admin_v2_di_step1_status_path()
      lev2_nav.item :key_admin_dj_mon,        content_tag(:span, 'DJ Monitor' ), dj_mon_path()
    end

    primary.item( :key_commands,              content_tag(:span, t('admin_index.commands') ), '#', if: Proc.new { admin_signed_in? }
    ) do |lev2_nav|
      lev2_nav.item :key_admin_db_structure,  content_tag(:span, t('admin_index.db_structure') ), admin_v2_db_structure_path()
      lev2_nav.item :key_separator21,         content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_admin_delete_meeting,content_tag(:span, t('admin_index.delete_whole_meeting') ), admin_v2_select_meeting_path()
      lev2_nav.item :key_admin_merge_teams,   content_tag(:span, t('admin_index.merge_teams') ), admin_v2_select_teams_path()
      lev2_nav.item :key_separator22,         content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_admin_run_rake,      content_tag(:span, t('admin_index.execute_rake_command') ),   admin_v2_run_rake_path()
      lev2_nav.item :key_admin_run_bundle,    content_tag(:span, t('admin_index.execute_bundle_command') ), admin_v2_run_bundle_path()
      lev2_nav.item :key_admin_run_sudo,      content_tag(:span, t('admin_index.execute_sudo_command'), class:"text-error" ), admin_v2_run_sudo_command_path()
      lev2_nav.item :key_separator23,         content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_admin_run_upgrade,   content_tag(:span, t('admin_index.execute_source_upgrade') ), admin_v2_run_src_upgrade_path()
      lev2_nav.item :key_admin_restart_apache,content_tag(:span, t('admin_index.restart_apache') ), admin_v2_restart_apache_path()
    end

    primary.item :key_updownload,             t('admin_index.up_download'), '#' do |lev2_nav|
      lev2_nav.item :key_upload_db_dump,      t('admin_index.upload_db_dump'), admin_v2_upload_db_dump_path()
      lev2_nav.item :key_upload_db_seed,      t('admin_index.upload_db_seed'), admin_v2_upload_db_seed_path()
      lev2_nav.item :key_separator21,         content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_download_db,         t('admin_index.download_db_dump'), admin_v2_download_db_dump_path()
      lev2_nav.item :key_download_teams,      t('admin_index.download_team_dump'), admin_v2_download_team_dump_path()
      lev2_nav.item :key_download_swimmers,   t('admin_index.download_swimmer_dump'), admin_v2_download_swimmer_dump_path()
      lev2_nav.item :key_download_users,      t('admin_index.download_user_dump'), admin_v2_download_user_dump_path()
      lev2_nav.item :key_separator21,         content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_cleanup_output,      t('admin_index.cleanup_output_dir'), admin_v2_cleanup_output_dir_path()
    end

    primary.item :key_separator3,     '&nbsp;', '#', class: 'disabled', if: Proc.new { admin_signed_in? }
    primary.item :key_home,           t('home'), root_path() #, options

    primary.item :key_separator4,     '&nbsp;', '#', class: 'disabled', if: Proc.new { admin_signed_in? }
    primary.item :key_edit_admin,     (current_admin.nil? ? '' : current_admin.name), rails_admin_path(), if: Proc.new { admin_signed_in? }
    primary.item :key_log_out,        content_tag( :span, t('admin.misc.log_out'), class:"label label-important" ), destroy_admin_session_path(), method: Devise.sign_out_via, if: Proc.new { admin_signed_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    primary.dom_class = 'nav'

    # You can turn off auto highlighting for a specific level
    primary.auto_highlight = false

  end

end
