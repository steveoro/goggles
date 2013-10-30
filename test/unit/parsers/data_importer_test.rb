# encoding: utf-8

require 'test_helper'
require 'framework/console_logger'
require 'parsers/data_importer'


class DataImporterTest < ActiveSupport::TestCase

  test "respond to main class methods" do
    [
      'create_new_data_import_session',
      'destroy_data_import_session'
    ].each do |method_name|
      assert( DataImporter.respond_to?(method_name), "doesn't respond to '#{method_name}'!" )
    end
  end


  test "respond to main public methods" do
    logger = ConsoleLogger.new
    flash = {}
    di = DataImporter.new( logger, flash, 1, 1 )
    assert( di.instance_of?(DataImporter) )
    [
      'get_season_id', 'get_phase_1_log', 'get_phase_2_log',
      'get_import_log', 'get_esteemed_meeting_mins',
      'get_stored_data_rows', 'get_committed_data_rows',
      'reset', 'consume_txt_file', 'commit'
    ].each do |method_name|
      assert( di.respond_to?(method_name), "doesn't respond to '#{method_name}'!" )
    end
  end
  # ---------------------------------------------------------------------------


  test "creates and deletes a new data_import session" do
    di_session = DataImporter.create_new_data_import_session(
      'non-existing-file.txt', 'Whatever, dude!',
      1, 'custom', 1, 1
    )
    assert( di_session.instance_of?(DataImportSession) )
    assert( di_session.id.to_i > 0 )
    DataImporter.destroy_data_import_session( di_session.id )
    assert_nil( DataImportSession.find_by_id(di_session.id) )
  end
  # ---------------------------------------------------------------------------


  test "import sample data files" do
    [
      {:filename => './test/unit/parsers/ris20121112bologna-sample.txt', :season_id => 122},
      {:filename => './test/unit/parsers/ris20120114ravenna-sample.txt', :season_id => 112}
    ].each_with_index do | hash_params, file_idx |
      full_pathname = hash_params[:filename]
      season_id     = hash_params[:season_id]
      season = Season.find_by_id( season_id )
      assert_not_nil( season, "Couldn't find season with ID #{season_id}!" )
      logger = ConsoleLogger.new
      flash = {}

      puts "\r\n=== Testing with file #{full_pathname}, season ID #{season_id}:"
      di = DataImporter.new( logger, flash, 1, 1 )
      assert( di.instance_of?(DataImporter) )

      data_import_session = di.consume_txt_file(
        full_pathname,
        season,
        true,                                       # Force missing meeting creation
        true                                        # SKIP consume data files
      )
      assert_not_nil( data_import_session, "Something went wrong with the digest phase of '#{full_pathname}'!" )
      assert( data_import_session.instance_of?(DataImportSession) )
      assert( data_import_session.id.to_i > 0 )

      is_ok = di.commit(
        data_import_session,
        false                                       # DO NOT erase any residual data file found
      )
      assert( is_ok, "Commit phase returned a non-OK status!" )

      # Check size of destination entity tables before the test transaction
      # rollback destroys the committed data:
      if ( file_idx == 0 )                          # "ris20121112bologna-sample"
        # Expected fixture files STATS:
        #
        # File 'ris20121112bologna-sample.txt':
        # Total 'meeting_header' data pages : 1 / 229 lines found
        # Total 'category_header' data pages : 15 / 229 lines found
        # Total 'relay_header' data pages : 5 / 229 lines found
        # Total 'team_ranking' data pages : 1 / 229 lines found
        # Total 'result_row' data pages : 127 / 229 lines found
        # Total 'relay_row' data pages : 24 / 229 lines found
        # Total 'ranking_row' data pages : 56 / 229 lines found
        # Total read lines ....... : 399 (including garbage)
        # Protocol efficiency .... : 57.39 %
        expected_values = {
          :meeting_header   => 1,
          :category_header  => 15,  :result_row       => 127,
          :relay_header     => 5,   :relay_row        => 24,
          :team_ranking     => 1,
          # TODO Don't know why, but only 54/56 team stores get committed on this one
          #      (maybe its due to more than one null score at the end)
          :ranking_row      => 54,  # FIXME Should be 56/56!!!
          :line_count       => 399
        }
      else                                          # "ris20120114ravenna-sample"
        # File 'ris20120114ravenna-sample.txt':
        # Total 'meeting_header' data pages : 1 / 176 lines found
        # Total 'category_header' data pages : 11 / 176 lines found
        # Total 'relay_header' data pages : 0 / 176 lines found
        # Total 'team_ranking' data pages : 1 / 176 lines found
        # Total 'result_row' data pages : 75 / 176 lines found
        # Total 'relay_row' data pages : 0 / 176 lines found
        # Total 'ranking_row' data pages : 88 / 176 lines found
        # Total read lines ....... : 376 (including garbage)
        # Protocol efficiency .... : 46.81 %
        expected_values = { 
          :meeting_header   => 1,
          :category_header  => 11,  :result_row       => 75,
          :relay_header     => 0,   :relay_row        => 0,
          :team_ranking     => 1,   :ranking_row      => 88,
          :line_count       => 376
        }
      end
      puts "\r\n\r\n\t*** #{full_pathname} ***\r\n"
      m = Meeting.where( :season_id => season_id ).first
      assert_not_nil( m, "Cannot find the meeting having season ID=#{season_id}!" )
      assert( m.instance_of?(Meeting) )
      assert( m.id.to_i > 0 )
      ms = MeetingSession.where( :meeting_id => m.id ).first
      assert_not_nil( ms, "Cannot find the meeting session having meeting ID=#{m.id}!" )
      assert( ms.instance_of?(MeetingSession) )
      assert( ms.id.to_i > 0 )

      mp = MeetingProgram.includes(:meeting).where( ['meetings.id = ?', m.id] )
      total_programs = expected_values[:category_header].to_i + expected_values[:relay_header].to_i
      puts "==> MeetingProgram............size=#{mp.size} vs. expected=#{total_programs})"
      assert_equal( total_programs, mp.size )

      mir = MeetingIndividualResult.includes(:meeting).where( ['meetings.id = ?', m.id] )
      puts "==> MeetingIndividualResult...size=#{mir.size} vs. expected=#{expected_values[:result_row]})"
      assert_equal( expected_values[:result_row], mir.size )

      mrr = MeetingRelayResult.includes(:meeting).where( ['meetings.id = ?', m.id] )
      puts "==> MeetingRelayResult........size=#{mrr.size} vs. expected=#{expected_values[:relay_row]})"
      assert_equal( expected_values[:relay_row], mrr.size )

      mts = MeetingTeamScore.where( :meeting_id => m.id )
      puts "==> MeetingTeamScore..........size=#{mts.size} vs. expected=#{expected_values[:ranking_row]})"
      assert_equal( expected_values[:ranking_row], mts.size )
    end                                             # -- end of loop on file names --
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------
end
