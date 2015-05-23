require 'spec_helper'


describe BalancedMeetingScoreCalculator, type: :strategy do

  let(:season)  { Season.find(141) }
  let(:meeting) { season.meetings.has_results[ ((rand * season.meetings.has_results.count) % season.meetings.has_results.count).to_i ] }

  context "with requested parameters" do
    subject { BalancedMeetingScoreCalculator.new( meeting ) }

    it_behaves_like( "(the existance of a method)", [
      :get_teams, :get_meeting_team_scores, :save_computed_score
    ] )

    describe "#get_teams," do
      it "returns an enumerable" do
        expect( subject.get_teams ).to be_a_kind_of( Enumerable )
      end
      it "returns a collection of teams" do
        expect( subject.get_teams ).to all(be_an_instance_of( Team ))
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#get_meeting_team_scores," do
      it "returns an enumerable" do
        expect( subject.get_meeting_team_scores ).to be_a_kind_of( Enumerable )
      end
      it "returns a collection of teams" do
        expect( subject.get_meeting_team_scores ).to all(be_an_instance_of( MeetingTeamScore ))
      end
      it "returns an element per team" do
        teams = subject.get_teams
        expect( subject.get_meeting_team_scores.count ).to be == teams.count 
      end
      it "returns the same number of ranked teams for consolided meetings" do
        meeting_team_scores = subject.get_meeting_team_scores
        expect( meeting_team_scores.count ).to be == meeting.meeting_team_scores.count
      end
      it "returns the same vaules for consolided meetings" do
        meeting_team_scores = subject.get_meeting_team_scores
        meeting_team_scores.each do |meeting_team_score|
          consolided_one = meeting.meeting_team_scores.where(['meeting_team_scores.team_id = ?', meeting_team_score.team_id]).first
          expect( meeting_team_score.rank ).to be == consolided_one.rank
          expect( meeting_team_score.meeting_individual_points ).to be == consolided_one.meeting_individual_points
          expect( meeting_team_score.meeting_relay_points ).to be == consolided_one.meeting_relay_points
          expect( meeting_team_score.meeting_team_points ).to be == consolided_one.meeting_team_points
        end
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#save_computed_score," do
      it "saves the number of scores" do
        meeting_team_scores = subject.get_meeting_team_scores
        expect( subject.save_computed_score ).to be == meeting_team_scores.count 
      end
    end
    #-- -----------------------------------------------------------------------
    
  end
  #-- -------------------------------------------------------------------------
  #++
end
