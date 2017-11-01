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

    primary.item( :key_locale, content_tag(:span, image_tag('it.png') +"/"+ image_tag('us.png') ), '#', 'data-turbolinks'=>'false' ) do |lev2_nav|
      lev2_nav.item :key_locale_it,    image_tag('it.png'), url_for( request.filtered_parameters.dup.merge('locale'=>'it') )
      lev2_nav.item :key_locale_en,    image_tag('us.png'), url_for( request.filtered_parameters.dup.merge('locale'=>'en') )
    end
    primary.item( :key_separator0_0, '<hr/>', '#', class: 'disabled', 'data-turbolinks'=>'false' )

    primary.item(
      :key_user_who_is_it,
      content_tag(:span, t('who_are_you') ), '#', class: 'disabled', 'data-turbolinks'=>'false',
      :unless => Proc.new { user_signed_in? }
    )
    primary.item(
      :key_user_login,
      content_tag(:span, t(:login), class:"btn btn-default" ),
      new_user_session_path(),
      :unless => Proc.new { user_signed_in? }
    )

    primary.item(
      :key_user_edit,
      ( current_user.nil? ? '' : "#{ current_user.name } &nbsp; #{ image_tag('customize-01-128.png', class: 'img-circle', style: "width: 25px;")}".html_safe ),
      edit_user_registration_path(),
      if: Proc.new { user_signed_in? }
    )
    primary.item(
      :key_social_index,
      t('social.menu_social_index'),
      socials_show_all_path(),
      if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? }
    )
    primary.item(
      :key_user_logout,
      content_tag( :span, t('admin.misc.log_out'), class:"btn btn-default" ),
      destroy_user_session_path(),
      method: Devise.sign_out_via,
      if: Proc.new { user_signed_in? }
    )
    primary.item( :key_separator0_1, '<hr/>', '#', class: 'disabled', 'data-turbolinks'=>'false', if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? } )

#    primary.item( :key_main,         t('main'),        root_path() )
    primary.item( :key_about,        t('about'),       home_about_path() )
    primary.item( :key_contact_us,   t('contact_us'),  home_contact_us_path() )
    primary.item( :key_separator0_2, '<hr/>', '#', class: 'disabled', 'data-turbolinks'=>'false' )
    primary.item(
      :key_user_radio_id,
      "#{ t('radiography.id_card') } &nbsp; #{ image_tag('img_radiography.jpg', class: 'img-circle', style: "width: 25px;")}".html_safe,
      Proc.new { current_user.nil? ? '' : swimmer_radio_path(id: current_user.swimmer_id) },
      if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? }
    )
    primary.item(
      :key_meetings_my,
      "#{ t('meeting.my.menu_title') } &nbsp; #{ image_tag('shape-star2b-128.png', class: 'img-circle', style: "width: 25px;")}".html_safe,
      Proc.new { current_user.nil? ? '' : meetings_my_path() },
      if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? },
      highlights_on: /my/
    )
    primary.item( :key_meetings_current, t('meeting.current_menu'), meetings_current_path(), highlights_on: /current/ )
    primary.item(
      :key_starred_meetings,
      "#{ t('tags.starred_meetings.menu') } &nbsp; #{ image_tag('thumbs-up-128.png', class: 'img-circle', style: "width: 25px;")}".html_safe,
      taggings_starred_meetings_path(),
      if: Proc.new { user_signed_in? && current_user && TeamManager.where(user_id: current_user.id).count > 0 },
      highlights_on: /starred_meetings/
    )

    primary.item( :key_championships,                    t('championships.title'), '#', 'data-turbolinks'=>'false' ) do |lev2_nav|
      lev2_nav.item :key_championships_supermaster_fin,  t('championships.supermaster_fin'), championships_calendar_supermaster_fin_path
      lev2_nav.item :key_championships_regional_er_uisp, t('championships.regional_er_uisp'), championships_calendar_regional_er_uisp_path
      lev2_nav.item :key_championships_regional_er_csi,  t('championships.regional_er_csi'), championships_calendar_regional_er_csi_path
    end
    primary.item( :key_separator0_3, '<hr/>', '#', class: 'disabled', 'data-turbolinks'=>'false', if: Proc.new { user_signed_in? && current_user && current_user.has_associated_swimmer? } )

# [Steve, 201701] Stuff removed due to synch problems w/ serialized records table:
#    primary.item( :key_records,               t('records.menu_root'), '#', 'data-turbolinks'=>'false' ) do |lev2_nav|
#      lev2_nav.item :key_records_season_type, t('records.menu_by_season_type'), records_for_season_type_path()
#      lev2_nav.item :key_records_team,        t('records.menu_by_team'),        records_for_team_path()
#      lev2_nav.item :key_records_swimmer,     t('records.menu_by_swimmer'),     records_for_swimmer_path()
#    end
#    primary.item( :key_separator0_4, '<hr/>', '#', class: 'disabled', 'data-turbolinks'=>'false' )

    primary.item( :key_misc,                   t('misc_main_menu.title'), '#', 'data-turbolinks'=>'false' ) do |lev2_nav|
      lev2_nav.item( :key_tutorial,            t('tutorials_title'),                       tutorials_index_path() )
      lev2_nav.item( :key_separator4_0,        content_tag(:span, ''), class: 'divider' )
      lev2_nav.item( :key_pools,               t('swimming_pool.pools'),                   swimming_pools_path() )
      lev2_nav.item( :key_pool_reviews,        t('swimming_pool_review.navigation_title'), swimming_pool_reviews_path() )
      lev2_nav.item( :key_separator4_1,        content_tag(:span, ''), class: 'divider' )
      lev2_nav.item( :key_fin_score_calc,      t('misc.fin_score_calculation'),            misc_fin_score_calculation_path() )
      lev2_nav.item( :key_fin_timing_calc,     t('misc.fin_timing_calculation'),           misc_fin_timing_calculation_path() )
      lev2_nav.item( :key_swimmer_matches,     t('misc.swimmer_matches'),                  misc_swimmer_matches_path() )
      lev2_nav.item( :key_separator4_2,        content_tag(:span, ''), class: 'divider' )
      lev2_nav.item( :key_training_paces_2000, t('misc.training_paces_2000'),              misc_training_paces_2000_path() )
    end
    primary.item( :key_misc_complicated,       t('general.complicated_stuff'), '#', 'data-turbolinks'=>'false' ) do |lev2_nav|
      lev2_nav.item( :key_search_meetings,     t('meeting.search_meeting'), meetings_custom_search_path(), highlights_on: %r(custom_search) )
      lev2_nav.item( :key_search_swimmers,     t('swimmers.search_swimmers'), swimmers_path(), highlights_on: %r(/swimmers) )
      lev2_nav.item( :key_search_teams,        t('team.search_title'), teams_path(), highlights_on: %r(/teams) )
      lev2_nav.item( :key_separator4_2,        content_tag(:span, ''), class: 'divider' )
      lev2_nav.item( :key_trainings,           t('misc_main_menu.trainings'),              trainings_path() )
      lev2_nav.item( :key_user_trainings,      t('misc_main_menu.user_trainings'),         user_trainings_path() )
      lev2_nav.item( :key_user_tr_stories,     t('misc_main_menu.user_training_stories'),  user_training_stories_path() )
    end

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    primary.dom_class = 'nav navmenu-nav'

    # You can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end

end
