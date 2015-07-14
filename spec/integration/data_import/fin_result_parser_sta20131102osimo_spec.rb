# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "FinResultParser parsing fixture file sta20131102osimo,", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @result_hash = V2::FinResultParser.parse_txt_file(
      File.join(
        Rails.root,
        'test/fixtures/samples/sta20131102osimo.txt'
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
        expect( data_page_field_hash[ :title ]         ).to eq( '1° Meeting Senza Testa' )
        expect( data_page_field_hash[ :meeting_dates ] ).to be nil
        expect( data_page_field_hash[ :organization ]  ).to eq( 'Team Osimo Nuoto' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :category_header data pages" do
      expect( subject.has_key?( :event_individual ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:event_individual] ).to be_an_instance_of( Array )
      expect( subject[:event_individual].size ).to eq( 14 )
    end

    context "for :event_individual rows," do
      [
        [  0, '400', 'SL' ],
        [  1,  '50', 'FA' ],
        [  2, '100', 'DO' ],
        [  3, '200', 'RA' ],
        [  4, '200', 'SL' ],
        [  5, '100', 'FA' ],
        [  6, '200', 'DO' ],
        [  7,  '50', 'RA' ],
        [  8, '100', 'SL' ],
        [  9, '200', 'MI' ],
        [ 10,  '50', 'SL' ],
        [ 11, '200', 'FA' ],
        [ 12,  '50', 'DO' ],
        [ 13, '100', 'RA' ]
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
      expect( subject[:entry_row].size ).to eq(
        43 + 34 + 21 + 16 + 24 + 11 + 29 + 35 + 14 + 53 + 26 + 23
      )
    end

    context "for :entry_row rows," do
      [
        # '400 SL' samples
        [   1,   "2", "AUTULY  VALÉRIE", "M50", "POLISPORT SRL", "8'00\"00" ],
        [  10,  "11", "SABALICH  ALESSIO GIOVANNI", "M45", "IL GRILLO", "6'30\"00" ],
        [  21,  "22", "D`AURIZIO  CLAUDIA", "M40", "ASD CLUB L`AQUILA N", "6'00\"00" ],

        # '50 FA' samples
        [  43,   "1", "MONTAGNANI  CARLO WILLIAM", "M65", "AZZURRA RACE TEAM", "0'50\"00" ],
        [  53,  "11", "MELLOZZI  MASSIMO", "M50", "POOL N SAMBENEDETTE", "0'38\"00" ],
        [  62,  "20", "FLORINDI  ALESSANDRO", "M40", "AS ACQUAZZURRA ATR", "0'34\"00" ],

        # '100 DO' samples
        [  77,   "1", "FRANCHI  BIANCA MARIA", "M65", "G.S. SAMB 87 A.S.D.", "2'12\"00" ],
        [  86,  "10", "VELARDI  EUGENIO", "M60", "C.C. ANIENE ASD", "1'37\"00" ],
        [  96,  "20", "CRESCENTINI  ROBERTA", "M35", "AS LARUS NUOTO", "1'12\"00" ],

        # '200 RA' samples
        [  98,   "1", "MONTAGNANI  CARLO WILLIAM", "M65", "AZZURRA RACE TEAM", "4'30\"00" ],
        [ 107,  "10", "FIORI  VALERIO", "M25", "KOMAROS SUB ANCONA", "3'25\"00" ],

        # '200 SL' samples
        [ 114,   "1", "AGRESTINI  PIERFRANCO", "M70", "POL. COM. RICCIONE", "3'40\"00" ],
        [ 129,  "16", "FATI POZZO DI VALLE  GIULIA", "U25", "KOMAROS SUB ANCONA", "2'35\"00" ],

        # '100 FA' samples
        [ 138,   "1", "BRADASCHIA  MAURIZIO", "M50", "TRIESTINA NUOTO US", "1'45\"00" ],
        [ 141,   "4", "MEDICI  GIACOMO", "M25", "TEAM MARCHE MASTER", "1'04\"00" ]

        # TODO Add more testing samples
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
