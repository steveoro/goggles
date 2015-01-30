# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/team_merger'


describe TeamMerger, type: :integration do

  describe "when merging a two teams with NO badge duplicates," do
    before(:all) do                                 # Prepare context once and for all:
      @master_affiliation = create( :team_affiliation_with_badges )
      @master_team  = @master_affiliation.team
      @master_affiliation_badges_count = @master_team.badges.count
      @slave_team   = create( :team, name: @master_team.name + ' II' )
      @slave_affiliation  = TeamAffiliationFactoryTools.create_affiliation_with_badge_list( @slave_team )
      @slave_affiliation_badges_count = @slave_team.badges.count
                                                    # Prepare the subject:
      @subject = TeamMerger.new( @slave_team, @master_team )
      @result = @subject.process
    end

    it "returns true" do
# DEBUG
#      puts "\r\n" << @subject.process_text_log
#      puts "\r\n" << @subject.sql_diff_text_log
      expect( @result ).to be true
    end
    it "destroys the duplicate slave Team" do
      expect( @slave_team.destroyed? ).to be true
    end
    it "does not destroy the slave TeamAffiliation ('cause is not duplicated)" do
      expect( @slave_affiliation.destroyed? ).to be false
    end
    it "re-assigns the slave TeamAffiliation to the correct Team" do
      expect( @slave_affiliation.reload.team_id ).to eq( @master_team.id )
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


  describe "when merging a two teams with 5 non-duplicate badges," do
    before(:all) do                                 # Prepare context once and for all:
      @master_affiliation = create( :team_affiliation_with_badges )
      @master_team  = @master_affiliation.team
      @master_affiliation_badges_count = @master_team.badges.count
      @slave_team   = create( :team, name: @master_team.name + ' II' )
      @slave_affiliation  = create(
        :team_affiliation,
        team:   @slave_team,
        season: @master_affiliation.season
      )
      @slave_affiliation_badges_count = @slave_team.badges.count
                                                    # Prepare the subject:
      @subject = TeamMerger.new( @slave_team, @master_team )
      @result = @subject.process
    end

    it "returns true" do
# DEBUG
      puts "\r\n" << @subject.process_text_log
      puts "\r\n" << @subject.sql_diff_text_log
      expect( @result ).to be true
    end

# FIXME Context definition not completed yet!
    xit "updates the process log" do
      expect( @subject.process_text_log.size ).to be > 80
    end
    xit "updates the SQL diff log" do
      expect( @subject.sql_diff_text_log ).to include('UPDATE')
      expect( @subject.sql_diff_text_log ).to include('DELETE')
    end

    # TODO ADD more poignant tests!
  end
  #-- -------------------------------------------------------------------------
  #++
end
