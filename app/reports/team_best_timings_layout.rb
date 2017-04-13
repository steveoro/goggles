# encoding: utf-8

=begin

== TeamBestTimingsLayout

- version:  6.101
- author:   Steve A.

=end
class TeamBestTimingsLayout
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
  # - <tt>:team<\tt> (required) => the Team instance
  #
  # - <tt>:team_best_finder<\tt> (required) => TeamBestFinder instance, used to get
  #   the correct categories & event loop for the rendering.
  #
  # - <tt>:team_bests<\tt> (required) =>
  #   An instance of RecordX4dDAO storing all individual records to be rendered
  #   in the layout.
  #
  def self.render( options )
    Prawn::Font::AFM.hide_m17n_warning = true

    options[:pdf_format] = {
      page_size:      'A4',
      page_layout:    :landscape,
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
    team_best_finder  = options[:team_best_finder]
    team_bests        = options[:team_bests]

    pdf.bounding_box( [0, pdf.bounds.height - 40],
                      width: pdf.bounds.width, height: pdf.bounds.height-80 ) do
      # -- Report title and header:
      pdf.text(
        "<u><i>#{ options[:report_title] }</i>: <b>#{ team.get_full_name }</b></u>",
        { align: :center, size: 10, inline_format: true }
      )
      pdf.move_down( 10 )

      team_best_finder.gender_types.each do |gender_type|
        team_best_finder.pool_types.each do |pool_type|
          # Gender & pool title:
          pdf.text(
            "<b>#{gender_type.i18n_alternate}, #{pool_type.i18n_description}</b>",
            { align: :left, size: 10, inline_format: true }
          )
          data_table_array = []
          valid_categories = team_best_finder.get_categories_with_records( pool_type, gender_type, team_bests )
          # Add header row (category_type)
          data_table_array << ( [''] + valid_categories.map{ |category_type| category_type.get_full_name } )

          # Add data rows:
          team_best_finder.get_events_with_records( pool_type, gender_type, team_bests ).each do |event_type|
            # Add the first column (header):
            data_row = [ event_type.i18n_short ]
            # Add the subsequent columns (record data):
            valid_categories.each do |category_type|
              record = team_bests.get_record_instance( pool_type.code, gender_type.code, event_type.code, category_type.code )
              if record
                if (sched_date = record.get_scheduled_date).kind_of?(Date)
                  data_row << "<b>#{ record.get_timing }</b><br/>#{ record.swimmer.get_full_name }<br/><i>#{ Format.a_date( sched_date ) }</i>"
                else
                  data_row << "<b>#{ record.get_timing }</b><br/>#{ record.swimmer.get_full_name }<br/>-"
                end
              else
                data_row << "-"
              end
            end
            # Add the data row to the table array:
            data_table_array << data_row
          end

          # Actually render the table:
          pdf.table(
              data_table_array,
              header: true, position: :left,
              row_colors: ["ffffff", "eeeeee"],
              width: pdf.bounds.width - 10,
              cell_style: {
                inline_format: true,
                overflow: :shrink_to_fit,
                min_font_size: 6
              }
          ) do
            # Header row & column:
            cells.filter do |c|
              ( c.column == 0 ) || ( c.row == 0 )
            end.style do |c|
              c.background_color = "C4E3F3"           # light cyan
              c.size = 8
            end

            # Any data timing cell:
            cells.filter do |c|
              ( c.column > 0 ) && ( c.row > 0 )
            end.style do |c|
              c.align = :center
              c.valign = :center
              c.size = 8
            end
          end
          # Do not start a new page if we've reached the end:
          pdf.start_new_page unless (
             ( gender_type.id == team_best_finder.gender_types.last.id ) &&
             ( pool_type.id == team_best_finder.pool_types.last.id )
          )
        end

        # *** END Pool loop
      end

      # *** END Gender loop
    end
  end
  #-- -------------------------------------------------------------------------
  #++


#############################################à FIXME OLD STUFF: #########################à


  # Renders (with custom styles) a single table given the data rows specified as
  # parameter.
  #
  def self.draw_a_single_event_table( pdf, data_table_array, is_a_long_event, is_a_relay )
    # Draw the table:
    pdf.table( data_table_array, header: true, position: :left,
               row_colors: ["ffffff", "eeeeee"],
               width: is_a_long_event ? pdf.bounds.width - 10 : nil,
               cell_style: { inline_format: true, overflow: :shrink_to_fit,
                             min_font_size: 6 } ) do
      # Swimmer name cells:
      cells.filter do |c|
        ( c.column == 0 ) && ( c.content.to_s =~ /^\<i\>\<b\>|\*\s\*\s\*/ ).nil?
      end.style do |c|
        c.background_color = "C4E3F3"           # light cyan
        c.size = 10
      end

      # Registration-entry times cells:
      cells.filter do |c|
        ( c.column == 1 ) &&
        ( c.content.to_s =~ /^\<i\>\<b\>|\*\s\*\s\*/ ).nil?
      end.style do |c|
        c.background_color = "D9EDF7"           # lighter cyan
        c.align = :right
        c.size = 8
      end

      # Header cells:
      cells.filter do |c|
        cells[c.row, 0].content.to_s =~ /^\<i\>\<b\>/
      end.style do |c|
        c.align = :center
        c.valign = :center
        c.background_color = "DFF0D8"           # light greenish
        c.height = 30
        c.size = 10
      end

      # Timing/entry column cells:
      cells.filter do |c|
        ( c.column > 0 ) && ( c.content.to_s =~ /^\<i\>\<b\>|\*\s\*\s\*/ ).nil?
      end.style do |c|
        c.width = 60 unless is_a_long_event     # all column width fixed when we have space
        c.width = 40 if is_a_long_event && c.column > 1
      end

      # Relay-only name column width:
      if is_a_relay
        cells.filter { |c| ( c.column == 2 ) }.style { |c| c.width = 80 }
      end

      # Any data timing cell:
      cells.filter do |c|
        ( c.column > 1 ) &&
        ( c.content.to_s =~ /^\<i\>\<b\>|\*\s\*\s\*/ ).nil?
      end.style do |c|
        c.align = :center
        c.valign = :center
      end
    end # pdf.table
  end
  #-- -------------------------------------------------------------------------
  #++


  # Setup for the Array of Array that holds the data for a relay-type
  # data-sheet table.
  #
  # == Params:
  # pdf: the document being rendered
  # event: the event (MeetingEvent) to be processed
  # passage_labels: an array of string describing the columns for the data sheet
  # reservation_array: the Array of MeetingRelayReservation containing the reservation data associated to the event
  #
  # == Returns:
  # The prepared array of array (rows of data), ready to be rendered as a table.
  #
  def self.prepare_relay_data_tables( pdf, event, passage_labels, reservation_array )
    # Detect to many columns:
    is_a_long_event = passage_labels.count > 11

    # We must compose the data for the table as an Array of Arrays.
    # We build a new table for each event:
    data_table_array = []

    # Sort by relay name (and order) all active relay reservations:
    relay_configs = reservation_array.select{ |rel| rel.is_doing_this? }
        .sort{ |rel_a, rel_b| "#{ rel_a.notes }" <=> "#{ rel_b.notes }" }

    prev_config_name = nil
    swimmer_year_tot = 0

    # For each sorted relay reservation config:
    relay_configs.each_with_index do |res, index|
      # Add a custom header for each relay name change:
      if ( prev_config_name != res.notes.to_s.split(';').first ) || (index == 0)
        # On relay change, if not at the start, add another empty line:
        if index > 0
          # Make sure we don't start a new relay data table too near the bottom margin:
          if pdf.cursor < 150
            pdf.start_new_page
          end
          # New table detected! Time to render the old data:
          self.draw_a_single_event_table( pdf, data_table_array, is_a_long_event, true )
          self.add_relay_data_table_footnote( pdf, data_table_array.size, swimmer_year_tot )
          # Clear the data table afterwards:
          data_table_array = []
          swimmer_year_tot = 0
        end
        # Repeat header row:
        data_table_array << (
          [
            "<i><b>#{ event.get_full_name }</b></i>",
            "<i>#{ I18n.t('swimmers.year_of_birth') } / #{ I18n.t('swimmers.age_current') }</i>",
            "<i>#{ I18n.t('meeting_reservation.relay') } '<b>#{ res.notes.to_s.split(';').first }</b>'</i>"
          ] + passage_labels
        )
      end

      # Add the swimmer name in the front cell and add the resulting row (array):
      swimmer_age = Date::today.year - res.swimmer.year_of_birth
      swimmer_year_tot += swimmer_age
      data_table_array << [
          res.swimmer.complete_name,
          "#{ res.swimmer.year_of_birth } / #{ swimmer_age }",
          "##{ res.notes.to_s.split(';').last.to_i }" # relay fraction order
      ] + passage_labels.map{ |cell| '' }           # Empty space to insert timing
      # Update the previous config name before another loop:
      prev_config_name = res.notes.to_s.split(';').first
    end

    # Draw the residual table data:
    if data_table_array.size > 0
      self.draw_a_single_event_table( pdf, data_table_array, is_a_long_event, true )
      self.add_relay_data_table_footnote( pdf, data_table_array.size, swimmer_year_tot )
    end
  end


  # Adds a line of text regarding the total age of swimmers for a relay data table
  def self.add_relay_data_table_footnote( pdf, data_table_array_size, swimmer_year_tot )
    pdf.move_down( 5 )
    table_note = "#{ I18n.t('meeting_relay.config.total_age') } = #{ swimmer_year_tot }"
    if data_table_array_size < 5
      table_note << " #{ I18n.t('meeting_relay.config.not_enough_swimmers_note') }"
    end
    pdf.text( table_note )
    pdf.move_down( 15 )
  end


  # Setup for the Array of Array that holds the data for the ind.event-type
  # data-sheet table.
  #
  # == Params:
  # pdf: the document being rendered
  # event: the event (MeetingEvent) to be processed
  # passage_labels: an array of string describing the columns for the data sheet
  # reservation_array: the Array of MeetingEventReservation containing the reservation data associated to the event
  #
  # == Returns:
  # The prepared array of array (rows of data), ready to be rendered as a table.
  #
  def self.prepare_event_data_table( pdf, event, passage_labels, reservation_array )
    # Detect to many columns:
    is_a_long_event = passage_labels.count > 11

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
      data_table_array << ['* * *'] if self.is_row_separator_required( event, res, previous_res )

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

    # Draw the residual table data:
    if data_table_array.size > 0
      self.draw_a_single_event_table( pdf, data_table_array, is_a_long_event, false )
    end
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
