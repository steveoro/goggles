require 'team_manager_validator'
require 'reservations_csi_2_csv'
require 'reservations_fin_2_csv_matrix'


#
# == MeetingReservationsHelper
#
# Assorted helpers for clickable links rendering.
#
# @author   Steve A.
# @version  6.353
#
module MeetingReservationsHelper

  # Returns either a new *badge* reservation instance or an existing one when found
  # (according to the parameters).
  #
  # Assumes all parameters are valid instances of the respective classes.
  # (Returns a new empty instance in case of invalid parameters)
  #
  def find_or_new_badge_reservation( current_user, meeting, team_affiliation, badge )
    return MeetingReservation.new unless current_user.instance_of?(User) &&
            meeting.instance_of?(Meeting) && team_affiliation.instance_of?(TeamAffiliation) &&
            badge.instance_of?(Badge)

    mr = MeetingReservation.where(
      meeting_id:       meeting.id,
      team_id:          team_affiliation.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id
    ).first

    if mr                                           # Existing?
      mr
    else                                            # NEW?
      MeetingReservation.new(
        meeting_id:       meeting.id,
        team_id:          team_affiliation.team_id,
        swimmer_id:       badge.swimmer_id,
        badge_id:         badge.id,
        user_id:          current_user.id,
        is_not_coming:    false,
        has_confirmed:    false
      )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns either a new *individual event* reservation instance or an existing one when found
  # (according to the parameters).
  #
  # Assumes all parameters are valid instances of the respective classes.
  # (Returns a new empty instance in case of invalid parameters)
  #
  def find_or_new_meeting_event_reservation( current_user, meeting, team_affiliation, badge, event )
    return MeetingEventReservation.new unless current_user.instance_of?(User) &&
            meeting.instance_of?(Meeting) && team_affiliation.instance_of?(TeamAffiliation) &&
            badge.instance_of?(Badge) && event.instance_of?(MeetingEvent)

    mer = MeetingEventReservation.where(
      meeting_id:       meeting.id,
      team_id:          team_affiliation.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id,
      meeting_event_id: event.id
    ).first

    if mer                                          # Existing?
      mer
    else                                            # NEW?
      swimmer = badge.swimmer
      best_finder = SwimmerPersonalBestFinder.new( swimmer )
      possible_best = best_finder.get_entry_best_timing(
        badge,
        meeting,
        event.event_type,
        meeting.pool_types.first,
        true # convert_pool_type
      )
      MeetingEventReservation.new(
        meeting_id:       meeting.id,
        team_id:          team_affiliation.team_id,
        swimmer_id:       swimmer.id,
        badge_id:         badge.id,
        meeting_event_id: event.id,
        user_id:          current_user.id,
        is_doing_this:    false,
        suggested_minutes:  possible_best ? possible_best.minutes : 0,
        suggested_seconds:  possible_best ? possible_best.seconds : 0,
        suggested_hundreds: possible_best ? possible_best.hundreds : 0
      )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns either a new *relay* reservation instance or an existing one when found
  # (according to the parameters).
  #
  # Assumes all parameters are valid instances of the respective classes.
  # (Returns a new empty instance in case of invalid parameters)
  #
  def find_or_new_meeting_relay_reservation( current_user, meeting, team_affiliation, badge, event )
    return MeetingRelayReservation.new unless current_user.instance_of?(User) &&
            meeting.instance_of?(Meeting) && team_affiliation.instance_of?(TeamAffiliation) &&
            badge.instance_of?(Badge) && event.instance_of?(MeetingEvent)

    mrr = MeetingRelayReservation.where(
      meeting_id:       meeting.id,
      team_id:          team_affiliation.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id,
      meeting_event_id: event.id
    ).first

    if mrr                                          # Existing?
      mrr
    else                                            # NEW?
      swimmer = badge.swimmer
      MeetingRelayReservation.new(
        meeting_id:       meeting.id,
        team_id:          team_affiliation.team_id,
        swimmer_id:       badge.swimmer_id,
        badge_id:         badge.id,
        meeting_event_id: event.id,
        user_id:          current_user.id,
        is_doing_this:    false
      )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


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
    if TeamManagerValidator.can_manage?( current_user, meeting ) &&
       TeamManagerValidator.any_reservations_for?( current_user, meeting )
      if (
           ReservationsCsi2Csv.is_a_csi_meeting( meeting )
         )
        link_to(
          meeting_reservations_export_csi_csv_path(id: meeting.id),
          class: 'btn btn-default',
          'data-toggle' => 'tooltip', 'title' => I18n.t('meeting_reservation.export_csi_csv_button_tooltip')
        ) do
          image_tag('page_white_excel.png') << I18n.t('meeting_reservation.export_csi_csv_button_title').html_safe
        end
      elsif (
           ReservationsFin2CsvMatrix.is_a_valid_meeting( meeting )
         )
        link_to(
          meeting_reservations_export_fin_csv_matrix_path(id: meeting.id),
          class: 'btn btn-default',
          'data-toggle' => 'tooltip', 'title' => I18n.t('meeting_reservation.export_fin_csv_button_tooltip')
        ) do
          image_tag('page_white_excel.png') << I18n.t('meeting_reservation.export_fin_csv_button_title').html_safe
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
