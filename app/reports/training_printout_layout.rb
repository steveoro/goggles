# encoding: utf-8

=begin

== TrainingPrintoutLayout

- version:  4.00.161.20140128
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
  def self.render( options = { :label_hash => {} } )
    options[:pdf_format] = {
      :page_size      => 'A4',
      :page_layout    => :portrait,
                                                    # Document margins (in PS pts):
      :left_margin    => 30,
      :right_margin   => 30,
      :top_margin     => 40,
      :bottom_margin  => 40,
                                                    # Metadata:
      :info => {
        :Title        => options[ :report_title ],
        :Author       => AUTHOR_STRING,
        :Subject      => options[ :meta_info_subject ],
        :Keywords     => options[ :meta_info_keywords ],
        :Creator      => AUTHOR_STRING,
        :Producer     => "Prawn @ AgeX5 framework",
        :CreationDate => Time.now
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
      pdf.text( "<i>#{AUTHOR_STRING}</i>", :align => :center, :size => 6, :inline_format => true )
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
        :size => 6,
        :at => [50, 2],
        :width => pdf.bounds.width - 100,
        :height => 6,
        :align => :center
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
# DEBUG
#    puts "\r\n-----------------------------------------"
#    puts "#{options[:header_row].inspect}"
#    puts "#{options[:detail_rows].inspect}"
                                                    # Table data & column names adjustments:
    training = options[:header_row]
    detail_rows = options[:detail_rows]
                                                    # We must compose data for the table as an Array of Arrays:
    detail_table_array = detail_rows.collect{ |row| row.to_array() }

    whole_table_format_opts = {
      :header => false
    }

    pdf.bounding_box( [0, pdf.bounds.height - 40],
                  :width => pdf.bounds.width,
                  :height => pdf.bounds.height-80 ) do
                                                    # -- Report title and header:
      pdf.text(
        "<u><b>#{options[:report_title]}</b></u>",
        { :align => :left, :size => 10, :inline_format => true } 
      )
      pdf.text(
        "<i>#{I18n.t('activerecord.attributes.training.user')}:</i> #{training.get_user_name}",
        { :align => :left, :size => 10, :inline_format => true } 
      )
      pdf.text(
        "<i>#{I18n.t('activerecord.models.swimmer_level_type')}:</i> #{training.get_swimmer_level_type_description}",
        { :align => :left, :size => 10, :inline_format => true } 
      )
      pdf.move_down( 10 )

      pdf.text(
        training.description,
        { :align => :left, :size => 10, :inline_format => true } 
      )
      pdf.move_down( 10 )
                                                    # -- Main data table:
      pdf.table( detail_table_array, whole_table_format_opts ) do
        cells.style( :size => 8, :inline_format => true, :align => :left )
        columns(0).style( :align => :right )
        columns(2).style( :align => :right )
        cells.style do |c|
          if c.content.empty? || c.content.nil?
            c.background_color = "ffffff"
            c.borders = []
          else
            c.background_color = (c.row % 2).zero? ? "ffffff" : "eeeeee"
            case c.column
            when 0
              c.borders = [:top, :bottom, :left]
            when 1
              c.borders = [:top, :bottom, :right]
            when 2
              c.borders = [:top, :bottom, :left]
            when 3
              c.borders = [:top, :bottom, :right]
            end
          end
        end
        # rows(0).style(
          # :background_color => "c0ffc0",
          # :text_color       => "00076d",
          # :align            => :center,
          # :size             => 7,
          # :overflow         => :shrink_to_fit,
          # :min_font_size    => 6
        # )
      end

      pdf.move_down( 10 )
      pdf.text(
        "<i>#{I18n.t('trainings.total_meters')}:</i> #{training.compute_total_distance}",
        { :align => :left, :size => 10, :inline_format => true } 
      )
      pdf.move_down( 10 )
      pdf.stroke_horizontal_rule()
    end
  end 
  # ---------------------------------------------------------------------------


  def self.finalize_standard_report( pdf )
    page_num_text = "Pag. <page>/<total>"
    numbering_options = {
      :at => [pdf.bounds.right - 150, 2],
      :width => 150,
      :align => :right,
      :size => 6
    }
    pdf.number_pages( page_num_text, numbering_options )
  end
  # ---------------------------------------------------------------------------
end