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
    di = DataImporter.new( logger, flash, 1 )
    assert( di.instance_of?(DataImporter) )
    [
      'get_phase_1_log', 'get_phase_2_log',
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
      {:filename => File.join(Rails.root, 'test/fixtures/samples/ris20111203riccione-sample.txt'),  season_id: 112},
      {:filename => File.join(Rails.root, 'test/fixtures/samples/ris20121112bologna-sample.txt'),   season_id: 122},
      {:filename => File.join(Rails.root, 'test/fixtures/samples/ris20120114ravenna-sample.txt'),   season_id: 112}
    ].each_with_index do | hash_params, file_idx |
      full_pathname = hash_params[:filename]
      season_id     = hash_params[:season_id]
      season = Season.find_by_id( season_id )       # season instance will be used later for assertion
      assert_not_nil( season, "Couldn't find season with ID #{season_id}!" )
      logger = ConsoleLogger.new
      flash = {}

      puts "\r\n=== Testing file #{full_pathname}, expecting to find (after data-import) a Meeting with season ID #{season_id}:"
      di = DataImporter.new( logger, flash, 1 )
      assert( di.instance_of?(DataImporter) )

      data_import_session = di.consume_txt_file(
        full_pathname,
        nil,                                        # Force auto-detect of the season from path/file name
        true,                                       # Force missing meeting creation
        true,                                       # Force missing team creation
        true                                        # SKIP consume data files
      )
      assert_not_nil( data_import_session, "Something went wrong with the digest phase of '#{full_pathname}'!" )
      assert( data_import_session.instance_of?(DataImportSession) )
      assert( data_import_session.id.to_i > 0 )

      expected_values = get_expected_values( file_idx )

                                                    # === TEST PHASE 1/2:
      # Check size of destination entity tables before the test transaction
      # rollback destroys the committed data:
      puts "\r\n\r\n\t*** #{full_pathname} ***\r\n"
      m = DataImportMeeting.where( data_import_session_id: data_import_session.id ).first
      assert_not_nil( m, "Cannot find DataImportMeeting with :data_import_session_id ID=#{data_import_session.id}!" )
      assert( m.instance_of?(DataImportMeeting) )
      assert( m.id.to_i > 0 )
      assert_equal( season.id, m.season_id )
      header_date = m.header_date
      description = m.description

      ms = DataImportMeetingSession.where( data_import_session_id: data_import_session.id ).first
      assert_not_nil( ms, "Cannot find the meeting session having meeting ID=#{m.id}!" )
      assert( ms.instance_of?(DataImportMeetingSession) )
      assert( ms.id.to_i > 0 )

#      mp = DataImportMeetingProgram.includes(:data_import_meeting).where( ['data_import_meetings.id = ?', m.id] )
      mp = DataImportMeetingProgram.where( data_import_session_id: data_import_session.id ).count
      total_programs = expected_values[:category_header].to_i + expected_values[:relay_header].to_i
      puts "==> DataImportMeetingProgram............count=#{mp} vs. expected=#{total_programs})"
      assert_equal( total_programs, mp )

      mir = DataImportMeetingIndividualResult.includes(:data_import_meeting).where( ['data_import_meetings.id = ?', m.id] ).count
      puts "==> DataImportMeetingIndividualResult...count=#{mir} vs. expected=#{expected_values[:result_row] })"
      assert_equal( expected_values[:result_row], mir )

      mrr = DataImportMeetingRelayResult.includes(:data_import_meeting).where( ['data_import_meetings.id = ?', m.id] ).count
      puts "==> DataImportMeetingRelayResult........count=#{mrr} vs. expected=#{expected_values[:relay_row] })"
      assert_equal( expected_values[:relay_row], mrr )

#      mts = DataImportMeetingTeamScore.where( data_import_meeting_id: m.id )
      mts = DataImportMeetingTeamScore.where( data_import_session_id: data_import_session.id ).count
      puts "==> DataImportMeetingTeamScore..........count=#{mts} vs. expected=#{expected_values[:ranking_row] })"
      assert_equal( expected_values[:ranking_row], mts )

                                                    # === TEST PHASE 3:
      is_ok = di.commit(
        data_import_session,
        false                                       # DO NOT erase any residual data file found
      )
      assert( is_ok, "Commit phase returned a non-OK status!" )

      # Check size of destination entity tables before the test transaction
      # rollback destroys the committed data:
      puts "\r\n\r\n\t*** #{full_pathname} ***\r\n"
      m = Meeting.where(
        [ "(header_date = ?) AND (season_id = ?) AND (description = ?)",
          header_date, season_id, description ]
      ).first
      puts "Found committed Meeting: #{m.get_verbose_name}, #{header_date}\r\n"

      assert_not_nil( m, "Cannot find the meeting having season ID=#{season_id}!" )
      assert( m.instance_of?(Meeting) )
      assert( m.id.to_i > 0 )
      assert_equal( season.id, m.season_id )

      ms = MeetingSession.where( meeting_id: m.id ).first
      assert_not_nil( ms, "Cannot find the meeting session having meeting ID=#{m.id}!" )
      assert( ms.instance_of?(MeetingSession) )
      assert( ms.id.to_i > 0 )

      mp = MeetingProgram.includes(:meeting).where( ['meetings.id = ?', m.id] ).count
      total_programs = expected_values[:category_header].to_i + expected_values[:relay_header].to_i
      puts "==> MeetingProgram............count=#{mp} vs. expected=#{total_programs})"
      assert_equal( total_programs, mp )

      mir = MeetingIndividualResult.includes(:meeting).where( ['meetings.id = ?', m.id] ).count
      puts "==> MeetingIndividualResult...count=#{mir} vs. expected=#{expected_values[:result_row] })"
      assert_equal( expected_values[:result_row], mir )

      mrr = MeetingRelayResult.includes(:meeting).where( ['meetings.id = ?', m.id] ).count
      puts "==> MeetingRelayResult........count=#{mrr} vs. expected=#{expected_values[:relay_row] })"
      assert_equal( expected_values[:relay_row], mrr )

      mts = MeetingTeamScore.where( meeting_id: m.id ).count
      puts "==> MeetingTeamScore..........count=#{mts} vs. expected=#{expected_values[:ranking_row] })"
      assert_equal( expected_values[:ranking_row], mts )
    end                                             # -- end of loop on file names --
  end
  # ---------------------------------------------------------------------------


  def get_expected_values( file_idx )
    expected_values = {}
    case file_idx
    when 0
      # File 'ris20111203riccione-sample.txt':
      # Total 'meeting_header' data pages : 1 / 286 lines found
      # Total 'category_header' data pages : 6 / 286 lines found
      # Total 'relay_header' data pages : 0 / 286 lines found
      # Total 'team_ranking' data pages : 1 / 286 lines found
      # Total 'stats' data pages : 0 / 286 lines found
      # Total 'result_row' data pages : 144 / 286 lines found
      # Total 'relay_row' data pages : 0 / 286 lines found
      # Total 'ranking_row' data pages : 134 / 286 lines found
      # Total 'stats_teams_tot' data pages : 0 / 286 lines found
      # Total 'stats_teams_presence' data pages : 0 / 286 lines found
      # Total 'stats_swimmer_tot' data pages : 0 / 286 lines found
      # Total 'stats_swimmer_presence' data pages : 0 / 286 lines found
      # Total read lines ....... : 308 (including garbage)
      # Protocol efficiency .... : 92.86 %
      expected_values = {
        :meeting_header     => 1,
        :category_header    => 6,   :result_row             => 144,
        relay_header: 0,   :relay_row              => 0,
        :team_ranking       => 1,   :ranking_row            => 134,
        :stats              => 0,
        :stats_teams_tot    => 0,   :stats_teams_presence   => 0,
        :stats_swimmer_tot  => 0,   :stats_swimmer_presence => 0,
        line_count: 308
      }

    when 1
      # File 'ris20121112bologna-sample.txt':
      # Total 'meeting_header' data pages : 1 / 231 lines found
      # Total 'category_header' data pages : 15 / 231 lines found
      # Total 'relay_header' data pages : 5 / 231 lines found
      # Total 'team_ranking' data pages : 1 / 231 lines found
      # Total 'stats' data pages : 0 / 231 lines found
      # Total 'result_row' data pages : 127 / 231 lines found
      # Total 'relay_row' data pages : 26 / 231 lines found
      # Total 'ranking_row' data pages : 56 / 231 lines found
      # Total 'stats_teams_tot' data pages : 0 / 231 lines found
      # Total 'stats_teams_presence' data pages : 0 / 231 lines found
      # Total 'stats_swimmer_tot' data pages : 0 / 231 lines found
      # Total 'stats_swimmer_presence' data pages : 0 / 231 lines found
      # Total read lines ....... : 399 (including garbage)
      # Protocol efficiency .... : 57.89 %
      expected_values = {
        :meeting_header     => 1,
        :category_header    => 15,  :result_row             => 127,
        relay_header: 5,   :relay_row              => 26,
        :team_ranking       => 1,   :ranking_row            => 56,
        :stats              => 0,
        :stats_teams_tot    => 0,   :stats_teams_presence   => 0,
        :stats_swimmer_tot  => 0,   :stats_swimmer_presence => 0,
        line_count: 399
      }
    when 2
      # File 'ris20120114ravenna-sample.txt':
      # Total 'meeting_header' data pages : 1 / 181 lines found
      # Total 'category_header' data pages : 11 / 181 lines found
      # Total 'relay_header' data pages : 0 / 181 lines found
      # Total 'team_ranking' data pages : 1 / 181 lines found
      # Total 'stats' data pages : 1 / 181 lines found
      # Total 'result_row' data pages : 75 / 181 lines found
      # Total 'relay_row' data pages : 0 / 181 lines found
      # Total 'ranking_row' data pages : 88 / 181 lines found
      # Total 'stats_teams_tot' data pages : 1 / 181 lines found
      # Total 'stats_teams_presence' data pages : 1 / 181 lines found
      # Total 'stats_swimmer_tot' data pages : 1 / 181 lines found
      # Total 'stats_swimmer_presence' data pages : 1 / 181 lines found
      # Total read lines ....... : 376 (including garbage)
      # Protocol efficiency .... : 48.14 %
      expected_values = { 
        :meeting_header     => 1,
        :category_header    => 11,  :result_row             => 75,
        relay_header: 0,   :relay_row              => 0,
        :team_ranking       => 1,   :ranking_row            => 88,
        :stats              => 1,
        :stats_teams_tot    => 1,   :stats_teams_presence   => 1,
        :stats_swimmer_tot  => 1,   :stats_swimmer_presence => 1,
        line_count: 376
      }
    end
    expected_values
  end
  # ---------------------------------------------------------------------------
end
