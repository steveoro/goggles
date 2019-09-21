# encoding: utf-8

=begin

== GoggleCupRankingLayout

- version:  6.341
- author:   Steve A.

=end
class GoggleCupRankingLayout
  require "prawn"
  require 'common/format'

  AUTHOR_STRING = '--=[  Goggles  -o^o-  ]=-- / (p) 2013-2018' unless defined?(AUTHOR_STRING)

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
  # - <tt>:view_context<\tt> (required) => the rendering view_context in order to access assets paths
  #
  # - <tt>:ranking<\tt> (required) => the result from @goggle_cup.calculate_goggle_cup_rank,
  #   which is expected to be an array of Hash, having the following minimum structure fields:
  #
  #   {
  #     swimmer: <swimmer_name>, total: <total_score>,
  #     average: <avg_score>, max: <max_score>, min: <min_score>
  #   }
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


  # Returns the cell decoration data corresponding to the specified rank number.
  # Typically this will be a medal image for ranks [1..3] and an empty string
  # for all other values.
  #
  def self.get_medal_for( rank, options )
#    view_context = options[:view_context]
    case rank.to_i
    when 1
      {
#        image: File.join( Rails.root, 'public', view_context.image_path("medal_gold_3.png") ),
        image: File.join( Rails.root, 'public', 'images', 'medal_gold_3.png' ),
        scale: 0.6,
        position: :center
      }
    when 2
      {
#        image: File.join( Rails.root, 'public', view_context.image_path("medal_silver_3.png") ),
        image: File.join( Rails.root, 'public', 'images', 'medal_silver_3.png' ),
        scale: 0.6,
        position: :center
      }
    when 3
      {
#        image: File.join( Rails.root, 'public', view_context.image_path("medal_bronze_3.png") ),
        image: File.join( Rails.root, 'public', 'images', 'medal_bronze_3.png' ),
        scale: 0.6,
        position: :center
      }
    else
      ""
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Builds the report body, redifining also the margins to avoid overwriting on
  # page headers and footers.
  #
  def self.build_report_body( pdf, options )
    ranking_list = options[:ranking]

    pdf.bounding_box( [0, pdf.bounds.height - 40],
                      width: pdf.bounds.width, height: pdf.bounds.height-80 ) do
      # -- Report title and header:
      pdf.text(
        "<u><b>#{ options[:report_title] }</b></u>",
        { align: :center, size: 10, inline_format: true }
      )
      pdf.move_down( 10 )

      # *** Prepare data table:
      data_table_array = [
        # Prepare the first data row, with the labels:
        [
          "<b>#{ I18n.t('rank') }</b>",
          " ",
          "<b>#{ I18n.t('activerecord.models.swimmer') }</b>",
          "<b>#{ I18n.t('total') }</b>",
          "<b>#{ I18n.t('goggle_cup.count') }</b>",
          "<b>#{ I18n.t('average') }</b>",
          "<b>#{ I18n.t('max') }</b>",
          "<b>#{ I18n.t('min') }</b>"
        ]
      ]

      # Prepare actual data. For each team score...
      previous_score = 0
      rank = 0
      ranking_list.each_with_index do |rank_element, index|
        # compute actual rank:
        rank += 1 if ( previous_score != rank_element[:total] )
        previous_score = rank_element[:total]

        # Add the data row to the data matrix:
        data_table_array << [
          "<b>#{ rank }</b>",
          self.get_medal_for( rank, options ),
          rank < 4 ? "<b>#{ rank_element[:swimmer].decorate.get_full_name }</b>" : rank_element[:swimmer].decorate.get_full_name,
          rank < 4 ? sprintf( "<b>%02.2f</b>", rank_element[:total] ) : sprintf( "%02.2f", rank_element[:total] ),
          rank_element[:count],
          sprintf( "%02.2f", rank_element[:average] ),
          sprintf( "%02.2f", rank_element[:max] ),
          sprintf( "%02.2f", rank_element[:min] )
        ]
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
          c.align = :center
        end

        # Any data timing cell:
        cells.filter do |c|
          ( c.column > 1 ) && ( c.row > 0 )
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
