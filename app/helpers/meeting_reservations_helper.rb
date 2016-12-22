#
# == MeetingReservationsHelper
#
# Assorted helpers for clickable links rendering.
#
# @author   Steve A.
# @version  6.032
#
module MeetingReservationsHelper

  # Returns the HTML for the MeetingReservationsController#printout_event_sheet()
  # action for the specified Meeting instance.
  #
  # Assumes meeting is a valid Meeting instance.
  #
  def link_to_event_sheet_printout( current_user, meeting )
    if TeamManagerValidator.any_reservations_for?( current_user, meeting )
      link_to( meeting_reservations_printout_event_sheet_path(id: meeting.id), class: 'btn btn-default' ) do
        image_tag('page_white_acrobat.png') << I18n.t('meeting_reservation.event_sheet_pdf').html_safe
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
