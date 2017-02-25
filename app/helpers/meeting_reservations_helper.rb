require 'team_manager_validator'
require 'reservations_csi_2_csv'


#
# == MeetingReservationsHelper
#
# Assorted helpers for clickable links rendering.
#
# @author   Steve A.
# @version  6.084
#
module MeetingReservationsHelper

  # Returns the HTML for the MeetingReservationsController#printout_event_sheet()
  # action for the specified Meeting instance.
  #
  # Assumes meeting is a valid Meeting instance.
  #
  def link_to_event_sheet_printout( current_user, meeting )
    if TeamManagerValidator.any_reservations_for?( current_user, meeting )
      link_to(
        meeting_reservations_printout_event_sheet_path(id: meeting.id),
        class: 'btn btn-default',
        'data-toggle' => 'tooltip', 'title' => I18n.t('meeting_reservation.event_sheet_pdf_tooltip')
      ) do
        image_tag('page_white_acrobat.png') << I18n.t('meeting_reservation.event_sheet_pdf').html_safe
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the HTML for the MeetingReservationsController#export_csi_csv()
  # action for the specified Meeting instance.
  #
  # Assumes meeting is a valid Meeting instance belonging to the CSI championship.
  #
  def link_to_reservation_csv_data_export( current_user, meeting )
    if (
         ReservationsCsi2Csv.is_a_csi_meeting( meeting ) &&
         TeamManagerValidator.can_manage?( current_user, meeting ) &&
         TeamManagerValidator.any_reservations_for?( current_user, meeting )
       )
      link_to(
        meeting_reservations_export_csi_csv_path(id: meeting.id),
        class: 'btn btn-default',
        'data-toggle' => 'tooltip', 'title' => I18n.t('meeting_reservation.export_csi_csv_button_tooltip')
      ) do
        image_tag('page_white_excel.png') << I18n.t('meeting_reservation.export_csi_csv_button_title').html_safe
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
