require 'spec_helper'


shared_examples_for "(existance of meeting stats relation of swimmers)" do |method_name_array|
  method_name_array.each do |method_name|
    it "responds to ##{method_name}" do
      expect( subject ).to respond_to( method_name )
    end

    it "#{method_name} returns a list of swimmer instances" do
      subject.send(method_name.to_sym).each do |item|
        expect(item).to be_an_instance_of( Swimmer )
      end
    end
  end
end

shared_examples_for "(existance of meeting stats relation of meeting individual results)" do |method_name_array|
  method_name_array.each do |method_name|
    it "responds to ##{method_name}" do
      expect( subject ).to respond_to( method_name )
    end

    it "#{method_name} returns a list of swimmer instances" do
      subject.send(method_name.to_sym).each do |item|
        expect(item).to be_an_instance_of( MeetingIndividualResult )
      end
    end
  end
end
# =============================================================================


describe MeetingStatCalculator, :type => :model do
  # Pre-loaded seeded last CSI season and some acquired FIN
  before(:all) do
    @seeded_meets = [12101, 12102, 12103, 12104, 12105, 13101, 13102, 13103, 13104, 13105, 13106, 13223]
    @meeting_with_entries = [14105, 14106, 15101, 15102, 15103]
    @meeting_without_entries = [12101, 12102, 12103, 13223, 15207]
    @meeting_with_standard_points = [13223, 13216, 14216, 15216]
  end
  
  let( :meeting )                   { Meeting.find( @seeded_meets.at( (rand * @seeded_meets.size).to_i ) ) }
  let( :meet_with_entries )         { Meeting.find( @meeting_with_entries.at( ( rand * @meeting_with_entries.size ).to_i ) ) }
  let( :meet_without_entries )      { Meeting.find( @meeting_without_entries.at( ( rand * @meeting_without_entries.size ).to_i ) ) }
  let( :meet_with_standard_points ) { Meeting.find( @meeting_with_standard_points.at( ( rand * @meeting_with_standard_points.size ).to_i ) ) }
  
  subject { MeetingStatCalculator.new( meeting ) }

  describe "[a well formed instance]" do
    it_behaves_like( "(the existance of a method returning numeric values)", [
      :get_entries_count,
      :get_entered_swimmers_count,
      :get_swimmers_count,
      :get_results_count,
      :get_teams_count,
      :get_disqualifieds_count,
      :get_average,
      :get_over_target_count
    ])

    it_behaves_like( "(existance of meeting stats relation of swimmers)", [
      # Methods
      :get_oldest_swimmers,
      :get_oldest_swimmers
    ])

    it_behaves_like( "(existance of meeting stats relation of meeting individual results)", [
      # Methods
      :get_best_standard_scores,
      :get_worst_standard_scores
    ])

    it "meeting is the one used in costruction" do
      expect( subject.meeting ).to eq( meeting )
    end

    it "has a valid meeting instance" do
      expect(subject.get_meeting).to be_an_instance_of( Meeting )
    end
    
    describe "#has_results?" do
      it "returns true for a meeting with results" do
        expect( subject.has_results? ).to be true
      end
      it "returns false for a meeting without results" do
        new_meeting = create( :meeting ) 
        stat_without_results = MeetingStatCalculator.new( new_meeting )
        expect( stat_without_results.has_results? ).to be false
      end
    end

    describe "#has_entries?" do
      it "returns true for a meeting with entries" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        expect( stat_with_entries.has_entries? ).to be true
      end
      it "returns false for a meeting without entries" do
        new_meeting = create( :meeting ) 
        stat_without_entries = MeetingStatCalculator.new( new_meeting )
        expect( stat_without_entries.has_entries? ).to be false
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "entry-based methods" do
    describe "#get_entered_teams_count" do
      it "returns a number > 0 for a meeting with entries" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        expect( stat_with_entries.get_entered_teams_count ).to be > 0
      end
      it "returns 0 for meeting without entries" do
        stat_without_entries = MeetingStatCalculator.new( meet_without_entries )
        expect( stat_without_entries.get_entered_teams_count ).to eq( 0 )
      end
    end

    describe "#get_entries_count" do
      it "returns a number > 0 for meeting with entries" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        expect( stat_with_entries.get_entries_count ).to be > 0
        expect( stat_with_entries.get_entries_count( :is_male ) ).to be > 0
        expect( stat_with_entries.get_entries_count( :is_female ) ).to be > 0
      end
      it "returns 0 for meeting without entries" do
        stat_without_entries = MeetingStatCalculator.new( meet_without_entries )
        expect( stat_without_entries.get_entries_count ).to eq( 0 )
        expect( stat_without_entries.get_entries_count( :is_male ) ).to eq( 0 )
        expect( stat_without_entries.get_entries_count( :is_female ) ).to eq( 0 )
      end
      it "returns the total entries number for males and females" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        expect( stat_with_entries.get_entries_count( :is_male ) + stat_with_entries.get_entries_count( :is_female ) ).to eq( meet_with_entries.meeting_entries.count )
      end
    end
    
    describe "#get_team_entries_count" do
      it "returns a number > 0 for a team with entries for the meeting" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        fix_team = meet_with_entries.teams.uniq.at( (rand * meet_with_entries.teams.uniq.count).to_i )
        expect( stat_with_entries.get_team_entries_count( fix_team, :is_male ) + stat_with_entries.get_team_entries_count( fix_team, :is_female ) ).to be > 0
      end
      it "returns 0 for a team without entries for the meeting" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        new_team = create( :team )
        expect( stat_with_entries.get_team_entries_count( new_team ) ).to eq( 0 )
        expect( stat_with_entries.get_team_entries_count( new_team, :is_male ) ).to eq( 0 )
        expect( stat_with_entries.get_team_entries_count( new_team, :is_female ) ).to eq( 0 )
      end
      it "returns 0 for meeting without entries" do
        stat_without_entries = MeetingStatCalculator.new( meet_without_entries )
        fix_team = meet_without_entries.teams.uniq.at( (rand * meet_without_entries.teams.uniq.count).to_i )
        expect( stat_without_entries.get_team_entries_count( fix_team ) ).to eq( 0 )
        expect( stat_without_entries.get_team_entries_count( fix_team, :is_male ) ).to eq( 0 )
        expect( stat_without_entries.get_team_entries_count( fix_team, :is_female ) ).to eq( 0 )
      end
      it "returns the total entries number for team male and female" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        fix_team = meet_with_entries.teams.uniq.at( (rand * meet_with_entries.teams.uniq.count).to_i )
        expect( stat_with_entries.get_team_entries_count( fix_team, :is_male ) + stat_with_entries.get_team_entries_count( fix_team, :is_female ) ).to eq( meet_with_entries.meeting_entries.for_team( fix_team ).count )
      end
    end
    
    describe "#get_entered_swimmers_count" do
      it "returns a number > 0 for meeting with entries" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        expect( stat_with_entries.get_entered_swimmers_count ).to be > 0
        expect( stat_with_entries.get_entered_swimmers_count( :is_male ) ).to be > 0
        expect( stat_with_entries.get_entered_swimmers_count( :is_female ) ).to be > 0
      end
      it "returns 0 for meeting without entries" do
        stat_without_entries = MeetingStatCalculator.new( meet_without_entries )
        expect( stat_without_entries.get_entered_swimmers_count ).to eq( 0 )
        expect( stat_without_entries.get_entered_swimmers_count( :is_male ) ).to eq( 0 )
        expect( stat_without_entries.get_entered_swimmers_count( :is_female ) ).to eq( 0 )
      end
      it "returns the total entered swimmers number for males and females" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        expect( stat_with_entries.get_entered_swimmers_count( :is_male ) + stat_with_entries.get_entered_swimmers_count( :is_female ) ).to be <= meet_with_entries.meeting_entries.count
      end
    end
    
    describe "#get_team_entered_swimmers_count" do
      it "returns a number > 0 for a team with entries for the meeting" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        fix_team = meet_with_entries.teams.uniq.at( (rand * meet_with_entries.teams.uniq.count).to_i )
        expect( stat_with_entries.get_team_entered_swimmers_count( fix_team, :is_male ) + stat_with_entries.get_team_entered_swimmers_count( fix_team, :is_female ) ).to be > 0
      end
      it "returns 0 for a team without entries for the meeting" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        new_team = create( :team )
        expect( stat_with_entries.get_team_entered_swimmers_count( new_team ) ).to eq( 0 )
        expect( stat_with_entries.get_team_entered_swimmers_count( new_team, :is_male ) ).to eq( 0 )
        expect( stat_with_entries.get_team_entered_swimmers_count( new_team, :is_female ) ).to eq( 0 )
      end
      it "returns 0 for meeting without entries" do
        stat_without_entries = MeetingStatCalculator.new( meet_without_entries )
        fix_team = meet_without_entries.teams.uniq.at( (rand * meet_without_entries.teams.uniq.count).to_i )
        expect( stat_without_entries.get_team_entered_swimmers_count( fix_team ) ).to eq( 0 )
        expect( stat_without_entries.get_team_entered_swimmers_count( fix_team, :is_male ) ).to eq( 0 )
        expect( stat_without_entries.get_team_entered_swimmers_count( fix_team, :is_female ) ).to eq( 0 )
      end
      it "returns the total entered swimmers number for team male and female" do
        stat_with_entries = MeetingStatCalculator.new( meet_with_entries )
        fix_team = meet_with_entries.teams.uniq.at( (rand * meet_with_entries.teams.uniq.count).to_i )
        expect( stat_with_entries.get_team_entered_swimmers_count( fix_team, :is_male ) + stat_with_entries.get_team_entered_swimmers_count( fix_team, :is_female ) ).to be <= meet_with_entries.meeting_entries.for_team( fix_team ).count
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "result-based methods" do
    describe "#get_teams_count" do
      it "returns a number > 0 for a meeting with results" do
        expect( subject.get_teams_count ).to be > 0
      end
      it "returns 0 for meeting without entries" do
        stat_without_results = MeetingStatCalculator.new( create( :meeting ) )
        expect( stat_without_results.get_teams_count ).to eq( 0 )
      end
    end

    describe "#get_results_count" do
      it "returns a number > 0 for meeting with results" do
        expect( subject.get_results_count ).to be > 0
        expect( subject.get_results_count( :is_male ) ).to be > 0
        expect( subject.get_results_count( :is_female ) ).to be > 0
      end
      it "returns 0 for meeting without entries" do
        stat_without_results = MeetingStatCalculator.new( create( :meeting ) )
        expect( stat_without_results.get_results_count ).to eq( 0 )
        expect( stat_without_results.get_results_count( :is_male ) ).to eq( 0 )
        expect( stat_without_results.get_results_count( :is_female ) ).to eq( 0 )
      end
      it "returns the total swimmers number for males and females" do
        expect( subject.get_results_count( :is_male ) + subject.get_results_count( :is_female ) ).to eq( meeting.meeting_individual_results.count )
      end
    end

    describe "#get_team_results_count" do
      it "returns a number > 0 for a team with results for the meeting" do
        fix_team = meeting.teams.uniq.at( (rand * meeting.teams.uniq.count).to_i )
        expect( subject.get_team_results_count( fix_team, :is_male ) + subject.get_team_results_count( fix_team, :is_female ) ).to be > 0
      end
      it "returns 0 for a team without results for the meeting" do
        new_team = create( :team )
        expect( subject.get_team_results_count( new_team ) ).to eq( 0 )
        expect( subject.get_team_results_count( new_team, :is_male ) ).to eq( 0 )
        expect( subject.get_team_results_count( new_team, :is_female ) ).to eq( 0 )
      end
      it "returns the total results number for team male and female" do
        fix_team = meeting.teams.uniq.at( (rand * meeting.teams.uniq.count).to_i )
        expect( subject.get_team_results_count( fix_team, :is_male ) + subject.get_team_results_count( fix_team, :is_female ) ).to eq( meeting.meeting_individual_results.for_team( fix_team ).count )
      end
    end
  
    describe "#get_swimmers_count" do
      it "returns a number > 0 for meeting with results" do
        expect( subject.get_swimmers_count ).to be > 0
        expect( subject.get_swimmers_count( :is_male ) ).to be > 0
        expect( subject.get_swimmers_count( :is_female ) ).to be > 0
      end
      it "returns 0 for meeting without results" do
        stat_without_results = MeetingStatCalculator.new( create( :meeting ) )
        expect( stat_without_results.get_swimmers_count ).to eq( 0 )
        expect( stat_without_results.get_swimmers_count( :is_male ) ).to eq( 0 )
        expect( stat_without_results.get_swimmers_count( :is_female ) ).to eq( 0 )
      end
      it "returns the total swimmers number for males and females" do
        expect( subject.get_swimmers_count( :is_male ) + subject.get_swimmers_count( :is_female ) ).to be <= meeting.meeting_individual_results.count
      end
    end

    describe "#get_team_swimmers_count" do
      it "returns a number > 0 for a team with results for the meeting" do
        fix_team = meeting.teams.uniq.at( (rand * meeting.teams.uniq.count).to_i )
        expect( subject.get_team_swimmers_count( fix_team, :is_male ) + subject.get_team_swimmers_count( fix_team, :is_female ) ).to be > 0
      end
      it "returns 0 for a team without results for the meeting" do
        new_team = create( :team )
        expect( subject.get_team_swimmers_count( new_team ) ).to eq( 0 )
        expect( subject.get_team_swimmers_count( new_team, :is_male ) ).to eq( 0 )
        expect( subject.get_team_swimmers_count( new_team, :is_female ) ).to eq( 0 )
      end
      it "returns the total swimmers number for team male and female" do
        fix_team = meeting.teams.uniq.at( (rand * meeting.teams.uniq.count).to_i )
        expect( subject.get_team_swimmers_count( fix_team, :is_male ) + subject.get_team_swimmers_count( fix_team, :is_female ) ).to be <= meeting.meeting_individual_results.for_team( fix_team ).count
      end
    end

    describe "#get_disqualifieds_count" do
      it "returns a number >= 0 for meeting with results" do
        expect( subject.get_disqualifieds_count ).to be >= 0
        expect( subject.get_disqualifieds_count( :is_male ) ).to be >= 0
        expect( subject.get_disqualifieds_count( :is_female ) ).to be >= 0
      end
      it "returns 0 for meeting without entries" do
        stat_without_results = MeetingStatCalculator.new( create( :meeting ) )
        expect( stat_without_results.get_disqualifieds_count ).to eq( 0 )
        expect( stat_without_results.get_disqualifieds_count( :is_male ) ).to eq( 0 )
        expect( stat_without_results.get_disqualifieds_count( :is_female ) ).to eq( 0 )
      end
      it "returns the total swimmers number for males and females" do
        expect( subject.get_disqualifieds_count( :is_male ) + subject.get_disqualifieds_count( :is_female ) ).to eq( meeting.meeting_individual_results.is_disqualified.count )
      end
    end

    describe "#get_team_disqualifieds_count" do
      it "returns a number > 0 for a team with disqualifieds for the meeting" do
        fix_team = meeting.teams.uniq.at( (rand * meeting.teams.uniq.count).to_i )
        fix_result = meeting.meeting_individual_results.for_team( fix_team ).first 
        fix_result.is_disqualified = true
        fix_result.save
        expect( meeting.meeting_individual_results.is_disqualified.for_team( fix_team ).count ).to be > 0
        expect( subject.get_team_results_count( fix_team, :is_male ) + subject.get_team_results_count( fix_team, :is_female ) ).to be > 0
      end
      it "returns 0 for a team without disqualifieds for the meeting" do
        new_team = create( :team )
        expect( subject.get_team_disqualifieds_count( new_team ) ).to eq( 0 )
        expect( subject.get_team_disqualifieds_count( new_team, :is_male ) ).to eq( 0 )
        expect( subject.get_team_disqualifieds_count( new_team, :is_female ) ).to eq( 0 )
      end
      it "returns the total disqualifieds number for team male and female" do
        fix_team = meeting.teams.uniq.at( (rand * meeting.teams.uniq.count).to_i )
        expect( subject.get_team_disqualifieds_count( fix_team, :is_male ) + subject.get_team_disqualifieds_count( fix_team, :is_female ) ).to eq( meeting.meeting_individual_results.is_disqualified.for_team( fix_team ).count )
      end
    end
  
    describe "#get_team_best_standard" do
      it "returns a number > 0 for a team with results with standard points for the meeting" do
        stat_with_standard_points = MeetingStatCalculator.new( meet_with_standard_points )
        fix_team = meet_with_standard_points.teams.uniq.at( (rand * meet_with_standard_points.teams.uniq.count).to_i )
        expect( stat_with_standard_points.get_team_best_standard( fix_team, :is_male ) + stat_with_standard_points.get_team_best_standard( fix_team, :is_female ) ).to be > 0
      end
      it "returns 0 for a team without results with standard points for the meeting" do
        new_team = create( :team )
        expect( subject.get_team_best_standard( new_team ) ).to eq( 0 )
        expect( subject.get_team_best_standard( new_team, :is_male ) ).to eq( 0 )
        expect( subject.get_team_best_standard( new_team, :is_female ) ).to eq( 0 )
      end
      it "returns the highest standard point for the team for the meeting" do
        fix_team = meeting.teams.uniq.at( (rand * meeting.teams.uniq.count).to_i )
        fix_result = meeting.meeting_individual_results.for_team( fix_team ).first 
        fix_result.standard_points = ( rand * 1000 + 2000.00 ).round( 2 )
        fix_result.save
        if fix_result.gender_type.code == 'F'
          expect( subject.get_team_best_standard( fix_team, :is_female ) ).to eq( fix_result.standard_points )
        else
          expect( subject.get_team_best_standard( fix_team, :is_male ) ).to eq( fix_result.standard_points )
        end
      end
    end

    describe "#get_team_worst_standard" do
      it "returns a number > 0 for a team with results with standard points for the meeting" do
        stat_with_standard_points = MeetingStatCalculator.new( meet_with_standard_points )
        fix_team = meet_with_standard_points.teams.uniq.at( (rand * meet_with_standard_points.teams.uniq.count).to_i )
        expect( stat_with_standard_points.get_team_worst_standard( fix_team, :is_male ) + stat_with_standard_points.get_team_worst_standard( fix_team, :is_female ) ).to be > 0
      end
      it "returns 0 for a team without results with standard points for the meeting" do
        new_team = create( :team )
        expect( subject.get_team_worst_standard( new_team ) ).to eq( 0 )
        expect( subject.get_team_worst_standard( new_team, :is_male ) ).to eq( 0 )
        expect( subject.get_team_worst_standard( new_team, :is_female ) ).to eq( 0 )
      end
      it "returns the lowest standard point for the team for the meeting" do
        fix_team = meeting.teams.uniq.at( (rand * meeting.teams.uniq.count).to_i )
        fix_result = meeting.meeting_individual_results.for_team( fix_team ).first 
        fix_result.standard_points = ( rand * 200 + 10 ).round( 2 )
        fix_result.save
        if fix_result.gender_type.code == 'F'
          expect( subject.get_team_worst_standard( fix_team, :is_female ) ).to eq( fix_result.standard_points )
        else
          expect( subject.get_team_worst_standard( fix_team, :is_male ) ).to eq( fix_result.standard_points )
        end
      end
    end

    describe "#get_average" do
      it "returns a number > 0 for a meeting with results with standard points" do
        stat_with_standard_points = MeetingStatCalculator.new( meet_with_standard_points )
        expect( stat_with_standard_points.get_average ).to be > 0
        expect( stat_with_standard_points.get_average( :is_male ) ).to be > 0
        expect( stat_with_standard_points.get_average( :is_female ) ).to be > 0
      end
      it "returns 0 for a meeting without results" do
        stat_without_results = MeetingStatCalculator.new( create( :meeting ) )
        expect( stat_without_results.get_average ).to eq( 0 )
        expect( stat_without_results.get_average( :is_male ) ).to eq( 0 )
        expect( stat_without_results.get_average( :is_female ) ).to eq( 0 )
      end
      it "returns a value smaller than best and bigger than worst" do
        stat_with_standard_points = MeetingStatCalculator.new( meet_with_standard_points )
        ave_male = stat_with_standard_points.get_average( :is_male )
        ave_female = stat_with_standard_points.get_average( :is_female )
        expect( ave_male ).to be <= stat_with_standard_points.get_best_standard_scores( :is_male ).first.standard_points
        expect( ave_male ).to be >= stat_with_standard_points.get_worst_standard_scores( :is_male ).first.standard_points
        expect( ave_female ).to be <= stat_with_standard_points.get_best_standard_scores( :is_female ).first.standard_points
        expect( ave_female ).to be >= stat_with_standard_points.get_worst_standard_scores( :is_female ).first.standard_points
      end
    end

    describe "#get_team_average" do
      it "returns a number > 0 for a team with results with standard points for the meeting" do
        stat_with_standard_points = MeetingStatCalculator.new( meet_with_standard_points )
        fix_team = meet_with_standard_points.teams.uniq.at( (rand * meet_with_standard_points.teams.uniq.count).to_i )
        expect( stat_with_standard_points.get_team_average( fix_team, :is_male ) + stat_with_standard_points.get_team_average( fix_team, :is_female ) ).to be > 0
      end
      it "returns 0 for a team without results with standard points for the meeting" do
        new_team = create( :team )
        expect( subject.get_team_average( new_team ) ).to eq( 0 )
        expect( subject.get_team_average( new_team, :is_male ) ).to eq( 0 )
        expect( subject.get_team_average( new_team, :is_female ) ).to eq( 0 )
      end
      it "returns a value smaller than best and bigger than worst" do
        stat_with_standard_points = MeetingStatCalculator.new( meet_with_standard_points )
        fix_team = meet_with_standard_points.teams.uniq.at( (rand * meet_with_standard_points.teams.uniq.count).to_i )
        ave_male = stat_with_standard_points.get_team_average( fix_team, :is_male )
        ave_female = stat_with_standard_points.get_team_average( fix_team, :is_female )
        expect( ave_male ).to be <= stat_with_standard_points.get_team_best_standard( fix_team, :is_male )
        expect( ave_male ).to be >= stat_with_standard_points.get_team_worst_standard( fix_team, :is_male )
        expect( ave_female ).to be <= stat_with_standard_points.get_team_best_standard( fix_team, :is_female )
        expect( ave_female ).to be >= stat_with_standard_points.get_team_worst_standard( fix_team, :is_female )
      end
    end

    describe "#get_team_medals" do
      it "returns a number >= 0 for a team with results for the meeting" do
        fix_team = meeting.teams.uniq.at( (rand * meeting.teams.uniq.count).to_i )
        expect( subject.get_team_medals( fix_team, :is_male, ( rand * 2 + 1 ).to_i ) + subject.get_team_medals( fix_team, :is_female, ( rand * 2 + 1 ).to_i ) ).to be >= 0
      end
      it "returns 0 for a team without results for the meeting" do
        new_team = create( :team )
        expect( subject.get_team_medals( new_team ) ).to eq( 0 )
        expect( subject.get_team_medals( new_team, :is_male ) ).to eq( 0 )
        expect( subject.get_team_medals( new_team, :is_female ) ).to eq( 0 )
        expect( subject.get_team_medals( new_team, :is_male, 1 ) ).to eq( 0 )
        expect( subject.get_team_medals( new_team, :is_female, 1 ) ).to eq( 0 )
        expect( subject.get_team_medals( new_team, :is_male, 2 ) ).to eq( 0 )
        expect( subject.get_team_medals( new_team, :is_female, 2 ) ).to eq( 0 )
        expect( subject.get_team_medals( new_team, :is_male, 3 ) ).to eq( 0 )
        expect( subject.get_team_medals( new_team, :is_female, 3 ) ).to eq( 0 )
      end
    end



    describe "#get_oldest_swimmers" do
      it "returns only male swimmers" do
        subject.get_oldest_swimmers.each do |item|
          expect(item.is_male).to be true
        end
      end
      it "returns only female swimmers" do
        subject.get_oldest_swimmers(:is_female).each do |item|
          expect(item.is_female).to be true
        end
      end
      it "returns a list sorted by swimmer year_of_birth" do
        current_item_year = subject.get_oldest_swimmers.first.year_of_birth
        subject.get_oldest_swimmers.each do |item|
          expect(item.year_of_birth).to be >= current_item_year
          current_item_year = item.year_of_birth
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_best_standard_scores" do
    it "returns only not disqualified results" do
      subject.get_best_standard_scores.each do |item|
        expect(item.is_disqualified).to be false
      end
      subject.get_best_standard_scores(:is_female).each do |item|
        expect(item.is_disqualified).to be false
      end
    end
    it "returns a list sorted by standard points descending" do
      current_item_score = subject.get_best_standard_scores.first.standard_points if subject.get_best_standard_scores.first
      subject.get_best_standard_scores.each do |item|
        expect(item.standard_points).to be <= current_item_score
        current_item_score = item.standard_points
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_worst_standard_scores" do
    it "returns only not disqualified results" do
      subject.get_worst_standard_scores.each do |item|
        expect(item.is_disqualified).to be false
      end
      subject.get_worst_standard_scores(:is_female).each do |item|
        expect(item.is_disqualified).to be false
      end
    end
    it "returns a list sorted by standard points" do
      current_item_score = subject.get_worst_standard_scores.first.standard_points if subject.get_worst_standard_scores.first
      subject.get_worst_standard_scores.each do |item|
        expect(item.standard_points).to be >= current_item_score
        current_item_score = item.standard_points
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Assumes values are corrects and already spec'd
  # before for each single calculation method
  describe "#calculate_teams" do
    it "responds to #calculate_teams" do
      expect( subject ).to respond_to( :calculate_teams )
    end
    it "returns an array" do
      expect( subject.calculate_teams ).to be_a_kind_of( Array )
    end
    it "returns an array of MeetingStatDAO::TeamMeetingStatDAO" do
      expect( subject.calculate_teams ).to all(be_an_instance_of( MeetingStatDAO::TeamMeetingStatDAO ))
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Assumes values are corrects and already spec'd
  # before for each single calculation method
  describe "#calculate" do
    it "responds to #calculate" do
      expect( subject ).to respond_to( :calculate )
    end
    it "returns a MeetingStatDAO" do
      expect( subject.calculate ).to be_an_instance_of( MeetingStatDAO )
    end
    it "returns a MeetingStatDAO with teams count for a meeting with results" do
      expect( subject.has_results? ).to be true
      expect( subject.get_teams_count ).to be > 0
      expect( subject.get_results_count ).to be > 0
      ms = subject.calculate
      expect( ms.teams_count ).to be > 0
      expect( ms.get_results_count ).to eq( subject.get_results_count( :is_male ) + subject.get_results_count( :is_female ) )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "not a valid instance" do   
    it "raises an exception for wrong meeting parameter" do
      expect{ MeetingStatCalculator.new() }.to raise_error( ArgumentError )
      expect{ MeetingStatCalculator.new( 'Wrong parameter' ) }.to raise_error( ArgumentError )
    end   
  end
  #-- -------------------------------------------------------------------------
  #++
end
