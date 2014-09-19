# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_consts'


describe "FinResultParser parsing fixture file 1,", type: :integration do
  FIXTURE_FILE_1 = File.join(Rails.root, 'test/fixtures/samples/ris20120414molinella-sample.txt')

  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) { @result_hash = FinResultParser.parse_txt_file( FIXTURE_FILE_1 ) }


  it "returns an Hash" do
    expect( @result_hash ).to be_an_instance_of( Hash )
  end
  it "has the :parse_result key" do
    expect( @result_hash.has_key?( :parse_result ) ).to be true
  end
  it "has the :line_count key" do
    expect( @result_hash.has_key?( :line_count ) ).to be true
  end
  it "has the :total_data_rows key" do
    expect( @result_hash.has_key?( :total_data_rows ) ).to be true
  end
  it "has the :full_text_file_contents key" do
    expect( @result_hash.has_key?( :full_text_file_contents ) ).to be true
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "the :parse_result sub-member Hash," do
    subject { @result_hash[:parse_result] }

    it "recognizes a list of :category_header data pages" do
      expect( subject.has_key?( :category_header ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:category_header] ).to be_an_instance_of( Array )
      expect( subject[:category_header].size ).to eq( 16 )
    end

    it "recognizes a list of :result_row data pages" do
      expect( subject.has_key?( :result_row ) ).to be true
    end
    it "has the exact amount of :result_row data pages for this fixture" do
      expect( subject[:result_row] ).to be_an_instance_of( Array )
      expect( subject[:result_row].size ).to eq( 69 )
    end

    it "recognizes a list of :relay_header data pages" do
      expect( subject.has_key?( :relay_header ) ).to be true
    end
    it "has the exact amount of :relay_header data pages for this fixture" do
      expect( subject[:relay_header] ).to be_an_instance_of( Array )
      expect( subject[:relay_header].size ).to eq( 4 )
    end

    it "recognizes a list of :relay_row data pages" do
      expect( subject.has_key?( :relay_row ) ).to be true
    end
    it "has the exact amount of :relay_row data pages for this fixture" do
      expect( subject[:relay_row] ).to be_an_instance_of( Array )
      expect( subject[:relay_row].size ).to eq( 8 )
    end

    it "recognizes a list of :stats data pages" do
      expect( subject.has_key?( :stats ) ).to be true
    end
    it "has just 1 :stat (header) data page" do
      expect( subject[:stats] ).to be_an_instance_of( Array )
      expect( subject[:stats].size ).to eq( 1 )
    end

    it "recognizes a list of :stats details data pages" do
      expect( subject.has_key?( :stats_teams_tot ) ).to be true
      expect( subject.has_key?( :stats_teams_presence ) ).to be true
      expect( subject.has_key?( :stats_swimmer_tot ) ).to be true
      expect( subject.has_key?( :stats_swimmer_presence ) ).to be true
    end
    xit "has the exact amount of :stats details data pages for this fixture" do

    end

    # The key to the array of data-pages must always be present,
    # even though the array of data pages is empty:
    it "recognizes a list of :team_ranking data pages" do
      expect( subject.has_key?( :team_ranking ) ).to be true
    end
    # We want to be sure that the stats sub-page about the
    # enlisted Teams won't be mistaken for a :team_ranking
    # data-page:
    it "has no :team_ranking data page" do
      expect( subject[:team_ranking] ).to be_an_instance_of( Array )
      expect( subject[:team_ranking].size ).to eq( 0 )
    end

    # The key to the array of data-pages must always be present,
    # even though the array of data pages is empty:
    it "recognizes a list of :ranking_row data pages" do
      expect( subject.has_key?( :ranking_row ) ).to be true
    end
    it "has no :ranking_row data pages" do
      expect( subject[:ranking_row] ).to be_an_instance_of( Array )
      expect( subject[:ranking_row].size ).to eq( 0 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  xit "recognizes a 50FS FEM U25 category header" do

  end
  xit "recognizes a 50FS FEM M25 category header" do

  end
  xit "recognizes a 50FS FEM M30 category header" do

  end
  xit "recognizes a 50FS MAL M50 category header" do

  end
  xit "recognizes a 50FS MAL M55 category header" do

  end
  xit "recognizes a 50FS MAL M60 category header" do

  end
  xit "recognizes a 50FS MAL M65 category header" do

  end
  xit "recognizes a 50FS MAL M70 category header" do

  end
end
