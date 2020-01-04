require 'team_manager_validator'


=begin

= MeetingScheduleDAODecorator

  - version:  6.081
  - author:   Steve A.

  Decorator for the Meeting Schedule DAO.
  Contains all presentation-logic centered methods.

=end
class MeetingScheduleDAODecorator < Draper::Decorator
  #include Rails.application.routes.url_helpers
  delegate_all

  # Gets a (meeting) date in printable format
  def date_to_s( date = object.meeting_date )
    Format.a_date( date )
  end

  # Gets a string with meeting header containing id, name, date and code
  def get_meeting_header
    "#{object.meeting.id} - #{date_to_s} #{object.meeting.get_full_name} (#{object.meeting.code})"
  end

  # Gets a string with meeting header containing id, name, date and code
  def get_pool_header
    "'#{object.pool_name}' (#{object.lanes}x#{object.pool_type}), #{object.pool_address} #{object.city}"
  end





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
