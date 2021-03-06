require 'team_manager_validator'


=begin

= MeetingDecorator

  - version:  6.081
  - author:   Steve A.

  Decorator for the Meeting model.
  Contains all presentation-logic centered methods.

=end
class MeetingDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all


  # Returns a specific string to be used as a CSS class for this
  # meeting, according to the associated season type.
  #
  # Returns an empty string when not defined.
  #
  def get_css_class_for_season_type
    if object.season_type && object.season_type.code =~ /CSI/i
      'goggles-meeting-csi'
    elsif object.season_type && object.season_type.code =~ /FIN/i
      'goggles-meeting-fin'
    else
      ''
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns an image_tag for this meeting, according to the associated season type.
  # Returns an empty string when not defined.
  #
  def get_logo_for_season_type
    if object.season_type && object.season_type.code =~ /CSI/i
      h.image_tag( 'logo_csi.png', size: '25x16' )
    elsif object.season_type && object.season_type.code =~ /FIN/i
      h.image_tag( 'logo_fin.png', size: '40x16' )
    elsif object.season_type && object.season_type.code =~ /UISP/i
      h.image_tag( 'logo_uisp.png', size: '40x16' )
    elsif object.season
      object.season.get_season_type
    else
      ''
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves the meeting description
  # with link to meeting result show full
  #
  def get_linked_full_name
    h.link_to( get_full_name, meeting_show_full_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.show_results_tooltip') } )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves the meeting description
  # with link to meeting result show full
  #
  def get_linked_full_name_with_logo
    h.link_to( get_logo_for_season_type + ' ' + get_full_name, meeting_show_full_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.show_results_tooltip') } )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves the meeting short description
  # with link to meeting result show full
  #
  def get_linked_short_name
    h.link_to( get_short_name, meeting_show_full_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.show_results_tooltip') } )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves the meeting shortest description
  # with link to meeting result show full
  #
  def get_linked_city_with_date
    h.link_to( "#{get_city} (#{get_meeting_date})", meeting_show_full_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.show_results_tooltip') } )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves the meeting description
  # with link to meeting result show full
  #
  def get_linked_full_name_with_date
    h.link_to( "#{get_full_name} (#{get_meeting_date})", meeting_show_full_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.show_results_tooltip') } )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves the meeting description
  # with link to meeting result show full
  #
  def get_linked_custom_name( name )
    h.link_to( "#{name}", meeting_show_full_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.show_results_tooltip') } )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves the meeting description
  # with link to meeting result show full
  # If results are aquired the link should be to results
  # Else if the invititation is present the link should be to invitation
  # Otherwise returns the true name
  #
  def get_linked_name( name_method = :get_short_name )
    if are_results_acquired
      linked_name = h.link_to(
        object.send(name_method),
        meeting_show_full_path(id: object.id),
        { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.show_results_tooltip') }
      )
    elsif has_start_list
      linked_name = h.link_to(
        object.send(name_method),
        meeting_show_start_list_path(id: object.id),
        { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.start_list_tooltip') }
      )
    elsif is_cancelled?
      linked_name = h.content_tag( :s, object.send(name_method) )
    elsif invitation
      linked_name = h.link_to(
        object.send(name_method),
        meeting_show_invitation_path(id: object.id),
        { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.manifest_tooltip') }
      )
    else
      linked_name = object.send(name_method)
    end
    linked_name.html_safe
  end
  #-- -------------------------------------------------------------------------
  #++

  # Builds-up the HTML for the 'manage meeting reservation' button link.
  # Returns an empty string if the current_user is not allowed to manage (edit or
  # update, either one or all the reservations of) the meeting.
  #
  # The button will be rendered if any reservations are existing for the current_user,
  # even if th user is not a team-manager.
  #
  # Note that with the current version, the button is NO LONGER rendered  when
  # the meeting is already closed, even if the current_user has already created
  # some reservations.
  # (To reach the reservations management page, which will result as read-only,
  # the user has to click to the meeting name to reach the "reservations" tab,)
  #
  def manage_reservation_button( current_user )
    if ( TeamManagerValidator.is_reservation_manageable?( object ) &&
         ( TeamManagerValidator.can_manage?( current_user, object )  || 
           TeamManagerValidator.any_reservations_for?( current_user, object )))
      h.link_to(
        I18n.t('meeting_reservation.manage_button_title'),
        meeting_reservations_edit_events_path(id: object.id),
        { class: 'btn btn-default btn-xs', 'data-toggle'=>'tooltip',
          'title'=>I18n.t('meeting_reservation.manage_meeting_tooltip') }
      )
    else
      ''
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  def manage_reservation_button_tm( current_user, can_manage )
    if ( TeamManagerValidator.is_reservation_manageable?( object ) &&
         ( can_manage || TeamManagerValidator.any_reservations_for?( current_user, object )) )
      h.link_to(
        I18n.t('meeting_reservation.manage_button_title'),
        meeting_reservations_edit_events_path(id: object.id),
        { class: 'btn btn-default btn-xs', 'data-toggle'=>'tooltip',
          'title'=>I18n.t('meeting_reservation.manage_meeting_tooltip') }
      )
    else
      ''
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Computes a short session warm-up schedule in html mode
  # using a new line for each session
  #
  def get_session_warm_up_times
    object.get_session_warm_up_times('<br/><br/>').html_safe
  end
  # ----------------------------------------------------------------------------

  # Computes a short session begin schedule in html mode
  # using a new line for each session
  #
  def get_session_begin_times
    object.get_session_begin_times('<br/><br/>').html_safe
  end
  # ----------------------------------------------------------------------------

  # Computes a short session event program in html mode
  # using a new line for each session
  #
  def get_complete_events
    #object.get_complete_events.split("\r\n").map{ |e| content_tag(:p, e) }.join().html_safe
    object.get_complete_events.split("\r\n").join('<br/><br/>').html_safe
  end
  # ----------------------------------------------------------------------------

  # Computes a description of the swimming pool
  # with a link to the swimming pool page
  #
  def get_linked_swimming_pool( name_method = :get_verbose_name )
    object.get_swimming_pool ? object.get_swimming_pool.decorate.get_linked_name( name_method ) : '?'
  end
  # ----------------------------------------------------------------------------
end
