require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_city_builder'


describe "DataImportEntityBuilder for Team,", type: :integration do

  let(:data_import_session) { create( :data_import_session ) }

  let(:pathname)            { File.join(Faker::Lorem.word, Faker::Lorem.word) }
  let(:prefix)              { Faker::Lorem.word[0..2] }
  let(:year)                { ((rand * 100) % 10).to_i + 2007 }
  let(:month)               { ((rand * 100) % 12).to_i + 1 }
  let(:day)                 { ((rand * 100) % 28).to_i + 1 }
  let(:header_text_date)    { "%04d%02d%02d" % [year, month, day] }
  let(:code_name)           { Faker::Lorem.word }
  let(:full_pathname)       { File.join( pathname, "#{ prefix }#{ header_text_date }#{ code_name }.txt" ) }

  let(:meeting_header_row) do
    {
      import_text: "#{Faker::Lorem.word} meeting - organized by #{Faker::Lorem.word} team",
      fields: {
        title: "#{Faker::Lorem.word} meeting",
        organization: "#{Faker::Lorem.word} team"
      }
    }
  end

  let(:meeting_dates_text)  { "%04d-%02d-%02d" % [year, month, day] }
  let(:scheduled_date)      { Date.parse( meeting_dates_text ) }
  let(:header_fields_dao)   { FilenameParser.new( full_pathname ).parse }
  #-- -------------------------------------------------------------------------
  #++


  # Prepares the result subject for the specs.
  def team_build_process( team_name, season, force_missing_team_creation )
# DEBUG
#    puts "\r\nSearching for team '#{team_name}'..."
    DataImportEntityBuilder.build( data_import_session ) do
      entity              TeamAffiliation
      entity_for_creation DataImportTeam
                                                  # 1) Search TeamAffiliation + DataImportTeam:
      search do
        primary     [ "(name LIKE ?)", team_name+'%' ]
        secondary   [ "(data_import_session_id = ?) AND (name LIKE ?)", data_import_session.id, team_name+'%' ]
        default_search
        entity      Team                          # reset primary entity after the search
        if primary_search_ok? # Force result to be a Team instance when it is found
# DEBUG
#          puts "primary_search_ok!"
          set_result  @result_row.team
        end
      end
                                                  # 2) Search for a team alias:
      if_not_found  { search_for( DataImportTeamAlias, name: team_name ) }

      if_not_found do                             # 3) Do a single-shot, "best-match" fuzzy search:
        matcher     = FuzzyStringMatcher.new( Team.all, :name, :editable_name )
        result_row  = matcher.find( team_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
        entity      Team                          # reset primary entity after the search
        set_result  result_row
# DEBUG
#        puts "FuzzyStringMatcher: result = #{result_row.inspect}"
      end
                                                  # 4) Additional TeamAffiliation check:
      # INTEGRITY Check: add a missing TeamAffiliation but only if we have a primary match.
      # (Cannot add a TeamAffiliation if the Team doesn't exist yet.)
      custom_logic do
        if primary_search_ok?
          actual_team_result = @result_row
          search_for( TeamAffiliation, team_id: -@result_id, season_id: season.id )

          if_not_found do
            entity_for_creation TeamAffiliation
            attributes_for_creation(
              name:                       team_name, # Use the actual provided (and searched) name instead of the result_row.name
              team_id:                    -@result_id,
              season_id:                  season.id,
              is_autofilled:              true, # signal that we have guessed some of the values
              must_calculate_goggle_cup:  false,
              user_id:                    1 # (don't care)
              # FIXME Unable to guess team affiliation number (not filled-in, to be added by hand)
            )
            add_new                       # this will reset the result_row, so we restore it by hand
          end
          set_result actual_team_result
        end
      end

      if_not_found do
        if force_missing_team_creation              # Guess city name & setup fields:
          city_builder = DataImportCityBuilder.build_from_team_name( data_import_session, team_name )
          entity_for_creation DataImportTeam

          attributes_for_creation(
            data_import_session_id: data_import_session.id,
            import_text:            team_name,
            name:                   team_name,
            city_id:                city_builder.result_id.to_i < 0 ? -city_builder.result_id : nil,
            data_import_city_id:    city_builder.result_id.to_i < 0 ? nil : city_builder.result_id,
            user_id:                1 # (don't care)
          )
          add_new
        else
          # Not found & can't create a new team? => Do a full depth-first analyze of
          # the team name in search for a match and report the results via the builder
          # instance:
          @team_analysis_log = ''
          @sql_executable_log = ''
          result = TeamNameAnalizer.new.analyze(
              team_name, season.id,
              @team_analysis_log,
              @sql_executable_log,
              0.99, 0.8
          )
          @team_analysis_log  = result.analysis_log_text
          @sql_executable_log = result.sql_text
          result.data_import_session_id = data_import_session.id
                                                    # Store the team analysis result:
          if ( DataImportTeamAnalysisResult.where(
                data_import_session_id: result.data_import_session_id,
                searched_team_name:     result.searched_team_name,
                desired_season_id:      result.desired_season_id
               ).none?
          )
            result.save!
# DEBUG
#            puts "Team analysis saved."
          end
          # Result not found w/o Team creation => Do a manual review of the analysis data.
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching Team row," do
    subject do
      team_build_process(
        "#{create(:city).name} swimming club ASD",
        create(:season),
        true # force_missing_team_creation
      )
    end

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end
    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportTeam )
      end
    end
    describe "#result_id" do
      it "returns a positive ID when the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_row ).to be_an_instance_of( DataImportTeam )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching Team row," do
    let(:team)   { create(:team) }
    subject do
      team_build_process(
        team.name,
        create(:season), # <== This'd yield to the creation of the missing TeamAffiliation for this new season
        false # force_missing_team_creation
      )
    end

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end
    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( Team )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the primary search is successful" do
        expect( subject.result_id ).to be < 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row, with a minus sign" do
        expect( subject.result_row ).to be_an_instance_of( Team )
        expect( subject.result_row.id ).to eq( -(subject.result_id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
