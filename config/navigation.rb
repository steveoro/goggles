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
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #
    primary.item :key_home,         t('home'),        root_path()
    primary.item :key_meetings,     t('meetings'),    meetings_path(), :highlights_on => %r(/meetings) do |sub_nav|
      sub_nav.item :key_meetings_show, t('show_details'), '#', :highlights_on => %r(/meetings\/\d)
    end
    primary.item :key_rankings,     t('rankings'),    rankings_path(), :highlights_on => %r(/rankings) do |sub_nav|
      sub_nav.item :key_rankings_show, t('show_details'), '#', :highlights_on => %r(/rankings\/\d)
    end
    primary.item :key_results,      t('results'),     results_path(), :highlights_on => %r(/results) do |sub_nav|
      sub_nav.item :key_results_show, t('show_details'), '#', :highlights_on => %r(/results\/\d)
    end

    primary.item :key_separator0,   '&nbsp;', '#', :class => 'disabled'
    primary.item :key_about,        t('about'),       about_path()
    primary.item :key_contact_us,   t('contact_us'),  contact_us_path()

    # Add an item which has a sub navigation (same params, but with block)
#    primary.item :key_2, 'name', url, options do |sub_nav|
      # Add an item to the sub navigation (same params again)
#      sub_nav.item :key_2_1, 'name', url, options
#    end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    primary.item :key_separator1,         '&nbsp;', '#', :class => 'disabled', :if => Proc.new { admin_signed_in? }
    primary.item :key_admin_dashboard,    content_tag( :p, t('admin.actions.dashboard.menu'), class:"text-error" ), rails_admin_path(), :class => 'special', :if => Proc.new { admin_signed_in? }
    primary.item :key_admin_data_import,  content_tag( :p, t('admin_import.menu'), class:"text-error" ), goggles_di_step1_status_path(), :class => 'special', :if => Proc.new { admin_signed_in? }
    primary.item :key_edit_admin,         content_tag( :p, (current_admin.nil? ? '' : current_admin.name), class:"text-error" ), rails_admin_path(), :if => Proc.new { admin_signed_in? }

    primary.item :key_separator2,         '&nbsp;', '#', :class => 'disabled', :if => Proc.new { user_signed_in? }

    primary.item :key_edit_user,          (current_user.nil? ? '' : current_user.email), edit_user_registration_path(), :if => Proc.new { user_signed_in? }
    primary.item :key_log_out,            content_tag( :span, t('admin.misc.log_out'), class:"label label-important" ), destroy_user_session_path(), :method => Devise.sign_out_via, :if => Proc.new { user_signed_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    primary.dom_class = 'nav'

    # You can turn off auto highlighting for a specific level
    primary.auto_highlight = false

  end

end
