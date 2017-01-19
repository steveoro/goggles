# encoding: utf-8

=begin

== PassagesCollectSheetLayout

- version:  6.056
- author:   Steve A.

=end
class PassagesCollectSheetLayout
  require "prawn"
  require 'common/format'

  AUTHOR_STRING = '--=[  Goggles  -o^o-  ]=-- / (p) 2013-2017' unless defined?(AUTHOR_STRING)


  # Prepares rendering options, default values and starts the rendering
  # process.
  #
  # == Options:
  # - <tt>:report_title<\tt> (required) =>
  #   a String description for the report title.
  #
  # - <tt>:meta_info_subject<\tt> =>
  #   String text for the PDF meta-info subject field.
  #
  # - <tt>:meta_info_keywords<\tt> =>
  #   String text for the PDF meta-info Keywords field.
  #
  # - <tt>:meeting<\tt> (required) => Meeting instance
  #
  # - <tt>:team<\tt> (required) => Team instance
  #
  # - <tt>:events<\tt> (required) =>
  #   all available MeetingEvent rows for this meeting (used to group together
  #   the event reservations).
  #
  # - <tt>:meeting_reservations<\tt> (required) =>
  #   all available MeetingReservation rows referenced by a "registered" event or relay.
  #
  # - <tt>:reservations_events<\tt> (required) =>
  #   Hash of Arrays; keys: event.id, value: array of MeetingEventReservation
  #   rows associated to the linked meeting_event_id
  #
  # - <tt>:reservations_relays<\tt> (required) =>
  #   Hash of Arrays; keys: event.id, value: array of MeetingRelayReservation
  #   rows associated to the linked meeting_event_id
  #
  def self.render( options )
# TODO/FIXME detect max columns in advance for passages and build a multi-page document
#      with layout orientation change to :landscape only for events which total length is > 400 m.
#      (the :landscape pages must contain, in order, only the long distance event)
    has_long_events = options[:events].any? do|event|
      ( !event.event_type.is_a_relay ) && ( event.event_type.length_in_meters >= 400 )
    end

    options[:pdf_format] = {
      page_size:      'A4',
      page_layout:    ( has_long_events ? :landscape : :portrait ),
                                                    # Document margins (in PS pts):
      left_margin:    16,
      right_margin:   16,
      top_margin:     20,
      bottom_margin:  20,
                                                    # Metadata:
      info: {
        Title:        options[ :report_title ],
        Author:       AUTHOR_STRING,
        Subject:      options[ :meta_info_subject ],
        Keywords:     options[ :meta_info_keywords ],
        Creator:      AUTHOR_STRING,
        Producer:     "Goggles/Prawn. Layout (c) Goggles framework",
        CreationDate: Time.now
      }
    }

    pdf = Prawn::Document.new( options[:pdf_format] )
    build_page_header( pdf, options )
    build_page_footer( pdf, options )
    build_report_body( pdf, options )
    finalize_standard_report( pdf )
    pdf.render()
  end
  #-- -------------------------------------------------------------------------
  #++


  protected


  # Builds and adds a page header on each page.
  #
  def self.build_page_header( pdf, options )
    pdf.repeat( :all ) do
      pdf.move_cursor_to( pdf.bounds.top() )
      pdf.text( "<i>#{AUTHOR_STRING}</i>", align: :center, size: 6, inline_format: true )
      pdf.move_cursor_to( pdf.bounds.top() - 10 )
      pdf.stroke_horizontal_rule()
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Builds and adds a page footer on each page.
  #
  def self.build_page_footer( pdf, options )
    pdf.repeat( :all ) do
      pdf.move_cursor_to( pdf.bounds.bottom() + 7 )
      pdf.stroke_horizontal_rule()
      pdf.text_box(
        Format.a_short_datetime( DateTime.now ),
        size: 6,
        at: [50, 2],
        width: pdf.bounds.width - 100,
        height: 6,
        align: :center
      )
      pdf.move_cursor_to( pdf.bounds.bottom() - 6 )
      pdf.stroke_horizontal_rule()
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Builds the report body, redifining also the margins to avoid overwriting on
  # page headers and footers.
  #
  def self.build_report_body( pdf, options )
    meeting = options[:meeting]
    team = options[:team]
    events = options[:events]
    meeting_reservations = options[:meeting_reservations]
    reservations_events = options[:reservations_events]
    reservations_relays = options[:reservations_relays]

    pdf.bounding_box( [0, pdf.bounds.height - 40],
                      width: pdf.bounds.width, height: pdf.bounds.height-80 ) do
      # -- Report title and header:
      pdf.text(
        "<u><i>#{ options[:report_title] }</i>: <b>#{ meeting.get_full_name }</b></u>",
        { align: :center, size: 10, inline_format: true }
      )
      pdf.move_down( 10 )

      events.each do |event|
        # Get the pool type and the passage types:
        pool_type = meeting.event_types.where( id: event.event_type_id ).first
          .pool_types
          .first
        possible_passage_types = team.team_passage_templates
          .for_event_type( event.event_type )
          .for_pool_type( pool_type )

        # passage_types.count will yield the total number of columns for the current event:
        passage_types = possible_passage_types.count == 0 ?
          TeamPassageTemplate.get_default_passage_types_for( event.event_type.length_in_meters, pool_type.length_in_meters ) :
          TeamPassageTemplate.get_template_passage_types_for( team, event.event_type, pool_type )

        # Enlist all passage types for this event composing their labels:
        row_array = passage_types.map{ |p| "<i>#{ p.length_in_meters }</i>" }

        # For each event:
        data_table_array = if event.event_type.is_a_relay
          # --- RELAYS data setup ---
          self.prepare_relay_data_table( event, row_array, reservations_relays[ event.id ] )
        else
          # --- IND.EVENTS data setup ---
          self.prepare_event_data_table( event, row_array, reservations_events[ event.id ] )
        end
        # Detect to many columns:
        is_a_long_event = row_array.count > 11

        # Draw the table:
        pdf.table( data_table_array, header: true, position: :left,
                   row_colors: ["ffffff", "eeeeee"],
                   width: is_a_long_event ? pdf.bounds.width - 10 : nil,
                   cell_style: { inline_format: true, overflow: :shrink_to_fit,
                                 min_font_size: 6 } ) do
          cells.style do |c|                        # Custom cell styling:
            if c.row == 0                           # header row / labels
              c.align = :center
              c.valign = :center
              c.background_color = "DFF0D8"         # light greenish
              c.height = 30
              c.size = 10
                                                    # Any other row below the header:
            elsif c.column == 0                     # (swimmers column)
              c.background_color = "C4E3F3"         # light cyan
              c.size = 10
            end

            if c.column > 0                         # Timing/entry column sizing
              c.width = 60 unless is_a_long_event   # all column width fixed when we have space
              c.width = 40 if is_a_long_event && c.column > 1

              if c.row > 0  && c.column == 1        # (registration entry times)
                c.background_color = "D9EDF7"       # lighter cyan
                c.align = :right
                c.size = 8
              end
              if c.row > 0  && c.column > 1         # (any data timing cell)
                c.align = :center
                c.valign = :center
              end
            end
          end
        end
        pdf.move_down( 10 )
      end

      pdf.stroke_horizontal_rule()
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Setup for the Array of Array that holds the data for a relay-type
  # data-sheet table.
  #
  # == Params:
  # data_table_array: an empty array
  # event: the event (MeetingEvent) to be processed
  # passage_labels: an array of string describing the columns for the data sheet
  # reservation_array: the Array of MeetingRelayReservation containing the reservation data associated to the event
  #
  # == Returns:
  # The prepared array of array (rows of data), ready to be rendered as a table.
  #
  def self.prepare_relay_data_table( event, passage_labels, reservation_array )
    # We must compose the data for the table as an Array of Arrays.
    # We build a new table for each event:
    data_table_array = []

    # Add a custom header for the event:
    data_table_array << (
      [
        "<i><b>#{ event.get_full_name }</b></i>",
        "<i>#{ I18n.t('swimmers.year_of_birth') } / #{ I18n.t('swimmers.age_current') }</i>",
        # FIXME Quick'n'dirty way to get at least a couple of free columns to write passages during relays:
        #       This does not take in account certain passage types/pool types combos for relays.
        #       (The actual computation to get the label right is more complex)
        " ",                                # space to write the chosen relay order or anything else
        "<i>#{ passage_labels[0] }</i>",    # 1st lap passage (FIXME label may be wrong)
        "<i>#{ passage_labels[1] }</i>",    # 2nd lap passage (FIXME label may be wrong)
      ]
    )

    # Consider each relay reservation as a single row:
    reservation_array.each do |res|
      # Add the swimmer name in the front cell and add the resulting row (array):
      data_table_array << [
          res.swimmer.complete_name,
          "#{ res.swimmer.year_of_birth } / #{ Date::today.year - res.swimmer.year_of_birth }",
          ' ', # empty free space
          # Empty space to insert timing:
          ' ',
          ' '
      ]
    end

    data_table_array
  end


  # Setup for the Array of Array that holds the data for the ind.event-type
  # data-sheet table.
  #
  # == Params:
  # event: the event (MeetingEvent) to be processed
  # passage_labels: an array of string describing the columns for the data sheet
  # reservation_array: the Array of MeetingEventReservation containing the reservation data associated to the event
  #
  # == Returns:
  # The prepared array of array (rows of data), ready to be rendered as a table.
  #
  def self.prepare_event_data_table( event, passage_labels, reservation_array )
    # We must compose the data for the table as an Array of Arrays.
    # We build a new table for each event:
    data_table_array = []

    # Add a custom header for the event:
    data_table_array << (
      [
        "<i><b>#{ event.get_full_name }</b></i>",
        "<i>#{ I18n.t('meeting_reservation.entry_time') }</i>"
      ] + passage_labels
    )

    # Sort reservation events by entry timing in descending order, according to current
    # event configuration:
    sorted_events = self.get_sorted_reservation_events( event, reservation_array )
    previous_res = nil

    # Map all reservations for this event as individual rows, add eventually a
    # separator row, if required:
    sorted_events.each do |res|
      # Do we need to add a separator row?
      if self.is_row_separator_required( event, res, previous_res )
        data_table_array << (
          [
            "* * *",
            ""
          ] +
          passage_labels.map{ |cell| "* * *" }
        )
      end
      # Compute the entry timing:
      entry_timing = Timing.new(res.suggested_hundreds, res.suggested_seconds, res.suggested_minutes )
      # Add the swimmer name as column #0, the entry timing as column #1
      # and add the remaining columns as empty cells so that we can have
      # enough blank cells write each passage timing:
      data_table_array << (
        [
          res.swimmer.complete_name,
          "<i>#{ entry_timing.to_s }</i>"
        ] +
        passage_labels.map{ |cell| '' }
      )
      previous_res = res
    end

    data_table_array
  end
  #-- -------------------------------------------------------------------------
  #++


  # Return true if the current reservation event needs a separator row when
  # compared to the previous res. event and the current event configuration.
  #
  def self.is_row_separator_required( event, curr_res, previous_res )
    return false if previous_res.nil?
    if event.has_separate_gender_start_list?
      if event.has_separate_category_start_list?
        ( curr_res.gender_type.id != previous_res.gender_type.id) ||
        ( curr_res.category_type.age_begin != previous_res.category_type.age_begin )
      else
        ( curr_res.gender_type.id != previous_res.gender_type.id)
      end

    else
      if event.has_separate_category_start_list?
        ( curr_res.category_type.age_begin != previous_res.category_type.age_begin )
      else
        false
      end
    end
  end


  # Sort the reservation_array according to the event configuration.
  #
  def self.get_sorted_reservation_events( event, reservation_array )
    if event.has_separate_gender_start_list?
      if event.has_separate_category_start_list?
        # Sort by: gender code ASC, category DESC, timing DESC:
        reservation_array.sort! do |res_a, res_b|
          self.get_comparable_gender_category_timing_string_for( res_b ) <=> self.get_comparable_gender_category_timing_string_for( res_a )
        end
      else
        # Sort by: gender code ASC, timing DESC:
        reservation_array.sort! do |res_a, res_b|
          self.get_comparable_gender_timing_string_for( res_b ) <=> self.get_comparable_gender_timing_string_for( res_a )
        end
      end
    else
      if event.has_separate_category_start_list?
        # Sort by: category DESC, timing DESC:
        reservation_array.sort! do |res_a, res_b|
          self.get_comparable_category_timing_string_for( res_b ) <=> self.get_comparable_category_timing_string_for( res_a )
        end
      else
        # Sort by: timing DESC:
        reservation_array.sort! do |res_a, res_b|
          self.get_comparable_timing_string_for( res_b ) <=> self.get_comparable_timing_string_for( res_a )
        end
      end
    end
    reservation_array
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns a string value usable for <=> sorting operator, to allow sorting by:
  #
  # 1. timing value DESC (while changing NO-TIMEs with a highest-possible timing)
  #
  # Assumes that event_res is a MeetingEventReservation.
  #
  def self.get_comparable_timing_string_for( event_res )
    "#{ event_res.get_timing.to_f > 0 ? event_res.get_timing : '99999999' }"
  end

  # Returns a string value usable for <=> sorting operator, to allow sorting by:
  #
  # 1. category age_begin DESC, (oldest first)
  # 2. timing value DESC (while changing NO-TIMEs with a highest-possible timing)
  #
  # Assumes that event_res is a MeetingEventReservation.
  #
  def self.get_comparable_category_timing_string_for( event_res )
    "#{ event_res.category_type.age_begin }-#{ event_res.get_timing.to_f > 0 ? event_res.get_timing : '99999999' }"
  end

  # Returns a string value usable for <=> sorting operator, to allow sorting by:
  #
  # 1. gender code ASC, (1°:'F', 2°:'M', 3°:'X')
  # 2. timing value DESC (while changing NO-TIMEs with a highest-possible timing)
  #
  # Assumes that event_res is a MeetingEventReservation.
  #
  def self.get_comparable_gender_timing_string_for( event_res )
    "#{ event_res.gender_type.id }#{ event_res.get_timing.to_f > 0 ? event_res.get_timing : '99999999' }"
  end

  # Returns a string value usable for <=> sorting operator, to allow sorting by:
  #
  # 1. gender code ASC, (1°:'F', 2°:'M', 3°:'X')
  # 2. category age_begin DESC, (oldest first)
  # 3. timing value DESC (while changing NO-TIMEs with a highest-possible timing)
  #
  # Assumes that event_res is a MeetingEventReservation.
  #
  def self.get_comparable_gender_category_timing_string_for( event_res )
    "#{ event_res.gender_type.id }-#{ event_res.category_type.age_begin }-#{ event_res.get_timing.to_f > 0 ? event_res.get_timing : '99999999' }"
  end
  #-- -------------------------------------------------------------------------
  #++


  def self.finalize_standard_report( pdf )
    page_num_text = "Pag. <page>/<total>"
    numbering_options = {
      at: [pdf.bounds.right - 150, 2],
      width: 150,
      align: :right,
      size: 6
    }
    pdf.number_pages( page_num_text, numbering_options )
  end
  #-- -------------------------------------------------------------------------
  #++
end
