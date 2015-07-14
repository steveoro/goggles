# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "FinResultParser parsing fixture file sta20140308firenze,", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @result_hash = V2::FinResultParser.parse_txt_file(
      File.join(
        Rails.root,
        'test/fixtures/samples/sta20140308firenze-sample.txt'
      )
    )
  end

  it "returns an Hash" do
    expect( @result_hash ).to be_an_instance_of( Hash )
  end
  it "has the :parse_result, :line_count, :total_data_rows & :full_text_file_contents keys" do
    expect( @result_hash.keys ).to contain_exactly(
      :parse_result, :parsing_defs, :line_count, :total_data_rows, :full_text_file_contents
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "the :parse_result sub-member Hash," do
    subject { @result_hash[:parse_result] }

    it "recognizes a list of :meeting_header data pages" do
      expect( subject.has_key?( :meeting_header ) ).to be true
    end
    it "has just 1 :meeting_header data page for this fixture" do
      expect( subject[:meeting_header] ).to be_an_instance_of( Array )
      expect( subject[:meeting_header].size ).to eq( 1 )
    end
    context "for the :meeting_header data page," do
      it "has the exact values for all :meeting_header fields of this fixture" do
        data_page_field_hash = subject[:meeting_header].first[:fields]
# DEBuG
#        puts "\r\nMem keys: #{ subject[:meeting_header].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#        puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
        expect( data_page_field_hash ).to be_an_instance_of( Hash )
        expect( data_page_field_hash[ :title ]         ).to eq( '20° Tr Città di Firenze' )
        expect( data_page_field_hash[ :meeting_dates ] ).to be nil
        expect( data_page_field_hash[ :organization ]  ).to eq( 'Firenze Nuota Master' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :category_header data pages" do
      expect( subject.has_key?( :event_individual ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:event_individual] ).to be_an_instance_of( Array )
      expect( subject[:event_individual].size ).to eq( 3 )
    end

    context "for :event_individual rows," do
      [
        [  0, '100', 'FA' ],
        [  1,  '50', 'FA' ],
        [  2, '400', 'MI' ]
      ].each do |event_index, distance, style, gender|
        context "in '#{distance}-#{style}-#{gender}'," do
          it "has the exact values for this fixture" do
            data_page_field_hash = subject[:event_individual][event_index][:fields]
# DEBuG
#            puts "\r\nMem keys: #{ subject[:event_individual].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#            puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
            expect( data_page_field_hash ).to be_an_instance_of( Hash )
            expect( data_page_field_hash[ :distance ] ).to eq( distance )
            expect( data_page_field_hash[ :style ]    ).to eq( style )
            expect( data_page_field_hash[ :gender ]   ).to eq( gender )
          end
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    it "recognizes a list of :entry_row data pages" do
      expect( subject.has_key?( :entry_row ) ).to be true
    end
    it "has the exact amount of :entry_row for this fixture" do
      expect( subject[:entry_row] ).to be_an_instance_of( Array )
      expect( subject[:entry_row].size ).to eq( 72 + 147 + 35 )
    end

    context "for :entry_row rows," do
      [
        # '100 FA' samples
        [   9,  "10", "MERCATELLI ALESSANDRO", "M 35", "AMICI DEL NUOTO FIRENZE", "01.38.00" ],
        [  14,  "15", "VELARDI EUGENIO", "M 60", "CIRCOLO CANOTTIERI ANIENE", "01.31.70" ],
        [  18,  "19", "CAPOBIANCO DONATO", "M 50", "POLISPORTIVA SANGIULIANESE", "01.30.00" ],
        [  45,  "46", "ALFANO ARIANNA", "M 25", "SPORTING CLUB TUSCOLANO", "01.15.00" ],
        [  54,  "55", "BALATRESI ELISA", "M 25", "NUOTOPIU' ACADEMY", "01.11.00" ],
        [  69,  "70", "STEFANORI ENRICO", "M 30", "KLAB NUOTO MASTER", "01.01.00" ],

        # '50 FA' samples
        [  72,   "1", "BALLI MARIO", "M 65", "FIRENZE NUOTA MASTER", "01.10.00" ],
        [  81,  "10", "GAGLIARDI GABRIELE", "M 55", "DIMENSIONE NUOTO PONTEDERA", "00.50.00" ],
        [ 128,  "57", "ROMANELLI VALERIA", "M 25", "U.S. DIL. NUOTO MONTEFELTRO", "00.38.00" ],
        [ 129,  "58", "FARNETANO MARIA GIUSEPPIN", "M 40", "NUOTOPIU' ACADEMY", "00.38.00" ],
        [ 149,  "78", "BRENDAGLIA SERENA", "M 35", "NUOTO LIFE STYLE A.S.DILETT", "00.35.00" ],
        [ 168,  "97", "SEMPROLI SILVIA", "M 25", "POLISPORTIVA GARDEN SRL S.S. DILETT", "00.33.00" ],
        [ 203, "132", "MOROZZI OSCAR", "M 25", "01 ZEROUNO SSD - FIRENZE", "00.29.10" ],

        # '400 MI' samples
        [ 219,   "1", "NARDI MARINA", "M 55", "SPORTING CLUB TUSCOLANO", "08.30.00" ],
        [ 228,  "10", "HARMER JANET STUART", "M 55", "NUOTOPIU' ACADEMY", "06.50.00" ],
        [ 232,  "14", "FOLINI FRANCESCO", "U 25", "AMICI DEL NUOTO FIRENZE", "06.30.00" ],
        [ 242,  "24", "ROMANELLI VALERIA", "M 25", "U.S. DIL. NUOTO MONTEFELTRO", "06.00.00" ],
        [ 252,  "34", "GIOVANNINI LORENZO", "M 25", "NUOTOPIU' ACADEMY", "04.59.90" ]
      ].each do |event_index, entry_order, swimmer_name, category_group, team_name, entry_time|
        context "in (#{event_index})'#{entry_order}-#{swimmer_name}-#{entry_time}'," do
          it "has the exact values for this fixture" do
            data_page_field_hash = subject[:entry_row][event_index][:fields]
# DEBuG
#            puts "\r\nMem keys: #{ subject[:entry_row].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#            puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
            expect( data_page_field_hash ).to be_an_instance_of( Hash )
            expect( data_page_field_hash[ :entry_order ] ).to eq( entry_order )
            expect( data_page_field_hash[ :swimmer_name ]    ).to eq( swimmer_name )
            expect( data_page_field_hash[ :category_group ]    ).to eq( category_group )
            expect( data_page_field_hash[ :team_name ]       ).to eq( team_name )
            expect( data_page_field_hash[ :entry_time ]     ).to eq( entry_time )
          end
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

  end
  #-- -------------------------------------------------------------------------
  #++
end
