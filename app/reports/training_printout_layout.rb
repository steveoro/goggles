# encoding: utf-8

=begin

== TrainingPrintoutLayout

- version:  4.00.325.20140620
- author:   Steve A.

=end
class TrainingPrintoutLayout
  require "prawn"
  require 'common/format'

  AUTHOR_STRING = '--=[  Goggles  -o^o-  ]=-- / (p) 2013-2014'

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
  # - <tt>:header_row<\tt> (required) =>
  #   The ActiveRecord header row instance to be processed.
  #
  # - <tt>:detail_rows<\tt> (required) =>
  #   The ActiveRecord Array of detail rows to be processed.
  #
  def self.render( options = { label_hash: {} } )
    options[:pdf_format] = {
      page_size:      'A4',
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
        Producer:     "Prawn @ AgeX5 framework",
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
  # ---------------------------------------------------------------------------


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
  # --------------------------------------------------------------------------


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
  # ---------------------------------------------------------------------------


  # Builds the report body, redifining also the margins to avoid overwriting on
  # page headers and footers.
  #
  def self.build_report_body( pdf, options )
    header_row = options[:header_row]               # (ASSERT: *already* decorated)
    detail_rows = options[:detail_rows]             # (ASSERT: *already* decorated)
                                                    # We must compose data for the table as an Array of Arrays:
    detail_table_array = []
    group_array = nil
    group_subtable_array = []
    curr_group_id = old_group_id = 0
    group_list_hash = header_row.build_group_list_hash()

    column_widths = [
       20,                                          # part order
       60,                                          # training_step_type description
       40,                                          # esteemed tot. duration in secs
       40,                                          # grouping multiplier
       40,                                          # total distance with multiplier
      330                                           # full exercise description
    ]

    detail_rows.each{ |detail_row|
                                                    # Detect if current row belongs to a grouping
      if (detail_row.group_id > 0) &&
         group_list_hash.has_key?( detail_row.group_id )
        curr_group_id = detail_row.group_id       # Store group id for future reference
                                                    # For each context, format accordingly:
        if old_group_id != curr_group_id            # Start of new group?
          old_group_id = curr_group_id
          group_hash = group_list_hash[ detail_row.group_id ]

          tot_group_secs = TrainingRow.compute_total_seconds( group_hash[:datarows] )
          tot_group_timing = Timing.to_minute_string( tot_group_secs )

          group_pause = Timing.to_formatted_pause( group_hash[:pause].to_i )
          group_s_r   = Timing.to_formatted_start_and_rest( group_hash[:start_and_rest].to_i )
          # Prepares an array formattable as a PDF table, containing a single whole group:
          group_array = [
            detail_row.get_formatted_part_order(),
            detail_row.get_training_step_type_short(),
            "(#{tot_group_timing})",                # esteemed tot. duration in secs
                                                    # grouping multiplier + intervals:
            "#{group_hash[:times] }x #{group_pause} #{group_s_r}"
          ]
        end
        group_subtable_array << [
          detail_row.get_formatted_distance(),
          detail_row.get_row_description()
        ]
      else                                          # Not in a group?
        curr_group_id = 0
        if group_array                              # Do we have a group to add to the table data?
          sub_table = pdf.make_table( group_subtable_array, cell_style: {size: 8}, position: :left ) do
            cells.column(0).align = :right
            cells.column(0).width = column_widths[4]
            cells.column(0).borders = [:top, :bottom, :left]
            cells.column(1).align = :left
            cells.column(1).borders = [:top, :bottom, :right]
            cells.column(1).width = column_widths[5]
          end
          group_array << { content: sub_table, colspan: 2 }
          detail_table_array << group_array
          group_array = nil                         # Reset the group temp storage
          group_subtable_array = []
        end
                                                    # Proceed adding current data row:
        detail_table_array << [
          detail_row.get_formatted_part_order(),
          detail_row.get_training_step_type_short(),
          "(#{ Timing.to_minute_string( detail_row.get_formatted_total_seconds() ) })",
          '',
          detail_row.get_formatted_distance(),
          detail_row.get_row_description()
        ]
      end
    }

    pdf.bounding_box( [0, pdf.bounds.height - 40],
                      width: pdf.bounds.width,
                      height: pdf.bounds.height-80 ) do
                                                    # -- Report title and header:
      pdf.text(
        "<u><b>#{ options[:report_title] }</b></u>",
        { align: :left, size: 9, inline_format: true } 
      )
      pdf.text(
        "<i>#{ I18n.t('activerecord.attributes.training.user') }:</i> #{ header_row.get_user_name }",
        { align: :left, size: 9, inline_format: true } 
      )
      pdf.text(
        "<i>#{ I18n.t('activerecord.models.swimmer_level_type') }:</i> #{ header_row.get_swimmer_level_type(:i18n_description) }",
        { align: :left, size: 9, inline_format: true } 
      )
      pdf.text(
        header_row.description,
        { align: :left, size: 9, inline_format: true } 
      )
      pdf.move_down( 10 )

      pdf.text(
        "<i>#{ I18n.t('trainings.total_meters') }:</i> #{ header_row.compute_total_distance }",
        { align: :left, size: 8, inline_format: true } 
      )
      tot_secs = header_row.compute_total_seconds()
      pdf.text(
        "<i>#{ I18n.t('trainings.esteemed_timing') }:</i> #{ Timing.to_hour_string(tot_secs) }",
        { align: :left, size: 8, inline_format: true } 
      )
      pdf.move_down( 10 )
                                                    # -- Main data table:
      pdf.table( detail_table_array, position: :center, row_colors: ["ffffff", "eeeeee"] ) do
        cells.style do |c|                          # Cell is not a subtable and it's empty? Clear it:
          if ( !c.content.instance_of?(Prawn::Table) ) &&
             ( c.content.empty? || c.content.nil? )
#            c.background_color = (c.row % 2).zero? ? "ffffff" : "eeeeee"
            c.borders = [:top, :bottom, :left]
                                                    # Cell is normal training row?
          elsif ( !c.content.instance_of?(Prawn::Table) )
#            c.background_color = (c.row % 2).zero? ? "ffffff" : "eeeeee"
            c.size = 8
            case c.column
            when 0
              c.borders = [:top, :bottom, :left]
              c.align = :right
              c.width = column_widths[0]
              c.size = 7
            when 1
              c.borders = [:top, :bottom]
              c.align = :left
              c.width = column_widths[1]
              c.size = 7
            when 2
              c.borders = [:top, :bottom]
              c.align = :right
              c.width = column_widths[2]
            when 3
              c.borders = [:top, :bottom, :left]
              c.align = :left
              c.width = column_widths[3]
            when 4
              c.borders = [:top, :bottom]
              c.align = :right
              c.width = column_widths[4]
            when 5
              c.borders = [:top, :bottom, :right]
              c.align = :left
              c.width = column_widths[5]
            end
                                                    # Cell is a group sub-table?
          elsif c.content.instance_of?(Prawn::Table)
            c.content.row_colors = (c.row % 2).zero? ? ["ffffff"] : ["eeeeee"]
          end
        end
      end
      pdf.move_down( 10 )
      pdf.stroke_horizontal_rule()
    end
  end 
  # ---------------------------------------------------------------------------


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
  # ---------------------------------------------------------------------------
end