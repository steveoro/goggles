require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/strategies/team_analysis_result_processor'


describe V3::TeamAnalysisResultProcessor, type: :strategy do
  let(:data_import_session)  { create( :data_import_session ) }

  context "for a new empty instance," do
    subject { V3::TeamAnalysisResultProcessor.new( nil, nil ) }

    it_behaves_like( "(the existance of a method)", [
      :logger,
      :flash,
      :sql_executable_log,
      :process_log,
      :run
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#initialize" do
      it "returns a V3::TeamAnalysisResultProcessor instance" do
        expect( subject ).to be_an_instance_of( V3::TeamAnalysisResultProcessor )
      end
      it "sets the #sql_executable_log to an empty string" do
        expect( subject.sql_executable_log ).to eq('')
      end
      it "sets the #process_log to an empty string" do
        expect( subject.process_log ).to eq('')
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#run" do
      # Initialize a sharable subject using an instance
      before(:all) do
        @subject = V3::TeamAnalysisResultProcessor.new( nil, nil )
      end
      # Clean-up in case of errors or example failures leftovers
      after(:all) do
        @subject.committed_rows.each do |committed_row|
          begin
            committed_row.destroy
          rescue
          end
        end
      end

      context "when NOT CONFIRMED or can CREATE TEAM (No chosen override + unconfirmed + same name best match to avoid affiliation)," do
        let(:team_analysis_result) { create( :data_import_team_analysis_result, data_import_session: data_import_session ) }

        it "adds just a new DataImportTeam row" do
          is_ok = nil
          new_team = build( :team )
          team_analysis_result.chosen_team_id = nil
          team_analysis_result.searched_team_name = new_team.name
          team_analysis_result.team_match_name    = new_team.name
          team_analysis_result.best_match_name    = new_team.name
          expect( team_analysis_result.can_insert_team ).to be true
          alias_count = DataImportTeamAlias.count
          affiliation_count = TeamAffiliation.count
# DEBUG
#          puts "\r\n#{team_analysis_result}"
#          puts "=> count BEFORE: Team=#{Team.count}, DataImportTeam=#{DataImportTeam.count}, DataImportTeamAlias=#{alias_count}, TeamAffiliation=#{affiliation_count}"
          expect{
            is_ok = @subject.run( team_analysis_result, false, nil )
# DEBUG
#            puts @subject.process_log
#            puts "=> count AFTER:  Team=#{Team.count}, DataImportTeam=#{DataImportTeam.count}, DataImportTeamAlias=#{DataImportTeamAlias.count}, TeamAffiliation=#{TeamAffiliation.count}"
          }.to change{ DataImportTeam.count }.by(1)

          expect( is_ok ).to be true
          expect( DataImportTeamAlias.count ).to eq( alias_count )
          expect( TeamAffiliation.count ).to eq( affiliation_count )
        end
      end
      #-- ---------------------------------------------------------------------
      #++

      context "when CONFIRMED and can CREATE ALIAS (Team match + override with same ID + same name best match + confirm)," do
        let(:team_analysis_result) { create( :data_import_team_analysis_result, data_import_session: data_import_session ) }

        it "adds just a new DataImportTeamAlias row" do
          is_ok = nil
          expect( team_analysis_result.can_insert_alias ).to be true
          team_count = Team.count
          affiliation_count = TeamAffiliation.count
# DEBUG
#          puts "\r\n#{team_analysis_result}"
#          puts "=> count BEFORE: Team=#{Team.count}, DataImportTeam=#{DataImportTeam.count}, DataImportTeamAlias=#{DataImportTeamAlias.count}, TeamAffiliation=#{TeamAffiliation.count}"
          expect{
            is_ok = @subject.run( team_analysis_result, true, team_analysis_result.chosen_team_id )
# DEBUG
#            puts @subject.process_log
#            puts "=> count AFTER:  Team=#{Team.count}, DataImportTeam=#{DataImportTeam.count}, DataImportTeamAlias=#{DataImportTeamAlias.count}, TeamAffiliation=#{TeamAffiliation.count}"
           }.to change{ DataImportTeamAlias.count }.by(1)

          expect( is_ok ).to be true
          expect( Team.count ).to eq( team_count )
          expect( TeamAffiliation.count ).to eq( affiliation_count )
        end
      end
      #-- ---------------------------------------------------------------------
      #++

      context "when CONFIRMED and can CREATE AFFILIATION (Team match + no override + missing affiliation + confirmed)," do
        let(:team_analysis_result) { create( :data_import_team_analysis_result, data_import_session: data_import_session ) }

        it "adds a new TeamAffiliation row (w/ its own alias)" do
          is_ok = nil
          team_analysis_result.best_match_name = nil
          expect( team_analysis_result.can_insert_affiliation ).to be true
          team_count = Team.count
          alias_count = DataImportTeamAlias.count
# DEBUG
#          puts "\r\n#{team_analysis_result}"
#          puts "=> count BEFORE: Team=#{Team.count}, DataImportTeam=#{DataImportTeam.count}, DataImportTeamAlias=#{DataImportTeamAlias.count}, TeamAffiliation=#{TeamAffiliation.count}"
          expect{
            is_ok = @subject.run( team_analysis_result, true, nil )
#            puts @subject.process_log
#            puts "=> count AFTER:  Team=#{Team.count}, DataImportTeam=#{DataImportTeam.count}, DataImportTeamAlias=#{DataImportTeamAlias.count}, TeamAffiliation=#{TeamAffiliation.count}"
          }.to change{ TeamAffiliation.count }.by(1)

          expect( is_ok ).to be true
          expect( Team.count ).to eq( team_count )
          expect( DataImportTeamAlias.count ).to eq( alias_count + 1 )
        end
      end
      #-- ---------------------------------------------------------------------
      #++
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
