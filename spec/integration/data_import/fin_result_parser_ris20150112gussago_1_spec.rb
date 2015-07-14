# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "FinResultParser parsing FIN Relay Result file type 1 (extended),", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @result_hash = V2::FinResultParser.parse_txt_file(
      File.join(Rails.root, 'test/fixtures/samples/ris20150112gussago_1.txt'),
      nil,                                          # We don't care for logging, here
      V2::FinResultDefs.new                             # This will forcibly plug-in the correct parsing engine
    )
# DEBUG
#    @result_hash[:parse_result].keys.each do |key|
#      puts "\r\n--- @result_hash[:parse_result][#{key}]:\r\n" <<
#           "[ #{@result_hash[:parse_result][key].map{|hash| hash.inspect }.join("\r\n")} ]"
#    end
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


    it "recognizes a list of :relay_header data pages" do
      expect( subject.has_key?( :relay_header ) ).to be true
    end
    it "has the exact amount of :relay_header data pages for this fixture" do
      expect( subject[:relay_header] ).to be_an_instance_of( Array )
      expect( subject[:relay_header].size ).to eq( 8 )
    end

    context "for :event_relay rows," do
      [
        [ 0, "staffetta 4x50 stile libero  Femminile", "4x50", "stile libero", "Femminile", "M100-119", "1'51\"90" ],
        [ 1, "staffetta 4x50 stile libero  Femminile", "4x50", "stile libero", "Femminile", "M120-159", "1'51\"06" ],
        [ 2, "staffetta 4x50 stile libero  Femminile", "4x50", "stile libero", "Femminile", "M160-199", "1'53\"20" ]
      ].each do |event_index, type, distance, style, gender, category_group, base_time|
        context "in '#{distance}-#{style}-#{gender}'," do
          it "has the exact values for this fixture" do
            data_page_field_hash = subject[:relay_header][event_index][:fields]
# DEBuG
#            puts "\r\nMem keys: #{ subject[:relay_header].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#            puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
            expect( data_page_field_hash ).to be_an_instance_of( Hash )
            expect( data_page_field_hash[ :type ]           ).to eq( type )
            expect( data_page_field_hash[ :distance ]       ).to eq( distance )
            expect( data_page_field_hash[ :style ]          ).to eq( style )
            expect( data_page_field_hash[ :gender ]         ).to eq( gender )
            expect( data_page_field_hash[ :category_group ] ).to eq( category_group )
            expect( data_page_field_hash[ :base_time ]      ).to eq( base_time )
          end
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :relay_row data pages" do
      expect( subject.has_key?( :relay_row ) ).to be true
    end
    it "has the exact amount of :relay_rows for this fixture" do
      expect( subject[:relay_row] ).to be_an_instance_of( Array )
      expect( subject[:relay_row].size ).to eq( 61 )
    end

    context "for :relay_row rows," do
      [
        [ 0, nil,  "MASTER AICS BRESCIA", "1'55\"30", "970,51" ],
        [ 1, "2", "ESC SSD - BRESCIA", "1'56\"31", "962,08" ],
        [ 2, "3", "AICS PAVIA N", "2'00\"57", "928,09" ],
        [ 3, "4", "VILLA BONELLI NUOTO", "2'10\"96", "854,46" ],
        [ 4, "5", "MILANO NUOTO MASTER", "2'14\"62", "831,23" ],
        [ 5, "Fuori gara", "PROSPORT ACQUA SSD", "2'17\"64", "812,99" ],

        [ 6, "1", "MILANO NUOTO MASTER", "2'02\"91", "903,59" ],
        [ 7, "2", "ESC SSD - BRESCIA", "2'10\"25", "852,67" ],
        [ 8, "3", "GESTISPORT COOP", "2'16\"18", "815,54" ],
        [ 9, "4", "ALBATROS ASD LUMEZZ", "2'26\"73", "756,90" ],
        [ 10, "5", "NDC LEGNANO", "2'34\"36", "719,49" ],
        [ 11, "Fuori gara", "CN UISP BOLOGNA", "2'25\"46", "763,51" ],

        [ 12, "1", "MASTER AICS BRESCIA", "1'56\"13", "974,77" ],
        [ 13, "2", "MILANO NUOTO MASTER", "2'19\"35", "812,34" ],

        [ 14, "1", "CN UISP BOLOGNA", "2'25\"94", "821,16" ],

        [ 15, "1", "GYMNASIUM SPILIMBER", "1'37\"08", "964,77" ],
        [ 16, "2", "ESC SSD - BRESCIA", "1'38\"93", "946,73" ],
        [ 17, "3", "H. SPORT SSD - PRAT", "1'44\"18", "899,02" ],
        [ 18, "4", "AICS PAVIA N", "1'55\"38", "811,75" ],
        [ 19, "5", "ALBATROS ASD LUMEZZ", "1'57\"92", "794,27" ],
        [ 20, "Fuori gara", "PROSPORT ACQUA SSD", "1'59\"85", "781,48" ],
        [ 21, "Fuori gara", "G.A.M. TEAM", "2'12\"19", "708,53" ],

        [ 22, nil, "VILLA BONELLI NUOTO", "0'00\"00", nil ]
        # TODO ...

      ].each do |event_index, result_position, team_name, result_time, result_score|
        context "in (#{event_index})'#{team_name}-#{result_time}-#{result_score}'," do
          it "has the exact values for this fixture" do
            data_page_field_hash = subject[:relay_row][event_index][:fields]
# DEBuG
#            puts "\r\nMem keys: #{ subject[:relay_row].map{|row_hash| row_hash[:id] }.join("\r\n") }"
            puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
            expect( data_page_field_hash ).to be_an_instance_of( Hash )
            expect( data_page_field_hash[ :result_position ] ).to eq( result_position )
            expect( data_page_field_hash[ :team_name ]       ).to eq( team_name )
            expect( data_page_field_hash[ :result_time ]     ).to eq( result_time )
            expect( data_page_field_hash[ :result_score ]    ).to eq( result_score )
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
