# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/team_merger'


describe V2::TeamMerger, type: :integration do

  describe "when merging teams having NO badge duplicates, NO dup affiliation (but randomly chosen)," do
    before(:all) do                                 # Prepare context once and for all:
      @master_affiliation = create( :team_affiliation_with_badges )
      @master_team  = @master_affiliation.team
      @master_affiliation_badges_count = @master_team.badges.count
      @slave_team   = create( :team, name: @master_team.name + ' II' )
      @slave_affiliation  = TeamAffiliationFactoryTools.create_affiliation_with_badge_list( @slave_team )
      @slave_affiliation_badges_count = @slave_team.badges.count
                                                    # Prepare the subject:
      @subject = V2::TeamMerger.new( @slave_team, @master_team )
      @result = @subject.process
# DEBUG
#      puts "\r\n=====================================[rand src+dest non-dup badges, non-dup aff.]\r\n" << @subject.process_text_log
#      puts "\r\n" << @subject.sql_diff_text_log
    end

    it "returns true" do
      expect( @result ).to be true
    end
    it "destroys the duplicate slave Team" do
      expect( @slave_team.destroyed? ).to be true
    end

    # Since season is randomly chosen from existing fixtures to have also full
    # category types), it may happen that the selected seasons for the 2 teams
    # are indeed the same.
    # So we test whatever happens before expecting the correct outcome:
    it "does not destroy the (non-dup )slave TeamAffiliation" do
      if @slave_affiliation.season_id != @master_affiliation.season_id
        expect( @slave_affiliation.destroyed? ).to be false
      end
    end
    it "re-assigns the slave TeamAffiliation to the correct Team" do
      if @slave_affiliation.season_id != @master_affiliation.season_id
        expect( TeamAffiliation.find( @slave_affiliation.id ).team_id ).to eq( @master_team.id )
      end
    end
    it "does destroy the (dup) slave TeamAffiliation" do
      if @slave_affiliation.season_id == @master_affiliation.season_id
        expect( TeamAffiliation.find_by_id(@slave_affiliation.id) ).to be nil
      end
    end

    it "adds the non-duplicate slave Badges to the master Team" do
      expect( @master_affiliation.team.badges.count ).to eq(
        @master_affiliation_badges_count + @slave_affiliation_badges_count
      )
    end

    it "updates the process log" do
      expect( @subject.process_text_log.size ).to be > 80
    end
    it "updates the SQL diff log" do
      expect( @subject.sql_diff_text_log ).to include('UPDATE')
      expect( @subject.sql_diff_text_log ).to include('DELETE')
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "when merging teams having 3 source non-duplicate badges & dup affiliation," do
    before(:all) do                                 # Prepare context once and for all:
      @master_affiliation = create( :team_affiliation_with_badges )
      @master_team  = @master_affiliation.team
      @master_affiliation_badges_count = @master_team.badges.count
      @slave_team   = create( :team, name: @master_team.name + ' II' )
      @slave_affiliation  = create(                 # T.Aff. in same season => it is a duplicate!
        :team_affiliation,
        team:   @slave_team,
        season: @master_affiliation.season
      )
                                                    # Create non-dup badges for source team:
      create_list(
        :badge,
        3,
        team:             @slave_team,
        team_affiliation: @slave_affiliation,
        season:           @master_affiliation.season,
        # Force a random category type among the ones available for the
        # pre-built & selected season:
        category_type:    @master_affiliation.season.category_types.sort{ rand() - 0.5 }[0]
      )
      @slave_affiliation_badges_count = @slave_team.badges.count
                                                    # Prepare the subject:
      @subject = V2::TeamMerger.new( @slave_team, @master_team )
      @result = @subject.process
# DEBUG
#      puts "\r\n=====================================[3 src non-dup badges, dup aff.]\r\n" << @subject.process_text_log
#      puts "\r\n" << @subject.sql_diff_text_log
    end

    it "returns true" do
      expect( @result ).to be true
    end

    it "destroys the duplicate slave Team" do
      expect( @slave_team.destroyed? ).to be true
    end
    it "does destroy the (dup) slave TeamAffiliation" do
      expect( TeamAffiliation.find_by_id(@slave_affiliation.id) ).to be nil
    end

    it "adds the non-duplicate slave Badges to the master Team" do
      expect( @master_affiliation.team.badges.count ).to eq(
        @master_affiliation_badges_count + @slave_affiliation_badges_count
      )
    end

    it "updates the process log" do
      expect( @subject.process_text_log.size ).to be > 80
    end
    it "updates the SQL diff log" do
      expect( @subject.sql_diff_text_log ).to include('UPDATE')
      expect( @subject.sql_diff_text_log ).to include('DELETE')
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "when merging teams having >1 dups, 3 non-dups source badges & dup affiliation," do
    before(:all) do                                 # Prepare context once and for all:
      @master_affiliation = create( :team_affiliation_with_badges )
      @master_team  = @master_affiliation.team
      @master_affiliation_badges_count = @master_team.badges.count
      @slave_team   = create( :team, name: @master_team.name + ' II' )
      @slave_affiliation  = create(                 # T.Aff. in same season => it is a duplicate!
        :team_affiliation,
        team:   @slave_team,
        season: @master_affiliation.season
      )
                                                    # Create non-dup badges for source team:
      create_list(
        :badge,
        3,
        team:             @slave_team,
        team_affiliation: @slave_affiliation,
        season:           @master_affiliation.season,
        # Force a random category type among the ones available for the
        # pre-built & selected season:
        category_type:    @master_affiliation.season.category_types.sort{ rand() - 0.5 }[0]
      )
      @slave_affiliation_nondup_badges_count = @slave_team.badges.count
                                                    # Create dup badges for source team copying the dest ones:
      @master_affiliation.badges.each do |dest_badge|
        create(
          :badge,
          swimmer:          dest_badge.swimmer,
          team:             @slave_team,
          team_affiliation: @slave_affiliation,
          season:           @master_affiliation.season,
          category_type:    dest_badge.category_type
        )
      end
                                                    # Prepare the subject:
      @subject = V2::TeamMerger.new( @slave_team, @master_team )
      @result = @subject.process
# DEBUG
#      puts "\r\n=====================================[3 src non-dup badges, dup aff.]\r\n" << @subject.process_text_log
#      puts "\r\n" << @subject.sql_diff_text_log
    end

    it "returns true" do
      expect( @result ).to be true
    end

    it "destroys the duplicate slave Team" do
      expect( @slave_team.destroyed? ).to be true
    end
    it "does destroy the (dup) slave TeamAffiliation" do
      expect( TeamAffiliation.find_by_id(@slave_affiliation.id) ).to be nil
    end

    it "adds only the non-duplicate slave Badges to the master Team" do
      expect( @master_affiliation.badges.count ).to eq(
        # non-dup badges:   dup (copied) badges:
        @slave_affiliation_nondup_badges_count + @master_affiliation_badges_count
      )
    end

    it "updates the process log" do
      expect( @subject.process_text_log.size ).to be > 80
    end
    it "updates the SQL diff log" do
      expect( @subject.sql_diff_text_log ).to include('UPDATE')
      expect( @subject.sql_diff_text_log ).to include('DELETE')
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # TODO ADD more poignant test cases!
end
