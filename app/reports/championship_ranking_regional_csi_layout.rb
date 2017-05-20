# encoding: utf-8

=begin

== ChampionshipRankingRegionalCSILayout

- version:  6.109
- author:   Steve A.

=end
class ChampionshipRankingRegionalCSILayout
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
  # - <tt>:championship_dao<\tt> (required) => a ChampionshipDAO instance
  #
  def self.render( options )
    Prawn::Font::AFM.hide_m17n_warning = true

    options[:pdf_format] = {
      page_size:      'A4',
      page_layout:    :portrait,
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
    champ_dao = options[:championship_dao]

    pdf.bounding_box( [0, pdf.bounds.height - 40],
                      width: pdf.bounds.width, height: pdf.bounds.height-80 ) do
      # -- Report title and header:
      pdf.text(
        "<u><b>#{ options[:report_title] }</b></u>",
        { align: :center, size: 10, inline_format: true }
      )
      pdf.move_down( 10 )

      # *** Prepare data table:
      data_table_array = []
      # Prepare the first data row, with the labels:
      row_cells = [
        "<b>#{ I18n.t('championships.position') }</b>",
        "<b>#{ I18n.t('championships.team') }</b>"
      ]
      # Add a label for each meeting in the Championship:
      champ_dao.meetings.each do |meeting|
        row_cells << "<i>#{ meeting.get_city }</i><br/>(#{ meeting.get_meeting_date }) #{ I18n.t('championships.meeting_total') }"
      end
      row_cells << "<b>#{ I18n.t('championships.total_points') }</b>"
      # Add the first row to the data matrix that will be rendered afterwards:
      data_table_array << row_cells

      # Prepare actual data. For each team score...
      champ_dao.team_scores.each_with_index do |team_score, index|
        row_cells = [
          "<b>#{ (index + 1).to_i }</b>",
          team_score.team.get_full_name
        ]
        # For each meeting in the Championship...
        champ_dao.meetings.each_with_index do |meeting, index_meeting|
          # Compute total team score for each meeting:
          meeting_total = 0
          champ_dao.columns.each do |column|
            meeting_total += team_score.meetings[index_meeting][column].to_i if team_score.meetings[ index_meeting ]
          end
          # Add the total score to the cell rows:
          row_cells << "<b>#{ meeting_total.to_i }</b>"
        end
        # Add the overall total score:
        row_cells << "<b>#{ team_score.total_points.to_i }</b>"

        # Add the currently prepared data row to the data matrix:
        data_table_array << row_cells
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
#      pdf.start_new_page unless (
#         ( gender_type.id == team_best_finder.gender_types.last.id ) &&
#         ( pool_type.id == team_best_finder.pool_types.last.id )
#      )
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
