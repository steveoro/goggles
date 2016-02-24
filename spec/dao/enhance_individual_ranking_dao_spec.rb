# encoding: utf-8

require 'spec_helper'

describe EnhanceIndividualRankingDAO, type: :model do
  let(:season)  { Season.find(151) }
  let(:meeting) { season.meetings.has_results[ (rand * (season.meetings.has_results.count - 1)).to_i ] }
  let(:swimmer) { meeting.swimmers[ (rand * (meeting.swimmers.count - 1)).to_i ] }
  let(:mirs)    { meeting.meeting_individual_results.is_valid.where(["meeting_individual_results.swimmer_id = ?", swimmer.id]) }

  context "EIREventScoreDAO subclass," do
    
    #let(:meeting_individual_result) { season.meeting_individual_results.is_valid[ ((rand * season.meeting_individual_results.is_valid.count) % season.meeting_individual_results.is_valid.count).to_i ] }
    let(:meeting_individual_result) { meeting.meeting_individual_results.is_valid[ (rand * (meeting.meeting_individual_results.is_valid.count - 1)).to_i ] }
    
    subject { EnhanceIndividualRankingDAO::EIREventScoreDAO.new( meeting_individual_result ) }

    it_behaves_like( "(the existance of a method)", [
      :event_date, :event_type, :rank, :event_points, :enhance_points, :prestation_points, :get_total_points
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
    describe "#enhance_points" do
      it "is a value between 0 and 10" do
        expect( subject.enhance_points ).to be >= 0 
        expect( subject.enhance_points ).to be <= 10 
      end
    end
    describe "#prestation_points" do
      it "is a value between 0 and 100" do
        expect( subject.prestation_points ).to be >= 0 
        expect( subject.prestation_points ).to be <= 100 
      end
    end
    
    describe "#compute_enhance_points" do
      it "returns a number between 0 and 10" do
        expect( subject.compute_enhance_points( meeting_individual_result ) ).to be >= 0 
        expect( subject.compute_enhance_points( meeting_individual_result ) ).to be <= 10 
      end
      
      it "returns 0 if time swam worst than standard" do
        better_personal_standard = create( :season_personal_standard, season: season, swimmer: meeting_individual_result.swimmer, event_type: meeting_individual_result.event_type, pool_type: meeting_individual_result.pool_type )
        expect( SeasonPersonalStandard.has_standard?( season.id, meeting_individual_result.swimmer_id, meeting_individual_result.pool_type.id, meeting_individual_result.event_type.id ) ).to be true 
        better_personal_standard.minutes = meeting_individual_result.minutes > 1 ? meeting_individual_result.minutes - 1 : 0  
        better_personal_standard.seconds = meeting_individual_result.seconds > 14 ? meeting_individual_result.seconds - 14 : meeting_individual_result.seconds
        better_personal_standard.hundreds = 0
        better_personal_standard.save
        expect( SeasonPersonalStandard.get_standard( season.id, meeting_individual_result.swimmer_id, meeting_individual_result.pool_type.id, meeting_individual_result.event_type.id ).get_timing_instance.to_hundreds ).to be < meeting_individual_result.get_timing_instance.to_hundreds  
        expect( subject.compute_enhance_points( meeting_individual_result ) ).to eq( 0 ) 
      end

      it "returns a value > 0 if time swam better than standard" do
        worst_personal_standard = create( :season_personal_standard, season: season, swimmer: meeting_individual_result.swimmer, event_type: meeting_individual_result.event_type, pool_type: meeting_individual_result.pool_type )
        expect( SeasonPersonalStandard.has_standard?( season.id, meeting_individual_result.swimmer_id, meeting_individual_result.pool_type.id, meeting_individual_result.event_type.id ) ).to be true 
        worst_personal_standard.minutes = meeting_individual_result.minutes + 1
        worst_personal_standard.save
        expect( SeasonPersonalStandard.get_standard( season.id, meeting_individual_result.swimmer_id, meeting_individual_result.pool_type.id, meeting_individual_result.event_type.id ).get_timing_instance.to_hundreds ).to be > meeting_individual_result.get_timing_instance.to_hundreds  
        expect( subject.compute_enhance_points( meeting_individual_result ) ).to be > 0 
        expect( subject.compute_enhance_points( meeting_individual_result ) ).to be <= 10 
      end

      it "returns 10 if time swam better than 10% of standard" do
        time_standard = Timing.new( ( meeting_individual_result.get_timing_instance.to_hundreds * 1.2 ).to_i ) 
        worst_personal_standard = create( :season_personal_standard, season: season, swimmer: meeting_individual_result.swimmer, event_type: meeting_individual_result.event_type, pool_type: meeting_individual_result.pool_type )
        expect( SeasonPersonalStandard.has_standard?( season.id, meeting_individual_result.swimmer_id, meeting_individual_result.pool_type.id, meeting_individual_result.event_type.id ) ).to be true 
        worst_personal_standard.minutes = time_standard.minutes  
        worst_personal_standard.seconds = time_standard.seconds  
        worst_personal_standard.hundreds = time_standard.hundreds  
        worst_personal_standard.save
        expect( SeasonPersonalStandard.get_standard( season.id, meeting_individual_result.swimmer_id, meeting_individual_result.pool_type.id, meeting_individual_result.event_type.id ).get_timing_instance.to_hundreds ).to be >= (meeting_individual_result.get_timing_instance.to_hundreds * 1.2).to_i  
        expect( subject.compute_enhance_points( meeting_individual_result ) ).to eq( 10 ) 
      end

      it "returns a number corresponding to the improvement percentage" do
        improvement = 1 + ( ( rand * 10 ).to_i ) / 10
        time_standard = Timing.new( ( meeting_individual_result.get_timing_instance.to_hundreds * improvement ).to_i ) 
        worst_personal_standard = create( :season_personal_standard, season: season, swimmer: meeting_individual_result.swimmer, event_type: meeting_individual_result.event_type, pool_type: meeting_individual_result.pool_type )
        expect( SeasonPersonalStandard.has_standard?( season.id, meeting_individual_result.swimmer_id, meeting_individual_result.pool_type.id, meeting_individual_result.event_type.id ) ).to be true 
        worst_personal_standard.minutes = time_standard.minutes  
        worst_personal_standard.seconds = time_standard.seconds  
        worst_personal_standard.hundreds = time_standard.hundreds  
        worst_personal_standard.save
        expect( SeasonPersonalStandard.get_standard( season.id, meeting_individual_result.swimmer_id, meeting_individual_result.pool_type.id, meeting_individual_result.event_type.id ).get_timing_instance.to_hundreds ).to be >= (meeting_individual_result.get_timing_instance.to_hundreds * improvement ).to_i  
        expect( subject.compute_enhance_points( meeting_individual_result ) ).to eq( ( improvement - 1 ) * 10 ) 
      end
    end

    describe "#get_total_points" do
      it "is the sum of event_points, prestation points and enhance_points" do
        expect( subject.get_total_points ).to eq( subject.enhance_points + subject.prestation_points + subject.event_points ) 
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "EIRMeetingScoreDAO subclass," do
    
    subject { EnhanceIndividualRankingDAO::EIRMeetingScoreDAO.new( meeting, mirs ) }
    
    it_behaves_like( "(the existance of a method)", [
      :header_date, :event_bonus_points, :medal_bonus_points, :event_points, :prestation_points, :enhance_points, :event_results, :get_total_points
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
    describe "#prestation_points" do
      it "is a value between 0 and 100" do
        expect( subject.prestation_points ).to be >= 0 
        expect( subject.prestation_points ).to be <= 100 
      end
    end
    describe "#enhance_points" do
      it "is a value between 0 and 10" do
        expect( subject.enhance_points ).to be >= 0 
        expect( subject.enhance_points ).to be <= 10 
      end
    end
    describe "#event_results" do
      it "is a collection of BIREventScoreDAO" do
        expect( subject.event_results ).to be_a_kind_of( Enumerable )
        expect( subject.event_results ).to all(be_a_kind_of( EnhanceIndividualRankingDAO::EIREventScoreDAO ))
      end
      it "is has an instance per each meeting individual result used in construction" do
        expect( subject.event_results.count ).to eq( mirs.count )
      end
    end
    
    describe "#get_total_points" do
      it "is a value between 0 and 128 (100 + 10 + 10 + 8)" do
        expect( subject.get_total_points ).to be >= 0 
        expect( subject.get_total_points ).to be <= 128 
      end
      it "is the sum of event_points, prestation_points, enhance_points, ranking_points, medal_bonus and hard event_bonus" do
        expect( subject.get_total_points ).to eq( subject.event_points + subject.prestation_points + subject.enhance_points + subject.event_bonus_points + subject.medal_bonus_points ) 
      end
    end

    describe "#get_meeting_scores_detail" do
      it "returns a string" do
        expect( subject.get_meeting_scores_detail ).to be_a_kind_of( String ) 
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "BIRSwimmerScoreDAO subclass," do
    
    subject { EnhanceIndividualRankingDAO::EIRSwimmerScoreDAO.new( swimmer, season ) }
    
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
      it "is a collection of EIRMeetingScoreDAO" do
        expect( subject.meetings ).to be_a_kind_of( Enumerable )
        expect( subject.meetings ).to all(be_a_kind_of( EnhanceIndividualRankingDAO::EIRMeetingScoreDAO ))
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
      it "returns a EIRMeetingScoreDAO or nil" do
        expect( subject.get_meeting_scores( meeting ) ).to be_a_kind_of( EnhanceIndividualRankingDAO::EIRMeetingScoreDAO ).or be_nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  

  context "EIRGenderCategoryRankingDAO subclass," do
    
    subject { EnhanceIndividualRankingDAO::EIRGenderCategoryRankingDAO.new( season, swimmer.gender_type, swimmer.get_category_type_for_season( season.id ) ) }
    
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
        expect( subject.swimmers ).to all(be_a_kind_of( EnhanceIndividualRankingDAO::EIRSwimmerScoreDAO ))
      end
      it "is has no more than one instance per each swimmer of the season" do
        expect( subject.swimmers.count ).to be <= season.swimmers.count
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  
  context "as a valid instance," do

    subject { EnhanceIndividualRankingDAO.new( season ) }

    it_behaves_like( "(the existance of a method)", [
      :season, :gender_and_categories, :meetings_with_results, 
      :get_ranking_for_gender_and_category, :scan_for_gender_and_category, :calculate_ranking, :set_ranking_for_gender_and_category
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
        expect( subject.gender_and_categories ).to all(be_a_kind_of( EnhanceIndividualRankingDAO::EIRGenderCategoryRankingDAO ))
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
        expect( subject.get_ranking_for_gender_and_category( swimmer.gender_type, swimmer.get_category_type_for_season( season.id ) ) ).to be_a_kind_of( EnhanceIndividualRankingDAO::EIRGenderCategoryRankingDAO )
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
        expect( subject.calculate_ranking( swimmer.gender_type, swimmer.get_category_type_for_season( season.id ) ) ).to be_a_kind_of( EnhanceIndividualRankingDAO::EIRGenderCategoryRankingDAO )
      end
    end
    
    describe "#scan_for_gender_and_category" do
      it "returns a collection of BIRSwimmerScoreDAO" do
        subject.gender_and_categories.clear
        subject.scan_for_gender_and_category
        expect( subject.gender_and_categories.size ).to be > 0
        expect( subject.gender_and_categories ).to all(be_a_kind_of( EnhanceIndividualRankingDAO::EIRGenderCategoryRankingDAO ))
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  
  context "not a valid instance" do   
    it "raises an exception for wrong season parameter" do
      expect{ EnhanceIndividualRankingDAO.new( 'Wrong parameter' ) }.to raise_error( ArgumentError )
      expect{ EnhanceIndividualRankingDAO.new( meeting ) }.to raise_error( ArgumentError )
    end   
  end
  #-- -------------------------------------------------------------------------
  #++
end

