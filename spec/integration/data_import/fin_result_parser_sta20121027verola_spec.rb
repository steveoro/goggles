# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "FinResultParser parsing fixture file sta20121027verola,", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @result_hash = V2::FinResultParser.parse_txt_file(
      File.join(
        Rails.root,
        'test/fixtures/samples/sta20121027verolanuova.txt'
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
        expect( data_page_field_hash[ :title ]         ).to eq( '12° Trofeo Città di Verolanuova' )
        expect( data_page_field_hash[ :meeting_dates ] ).to eq( '27-28 Ottobre 2012' )
        expect( data_page_field_hash[ :organization ]  ).to eq( 'Verolanuoto' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :category_header data pages" do
      expect( subject.has_key?( :event_individual ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:event_individual] ).to be_an_instance_of( Array )
      expect( subject[:event_individual].size ).to eq( 8 )
    end

    context "for :event_individual rows," do
      [
        [ 0, '400', 'SL' ],
        [ 1, '100', 'MI' ],
        [ 2, '100', 'SL' ],
        [ 3,  '50', 'RA' ],
        [ 4,  '50', 'FA' ],
        [ 5, '200', 'MI' ],
        [ 6,  '50', 'DO' ],
        [ 7,  '50', 'SL' ]
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
      expect( subject[:entry_row].size ).to eq( 70 + 169 )
    end

    context "for :entry_row rows," do
      [
        # '400 stile libero Femmine' samples
        [   4,   "5", "D`ADDEZIO  SILVIA", "M35", "CAN BALDESIO", "8'00\"00" ],
        [  29,  "30", "ROVIDA  MARIA CRISTINA", "M50", "MASTER MELZO N", "6'16\"00" ],
        [  48,  "49", "BURINI  SIMONA", "M40", "NUOTOPIÙ ACADEMY AS", "5'40\"00" ],
        [  52,  "53", "PERUZZO  FEDERICA", "M30", "GIS-GEST. IMPIANTI", "5'36\"00" ],
        [  56,  "57", "TERNA  FRANCESCA ELENA", "M25", "SONCINO SC SRL", "5'30\"00" ],
        # '400 stile libero Maschi' samples
        [  71,   "2", "SALA  WALTER", "M65", "REZZATO N", "8'30\"00" ],
        [  90,  "21", "FORMENTI  RENATO", "M45", "BARZANÒ ACQUACLUB S", "6'50\"00" ],
        [ 102,  "33", "TONINELLI  MICHELE", "M30", "STRADIVARI NUOTO AS", "6'30\"00" ],
        [ 110,  "41", "BERTAIOLA  ANDREA", "M35", "TENNIS CLUB PESCHIE", "6'20\"00" ],
        [ 180, "111", "LACCISAGLIA  LEONARDO MATTIA", "M35", "TEAM NUOTO LOMBARDI", "5'15\"00" ]
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
