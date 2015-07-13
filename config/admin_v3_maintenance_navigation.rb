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
      lev2_nav.item :key_admin_index,        content_tag(:span, t('admin_index.title') ), admin_v3_maintenance_path()
      lev2_nav.item :key_separator21,        content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_admin_dashboard,    content_tag(:span, t('admin.actions.dashboard.menu') ), rails_admin_path()
      lev2_nav.item :key_admin_data_import,  content_tag(:span, t('admin_import.menu') ), admin_v3_data_import_index_path()
      lev2_nav.item :key_admin_dj_mon,       content_tag(:span, 'DJ Monitor' ), dj_mon_path()
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
