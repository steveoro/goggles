# encoding: utf-8

require 'spec_helper'

describe BalancedIndividualRankingDAO, type: :model do
  let(:season)  { Season.find(141) }
  let(:swimmer) { season.swimmers[ ((rand * season.swimmers.count) % season.swimmers.count).to_i ] }
  let(:meeting) { season.meetings[ ((rand * season.meetings.count) % season.meetings.count).to_i ] }
  let(:mir)     { meeting.meeting_individual_results.is_valid.where(["meeting_individual_results.swimmer_id = ?", swimmer.id]) }

  context "BIREventScoreDAO subclass," do
    
    let(:meeting_individual_result) { create(:meeting_individual_result) }
    
    subject { BalancedIndividualRankingDAO::BIREventScoreDAO.new( meeting_individual_result ) }

    it_behaves_like( "(the existance of a method)", [
      :event_date, :event_type, :rank, :event_points, :ranking_points, :get_total_points
    ] )

    describe "#event_date" do
      it "is the event date for the meeting individual result used in construction" do
        expect( subject.event_date ).to eq( meeting_individual_result.meeting_session.scheduled_date )
      end
    end
    describe "#event_type" do
      it "is the event type for the meeting individual result used in construction" do
        expect( subject.event_type ).to eq( meeting_individual_result.event_type )
      end
    end
    describe "#rank" do
      it "is the rank for the meeting individual result used in construction" do
        expect( subject.rank ).to eq( meeting_individual_result.rank )
      end
    end
    describe "#event_points" do
      it "is the event points for the meeting individual result used in construction" do
        expect( subject.event_points ).to eq( meeting_individual_result.meeting_individual_points )
      end
    end
    describe "#ranking_points" do
      it "is a value between 0 and 100" do
        expect( subject.ranking_points ).to be >= 0 
        expect( subject.ranking_points ).to be <= 100 
      end
    end
    
    describe "#get_total_points" do
      it "is the sum of event_points and ranking_points" do
        expect( subject.get_total_points ).to eq( subject.ranking_points + subject.event_points ) 
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "BIRMeetingScoreDAO subclass," do
    
    subject { BalancedIndividualRankingDAO::BIRMeetingScoreDAO.new( meeting, mir ) }
    
    it_behaves_like( "(the existance of a method)", [
      :header_date, :event_bonus_points, :medal_bonus_points, :event_points, :ranking_points, :event_results, :get_total_points
    ] )

    describe "#header_date" do
      it "is the header date for the meeting used in construction" do
        expect( subject.header_date ).to eq( meeting.header_date )
      end
    end
    describe "#event_bonus_points" do
      it "is a value between 0 and 8" do
        expect( subject.event_bonus_points ).to be >= 0 
        expect( subject.event_bonus_points ).to be <= 8 
      end
    end
    describe "#medal_bonus_points" do
      it "is a value between 0 and 10" do
        expect( subject.medal_bonus_points ).to be >= 0 
        expect( subject.medal_bonus_points ).to be <= 10 
      end
    end
    describe "#event_points" do
      it "is a value between 0 and 100" do
        expect( subject.event_points ).to be >= 0 
        expect( subject.event_points ).to be <= 100 
      end
    end
    describe "#ranking_points" do
      it "is a value between 0 and 100" do
        expect( subject.ranking_points ).to be >= 0 
        expect( subject.ranking_points ).to be <= 100 
      end
    end
    describe "#event_results" do
      it "is a collection of BIREventScoreDAO" do
        expect( subject.event_results ).to be_a_kind_of( Enumerable )
        expect( subject.event_results ).to all(be_a_kind_of( BalancedIndividualRankingDAO::BIREventScoreDAO ))
      end
      it "is has an instance per each meeting individual result used in construction" do
        expect( subject.event_results.count ).to eq( mir.count )
      end
    end
    
    describe "#get_total_points" do
      it "is a value between 0 and 218 (100 + 100 + 10 + 8)" do
        expect( subject.get_total_points ).to be >= 0 
        expect( subject.get_total_points ).to be <= 218 
      end
      it "is the sum of event_points, ranking_points, medal_bonus and event_bonus" do
        expect( subject.get_total_points ).to eq( subject.ranking_points + subject.event_points + subject.event_bonus_points + subject.medal_bonus_points) 
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "BIRSwimmerScoreDAO subclass," do
    
    subject { BalancedIndividualRankingDAO::BIRSwimmerScoreDAO.new( swimmer, season ) }
    
    it_behaves_like( "(the existance of a method)", [
      :swimmer, :category_type, :gender_type, :meetings, :total_best_5_on_6, :get_meeting_scores
    ] )

    describe "#swimmer" do
      it "is the swimmer used in construction" do
        expect( subject.swimmer ).to eq( swimmer )
      end
    end
    describe "#category_type" do
      it "is the category_type of the swimmer in the season" do
        expect( subject.category_type ).to eq( swimmer.get_category_type_for_season( season.id ) )
      end
    end
    describe "#gender_type" do
      it "is the gender_type of the swimmer" do
        expect( subject.gender_type ).to eq( swimmer.gender_type )
      end
    end
    describe "#meetings" do
      it "is a collection of BIRMeetingScoreDAO" do
        expect( subject.meetings ).to be_a_kind_of( Enumerable )
        expect( subject.meetings ).to all(be_a_kind_of( BalancedIndividualRankingDAO::BIRMeetingScoreDAO ))
      end
      it "is has no more than one instance per each meeting of the season" do
        expect( subject.meetings.count ).to be <= season.meetings.count
      end
    end
    describe "#total_best_5_on_6" do
      it "is a value between 0 and 1090 (100 + 100 + 10 + 8) * 5" do
        expect( subject.total_best_5_on_6 ).to be >= 0 
        expect( subject.total_best_5_on_6 ).to be <= 1090 
      end
    end
    describe "#get_meeting_scores" do
      it "returns a BIRMeetingScoreDAO or nil" do
        expect( subject.get_meeting_scores( meeting ) ).to be_a_kind_of( BalancedIndividualRankingDAO::BIRMeetingScoreDAO ).or be_nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  

  context "BIRGenderCategoryRankingDAO subclass," do
    
    subject { BalancedIndividualRankingDAO::BIRGenderCategoryRankingDAO.new( season, swimmer.gender_type, swimmer.get_category_type_for_season( season.id ) ) }
    
    it_behaves_like( "(the existance of a method)", [
      :gender_type, :category_type, :swimmers, 
    ] )

    describe "#category_type" do
      it "is the category_type of the swimmer in the season" do
        expect( subject.category_type ).to eq( swimmer.get_category_type_for_season( season.id ) )
      end
    end
    describe "#gender_type" do
      it "is the gender_type of the swimmer" do
        expect( subject.gender_type ).to eq( swimmer.gender_type )
      end
    end
    describe "#swimmers" do
      it "is a collection of BIRSwimmerScoreDAO" do
        expect( subject.swimmers ).to be_a_kind_of( Enumerable )
        expect( subject.swimmers ).to all(be_a_kind_of( BalancedIndividualRankingDAO::BIRSwimmerScoreDAO ))
      end
      it "is has no more than one instance per each swimmer of the season" do
        expect( subject.swimmers.count ).to be <= season.swimmers.count
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  
  context "as a valid instance," do

    subject { BalancedIndividualRankingDAO.new( season ) }

    it_behaves_like( "(the existance of a method)", [
      :season, :gender_and_categories, :meetings_with_results, :get_ranking_for_gender_and_category, :scan_for_gender_and_category, :calculate_ranking, :set_ranking_for_gender_and_category
    ] )

    describe "#season" do
      it "is the season specified for the construction" do
        expect( subject.season ).to eq( season )
      end
    end
    describe "#gender_and_categories" do
      it "is a collection of BIRSwimmerScoreDAO" do
        subject.scan_for_gender_and_category
        expect( subject.gender_and_categories ).to be_a_kind_of( Enumerable )
        expect( subject.gender_and_categories ).to all(be_a_kind_of( BalancedIndividualRankingDAO::BIRGenderCategoryRankingDAO ))
      end
    end
    describe "#meetings_with_results" do
      it "is a collection of Meeting" do
        expect( subject.meetings_with_results ).to be_a_kind_of( ActiveRecord::Relation )
        expect( subject.meetings_with_results ).to all(be_a_kind_of( Meeting ))
      end
      it "has a count between 0 and total season meetings" do
        expect( subject.meetings_with_results.count ).to be >= 0 
        expect( subject.meetings_with_results.count ).to be <= season.meetings.count 
      end
    end
    
    describe "#get_ranking_for_gender_and_category" do
      it "returns null if ranking not calculated" do
        expect( subject.get_ranking_for_gender_and_category( swimmer.gender_type, swimmer.get_category_type_for_season( season.id ) ) ).to be_nil
      end
      it "returns a BIRSwimmerScoreDAO if ranking calculated" do
        subject.set_ranking_for_gender_and_category( swimmer.gender_type, swimmer.get_category_type_for_season( season.id ) )
        expect( subject.get_ranking_for_gender_and_category( swimmer.gender_type, swimmer.get_category_type_for_season( season.id ) ) ).to be_a_kind_of( BalancedIndividualRankingDAO::BIRGenderCategoryRankingDAO )
      end
    end
    
    describe "#set_ranking_for_gender_and_category" do
      it "increments the rank calculated" do
        subject.gender_and_categories.clear
        prev_rank = subject.gender_and_categories.size
        subject.set_ranking_for_gender_and_category( swimmer.gender_type, swimmer.get_category_type_for_season( season.id ) )
        expect( subject.gender_and_categories.size ).to be > prev_rank 
      end
    end
    
    describe "#calculate_ranking" do
      it "returns a BIRSwimmerScoreDAO" do
        expect( subject.calculate_ranking( swimmer.gender_type, swimmer.get_category_type_for_season( season.id ) ) ).to be_a_kind_of( BalancedIndividualRankingDAO::BIRGenderCategoryRankingDAO )
      end
    end
    
    describe "#scan_for_gender_and_category" do
      it "returns a collection of BIRSwimmerScoreDAO" do
        subject.scan_for_gender_and_category
        expect( subject.gender_and_categories.size ).to be > 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  
  context "not a valid instance" do   
    it "raises an exception for wrong season parameter" do
      expect{ BalancedIndividualRankingDAO.new( 'Wrong parameter' ) }.to raise_error( ArgumentError )
      expect{ BalancedIndividualRankingDAO.new( meeting ) }.to raise_error( ArgumentError )
    end   
  end
  #-- -------------------------------------------------------------------------
  #++
end

