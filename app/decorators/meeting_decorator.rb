=begin

= MeetingDecorator

  - version:  4.00.419
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
      h.image_tag( 'logo_csi.png', size: '20x16' )
    elsif object.season_type && object.season_type.code =~ /FIN/i
      h.image_tag( 'logo_fin.png', size: '40x16' )
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
  def get_linked_short_name
    h.link_to( get_short_name + ' (' + get_scheduled_date + ')', meeting_show_full_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.show_results_tooltip') } )
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
  # If results are aquired the link should be to results
  # Else if the invititation is present the link should be to invitation
  # Otherwise returns the true name
  #
  def get_linked_name
    if are_results_acquired
      linked_name = h.link_to( get_short_name, meeting_show_full_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.show_results_tooltip') } )
    else
      if has_start_list
          linked_name = h.link_to( get_short_name, meeting_show_start_list_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.start_list_tooltip') } )
      else
        if invitation
          linked_name = h.link_to( get_short_name, meeting_show_invitation_path(id: object.id), { 'data-toggle'=>'tooltip', 'title'=>I18n.t('meeting.manifest_tooltip') } )
        else
          linked_name = get_short_name
        end 
      end
    end    
    linked_name
  end
  #-- -------------------------------------------------------------------------
  #++
end
