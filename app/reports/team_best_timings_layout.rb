# encoding: utf-8

=begin

== TeamBestTimingsLayout

- version:  6.102
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
        # *** START Pool loop:
        team_best_finder.pool_types.each do |pool_type|
          # *** Gender & pool title:
          pdf.text(
            "<b>#{gender_type.i18n_alternate}, #{pool_type.i18n_description}</b>",
            { align: :left, size: 10, inline_format: true }
          )

          # *** Prepare data table:
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

          # *** Render table using data:
          pdf.table(
              data_table_array,
              header: true, position: :left,
              row_colors: ["ffffff", "eeeeee"],
              width: pdf.bounds.width - 10,
              cell_style: {
                inline_format: true,
                overflow: :shrink_to_fit,
                size: 6
#                min_font_size: 6
              }
          ) do # Custom styling for each cell:
            # Header row & column:
            cells.filter do |c|
              ( c.column == 0 ) || ( c.row == 0 )
            end.style do |c|
              c.background_color = "C4E3F3"           # light cyan
              c.size = 6
            end

            # Any data timing cell:
            cells.filter do |c|
              ( c.column > 0 ) && ( c.row > 0 )
            end.style do |c|
              c.align = :center
              c.valign = :center
              c.size = 6
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
