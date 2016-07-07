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
      lev2_nav.item( :key_main,                 t('main'),        root_path() )
      lev2_nav.item( :key_about,                t('about'),       about_path() )
      lev2_nav.item( :key_contact_us,           t('contact_us'),  contact_us_path() )
      lev2_nav.item( :key_separator1_0,         content_tag(:span, ''), class: 'divider', if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? } )
      lev2_nav.item(
        :key_user_radio_id,
        t('radiography.id_card'),
        Proc.new { current_user.nil? ? '' : swimmer_radio_path(id: current_user.swimmer_id) },
        if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? }
      )
      lev2_nav.item(
        :key_social_index,
        t('social.menu_social_index'),
        socials_show_all_path(),
        if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? }
      )
    end

    primary.item( :key_meetings,                t('meetings'), '#' ) do |lev2_nav|
      lev2_nav.item :key_meetings_current,      t('meeting.current_menu'), meetings_current_path(), highlights_on: /current/ do |lev3_nav|
        lev3_nav.item :key_meeting_show_full,   t('show_details'), '#', highlights_on: %r(/meetings/\d/show_full)
      end
      lev2_nav.item( :key_separator2_0,         content_tag(:span, ''), class: 'divider' )
      lev2_nav.item( :key_meetings_simple,      t('meeting.simple_menu'), meetings_simple_search_path(), highlights_on: %r(simple_search) )
      lev2_nav.item( :key_meetings_custom,      t('meeting.index_menu'), meetings_custom_search_path(), highlights_on: %r(custom_search) )
    end

    primary.item( :key_championships,                    t('championships.title'), '#' ) do |lev2_nav|
      lev2_nav.item :key_championships_supermaster_fin,  t('championships.supermaster_fin'), championships_calendar_supermaster_fin_path
      lev2_nav.item :key_championships_regional_er_uisp, t('championships.regional_er_uisp'), championships_calendar_regional_er_uisp_path
      lev2_nav.item :key_championships_regional_er_csi,  t('championships.regional_er_csi'), championships_calendar_regional_er_csi_path
    end

    primary.item( :key_records,                 t('records.menu_root'), '#' ) do |lev2_nav|
      lev2_nav.item :key_records_season_type,   t('records.menu_by_season_type'), records_for_season_type_path()
      lev2_nav.item :key_records_team,          t('records.menu_by_team'),        records_for_team_path()
      lev2_nav.item :key_records_swimmer,       t('records.menu_by_swimmer'),     records_for_swimmer_path()
    end

    primary.item( :key_swimmers,                t('swimmers.swimmers'), '#' ) do |lev2_nav|
      lev2_nav.item :key_swimmers_index,        t('swimmers.search_swimmers'), swimmers_path(), highlights_on: %r(/swimmers) do |lev3_nav|
        lev3_nav.item :key_swimmers_id,         t('radiography.id_card'), '#', highlights_on: %r(/swimmers/\d/radio)
      end
    end

    primary.item( :key_teams,                   t('team.title'), '#' ) do |lev2_nav|
      lev2_nav.item :key_teams_index,           t('team.search_title'), teams_path(), highlights_on: %r(/teams) do |lev3_nav|
        lev3_nav.item :key_teams_id,            t('radiography.id_card'), '#', highlights_on: %r(/teams/\d/radio)
      end
    end

    primary.item( :key_misc,                    t('misc_main_menu.title'), '#' ) do |lev2_nav|
      lev2_nav.item :key_pools,                 t('swimming_pool.pools'),                   swimming_pools_path()
      lev2_nav.item :key_pool_reviews,          t('swimming_pool_review.navigation_title'), swimming_pool_reviews_path()
      lev2_nav.item :key_separator4_0,          content_tag(:span, ''), class: 'divider'
      lev2_nav.item :key_fin_score_calc,        t('misc.fin_score_calculation'),            misc_fin_score_calculation_path()
      lev2_nav.item :key_fin_timing_calc,       t('misc.fin_timing_calculation'),           misc_fin_timing_calculation_path()
      lev2_nav.item :key_swimmer_matches,       t('misc.swimmer_matches'),                  misc_swimmer_matches_path()
      lev2_nav.item :key_separator4_1,          content_tag(:span, ''), class: 'divider'
      lev2_nav.item :key_trainings,             t('misc_main_menu.trainings'),              trainings_path()
      lev2_nav.item :key_user_trainings,        t('misc_main_menu.user_trainings'),         user_trainings_path()
      lev2_nav.item :key_user_tr_stories,       t('misc_main_menu.user_training_stories'),  user_training_stories_path()
      lev2_nav.item :key_separator4_2,          content_tag(:span, ''), class: 'divider'
      lev2_nav.item :key_tutorial,              t('tutorials_title'),                       tutorials_path()
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

    primary.item :key_separator3,     '&nbsp;', '#', class: 'disabled'
    primary.item( :key_locale,         content_tag(:span, image_tag('it.png') +"/"+ image_tag('us.png') ), '#'
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
