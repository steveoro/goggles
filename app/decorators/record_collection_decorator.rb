=begin

= RecordCollectionDecorator

  - version:  4.00.405
  - author:   Steve A.

  Decorator for the RecordCollection model.
  Contains all presentation-logic centered methods.

=end
class RecordCollectionDecorator < Draper::Decorator
  delegate_all
  include Rails.application.routes.url_helpers

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end


  # Returns the complete list of records in the collection for HTML rendering,
  # in a standard format:
  #
  #     <timing> (<athlete1>, <athlete2>, ...)
  #
  def to_complete_html_list
    rec_timing = nil
    rec_swimmers = []
    each do |key, record|
      rec_timing ||= record.get_timing_instance
      meeting = record.meeting_individual_result.meeting if record.meeting_individual_result
      # Decorate each swimmer name with a link to the meeting #show_full action:
      rec_swimmers << h.link_to_if(
          meeting,
          record.swimmer.get_full_name,
          meeting_show_full_path( id: meeting.id, team_id: record.team_id, swimmer_id: record.swimmer_id )
      )
    end
    "#{rec_timing} (#{ rec_swimmers.join(', ') })".html_safe
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the complete list of records in the collection for HTML rendering,
  # in a verbose format:
  #
  #     <timing> (<athlete1> - <header_date1>, <athlete2> - <header_date1>, ...)
  #
  def to_verbose_html_list
    rec_timing = nil
    rec_swimmers = []
    each do |key, record|
      rec_timing ||= record.get_timing_instance
      meeting = record.meeting_individual_result.meeting if record.meeting_individual_result
      link_label = record.meeting_individual_result ? "#{record.swimmer.get_full_name} - #{meeting.header_date}" : record.swimmer.get_full_name
      # Decorate each swimmer name with a link to the meeting #show_full action:
      rec_swimmers << h.link_to_if(
          meeting,
          link_label,
          meeting_show_full_path( id: meeting.id, team_id: record.team_id, swimmer_id: record.swimmer_id )
      )
    end
    "#{rec_timing} (#{ rec_swimmers.join(', ') })".html_safe
  end
  #-- -------------------------------------------------------------------------
  #++

end
