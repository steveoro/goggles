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
    primary.item( :key_home,                    t('home'), '#' ) do |lev2_nav|
      lev2_nav.item( :key_main,                  t('main'),        root_path() )
      lev2_nav.item( :key_about,                 t('about'),       about_path() )
      lev2_nav.item( :key_contact_us,            t('contact_us'),  contact_us_path() )
      lev2_nav.item( :key_separator1_0,         content_tag(:span, '' ), class: 'divider', if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? } )
      lev2_nav.item( :key_user_radio_id,        t('radiography.id_card'), swimmer_radio_path( current_user.swimmer_id ), if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? } )
      lev2_nav.item( :key_social_index,         t('social.menu_social_index'), socials_show_all_path(), if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? } )
    end

    primary.item( :key_meetings,                t('meetings'), '#' ) do |lev2_nav|
      lev2_nav.item :key_meetings_index,        t('search_meetings'), meetings_path(), highlights_on: /meetings(?!\?prefilter|\/search)/ do |lev3_nav|
        lev3_nav.item :key_meeting_show_full,   t('show_details'), '#', highlights_on: %r(/meetings/\d/show_full)
      end
      lev2_nav.item :key_meetings_search_swimmer, t('meeting.search_by_swimmer'), meetings_search_swimmer_path(), highlights_on: %r(search_swimmer|prefilter_swimmer)
      lev2_nav.item :key_meetings_search_team,  t('meeting.search_by_team'), meetings_search_team_path(), highlights_on: %r(search_team|prefilter_team)
    end

    primary.item( :key_results_rankings,        t('results_and_rankings'), '#' ) do |lev2_nav|
      lev2_nav.item :key_rankings_index,        t('search_rankings'), rankings_path(), highlights_on: %r(/rankings) do |lev3_nav|
        lev3_nav.item :key_rankings_show_full,  t('show_details'), '#', highlights_on: %r(/rankings/\d/show_full)
      end
      lev2_nav.item :key_separator_rankings,    content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_results_index,         t('search_results'), results_path(), highlights_on: %r(/results) do |lev3_nav|
        lev3_nav.item :key_results_show_full,   t('show_details'), '#', highlights_on: %r(/results/\d/show_full)
      end
    end

    primary.item( :key_records,                 t('records.menu_root'), '#' ) do |lev2_nav|
      lev2_nav.item :key_records_everything,    t('records.menu_everything'),     records_for_everything_path()
      lev2_nav.item :key_records_season_type,   t('records.menu_by_season_type'), records_for_season_type_path()
      lev2_nav.item :key_records_swimmer,       t('records.menu_by_swimmer'),     records_for_swimmer_path()
      lev2_nav.item :key_records_team,          t('records.menu_by_team'),        records_for_team_path()
    end

    primary.item( :key_swimmers,                t('swimmers.swimmers'), '#' ) do |lev2_nav|
      lev2_nav.item :key_swimmers_index,        t('swimmers.search_swimmers'), swimmers_path(), highlights_on: %r(/swimmers) do |lev3_nav|
        lev3_nav.item :key_swimmers_id,         t('radiography.id_card'), '#', highlights_on: %r(/swimmers/\d/radio)
      end
    end

    primary.item( :key_misc,                    t('misc_main_menu.title'), '#' ) do |lev2_nav|
      lev2_nav.item :key_calendar,              t('meeting_calendar.navigation'),           meeting_calendars_path()
      lev2_nav.item :key_pools,                 t('swimming_pool.pools'),                   swimming_pools_path()
      lev2_nav.item :key_pool_reviews,          t('swimming_pool_review.navigation_title'), swimming_pool_reviews_path()
      lev2_nav.item :key_trainings,             t('misc_main_menu.trainings'),              trainings_path()
      lev2_nav.item :key_user_trainings,        t('misc_main_menu.user_trainings'),         user_trainings_path()
      lev2_nav.item :key_user_tr_stories,       t('misc_main_menu.user_training_stories'),  user_training_stories_path()
    end

    primary.item :key_separator0, '&nbsp;', '#', class: 'disabled'

    primary.item(
      :key_user_who_is_it,
      content_tag(:span, t('who_are_you') ), '#', class: 'disabled',
      :unless => Proc.new { user_signed_in? }
    )
    primary.item(
      :key_user_login,
      content_tag(:span, t(:login), class:"label label-important" ),
      new_user_session_path(),
      :unless => Proc.new { user_signed_in? }
    )
    primary.item(
      :key_user_edit,
      (current_user.nil? ? '' : current_user.name),
      edit_user_registration_path(),
      if: Proc.new { user_signed_in? }
    )
    primary.item(
      :key_user_logout,
      content_tag( :span, t('admin.misc.log_out'), class:"label label-important" ),
      destroy_user_session_path(),
      method: Devise.sign_out_via,
      if: Proc.new { user_signed_in? }
    )

    primary.item :key_separator2,     '&nbsp;', '#', class: 'disabled', if: Proc.new { admin_signed_in? }
    primary.item( :key_admin,         content_tag(:span, t('admin.back_to_admin'), class:"text-error" ), '#', if: Proc.new { admin_signed_in? }
    ) do |lev2_nav|
      lev2_nav.item :key_admin_index,        content_tag(:span, t('admin_index.title'), class:"text-error" ), goggles_admin_index_path()
      lev2_nav.item :key_separator21,        content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_admin_dashboard,    content_tag(:span, t('admin.actions.dashboard.menu'), class:"text-error" ), rails_admin_path()
      lev2_nav.item :key_admin_data_import,  content_tag(:span, t('admin_import.menu'), class:"text-error" ), goggles_di_step1_status_path()
      lev2_nav.item :key_admin_dj_mon,       content_tag(:span, 'DJ Monitor', class:"text-error" ), dj_mon_path()
      lev2_nav.item :key_separator22,        content_tag(:span, '' ), class: 'divider'
      lev2_nav.item :key_edit_admin,         (current_admin.nil? ? '?' : current_admin.email), '#', class: 'disabled'
    end

    primary.item :key_separator3,     '&nbsp;', '#', class: 'disabled'
    primary.item( :key_locale,         content_tag(:span, t('language') ), '#'
    ) do |lev2_nav|
      lev2_nav.item :key_locale_it,    image_tag('it.png'), url_for( request.filtered_parameters.dup.merge('locale'=>'it') )
      lev2_nav.item :key_locale_en,    image_tag('us.png'), url_for( request.filtered_parameters.dup.merge('locale'=>'en') )
    end

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    primary.dom_class = 'nav'

    # You can turn off auto highlighting for a specific level
    primary.auto_highlight = false
  end

end
