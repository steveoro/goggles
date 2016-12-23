# encoding: utf-8

=begin

== PassagesCollectSheetLayout

- version:  6.034
- author:   Steve A.

=end
class PassagesCollectSheetLayout
  require "prawn"
  require 'common/format'

  AUTHOR_STRING = '--=[  Goggles  -o^o-  ]=-- / (p) 2013-2016' unless defined?(AUTHOR_STRING)


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
    options[:pdf_format] = {
      page_size:      'A4',
# TODO detect max columns for passages and change to :landscape when a certain bias is reached
      page_layout:    :portrait,
                                                    # Document margins (in PS pts):
      left_margin:    30,
      right_margin:   30,
      top_margin:     40,
      bottom_margin:  40,
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

###########################################

# Sample width from trainings:
#    column_widths = [
#       20,                                          # part order
#       60,                                          # training_step_type description
#       40,                                          # esteemed tot. duration in secs
#       40,                                          # grouping multiplier
#       40,                                          # total distance with multiplier
#      330                                           # full exercise description
#    ]

    pdf.bounding_box( [0, pdf.bounds.height - 40],
                      width: pdf.bounds.width,
                      height: pdf.bounds.height-80 ) do
                                                    # -- Report title and header:
      pdf.text(
        "<u><b>#{ options[:report_title] }</b>: #{ meeting.get_full_name }</u>",
        { align: :center, size: 12, inline_format: true }
      )

      events.each do |event|
        # We must compose the data for the table as an Array of Arrays.
        # We build a new table for each event:
        detail_table_array = []

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

        # Enlist all passage types for this event
        row_array = passage_types.map{ |p| "#{ p.length_in_meters } #{ I18n.t('meters_short') }" }

        # For each event:
        if event.event_type.is_a_relay                # RELAYS:
          # Add an header for the event:
          detail_table_array << [ event.get_full_name, row_array[0], row_array[1] ]

          # Consider each relay reservation as a single row:
          reservations_relays[ event.id ].each do |res|
            # Add the swimmer name in the front cell and add the resulting row (array):
            detail_table_array << [
                res.swimmer.complete_name,
                ' ',
                ' '                                   # empty space to insert timing
            ]
          end
        else                                          # IND. EVENTS:
          # Add an header for the event:
          detail_table_array << [event.get_full_name] + row_array

          # Sort reservation events by reservation timing:
          sorted_events = reservations_events[ event.id ].sort do |r1, r2|
            Timing.new(
              r1.suggested_hundreds,
              r1.suggested_seconds,
              r1.suggested_minutes
            ) <=> Timing.new(
              r2.suggested_hundreds,
              r2.suggested_seconds,
              r2.suggested_minutes
            )
          end

          # Map all reservations for this event as individual rows
          sorted_events.each do |res|
            # Add the swimmer name in the front cell and add the remaining
            # columns as empty cells so that we can have an empty space
            # in which we can draw the passage timing:
            detail_table_array << [ res.swimmer.complete_name ] + row_array.map{|cell| ''}
          end
        end

        # Draw the table:
        pdf.table( detail_table_array, position: :left, row_colors: ["ffffff", "eeeeee"] ) do
          cells.style do |c|
            c.height = 30 if c.row > 0
            c.width = 60 if c.column > 0
          end
        end
        pdf.move_down( 10 )
      end

###########################################

    # The following checks for residual grouping sub-table at the end of the
    # detail row loop scan.
    #
    # This is due to the fact the each grouping is composed of at least 2 detail
    # rows, where the first one acts as the group header.
    #
    # So we must check also that the subtable size is valid (> 0) to verify that
    # the header has been already added to the list.
    # if group_array && (group_subtable_array.size > 0)
      # sub_table = pdf.make_table( group_subtable_array, cell_style: {size: 8}, position: :left ) do
        # cells.column(0).align = :right
        # cells.column(0).width = column_widths[4]
        # cells.column(0).borders = [:top, :bottom, :left]
        # cells.column(1).align = :left
        # cells.column(1).borders = [:top, :bottom, :right]
        # cells.column(1).width = column_widths[5]
      # end
      # group_array << { content: sub_table, colspan: 2 }
      # detail_table_array << group_array
      # group_array = nil                           # Reset the group temp storage
      # group_subtable_array = []
    # end

      # pdf.text(
        # "<i>#{ I18n.t('trainings.total_meters') }:</i> #{ header_row.compute_total_distance }",
        # { align: :left, size: 8, inline_format: true }
      # )
      # tot_secs = header_row.compute_total_seconds()
      # pdf.text(
        # "<i>#{ I18n.t('trainings.esteemed_timing') }:</i> #{ Timing.to_hour_string(tot_secs) }",
        # { align: :left, size: 8, inline_format: true }
      # )
      # pdf.move_down( 10 )
                                                    # -- Main data table:
#      pdf.table( detail_table_array, position: :center, row_colors: ["ffffff", "eeeeee"] ) do
        # cells.style do |c|                          # Cell is not a subtable and it's empty? Clear it:
          # if ( !c.content.instance_of?(Prawn::Table) ) &&
             # ( c.content.empty? || c.content.nil? )
# #            c.background_color = (c.row % 2).zero? ? "ffffff" : "eeeeee"
            # c.borders = [:top, :bottom, :left]
                                                    # # Cell is normal training row?
          # elsif ( !c.content.instance_of?(Prawn::Table) )
# #            c.background_color = (c.row % 2).zero? ? "ffffff" : "eeeeee"
            # c.size = 8
            # case c.column
            # when 0
              # c.borders = [:top, :bottom, :left]
              # c.align = :right
              # c.width = column_widths[0]
              # c.size = 7
            # when 1
              # c.borders = [:top, :bottom]
              # c.align = :left
              # c.width = column_widths[1]
              # c.size = 7
            # when 2
              # c.borders = [:top, :bottom]
              # c.align = :right
              # c.width = column_widths[2]
            # when 3
              # c.borders = [:top, :bottom, :left]
              # c.align = :left
              # c.width = column_widths[3]
            # when 4
              # c.borders = [:top, :bottom]
              # c.align = :right
              # c.width = column_widths[4]
            # when 5
              # c.borders = [:top, :bottom, :right]
              # c.align = :left
              # c.width = column_widths[5]
            # end
                                                    # # Cell is a group sub-table?
          # elsif c.content.instance_of?(Prawn::Table)
            # c.content.row_colors = (c.row % 2).zero? ? ["ffffff"] : ["eeeeee"]
          # end
        # end
#      end
#      pdf.move_down( 10 )

      pdf.stroke_horizontal_rule()
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
