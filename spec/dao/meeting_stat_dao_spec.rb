require 'spec_helper'

shared_examples_for "(existance of a member array of hashes)" do |member_name_array|
  member_name_array.each do |member_name|
    it "responds to ##{member_name}" do
      expect( subject ).to respond_to( member_name )
    end

    it "has a ##{member_name} array" do
      expect( subject.send(member_name.to_sym) ).to be_a_kind_of( Array )
    end
  end
end


describe MeetingStatDAO, :type => :model do
  
  # Pre-loaded seeded last CSI season and some acquired FIN
  before(:all) do
    @seeded_meets = [12101, 12102, 12103, 12104, 12105, 13101, 13102, 13103, 13104, 13105, 13106, 13223]
    @meeting_with_entries = [14105, 14106, 15101, 15102, 15103]
    @meeting_without_entries = [12101, 12102, 12103, 13223, 15207]
  end
  
  let( :meeting )              { Meeting.find( @seeded_meets.at( (rand * @seeded_meets.size).to_i ) ) }
  let( :meet_with_entries )    { Meeting.find( @meeting_with_entries.at( ( rand * @meeting_with_entries.size ).to_i ) ) }
  let( :meet_without_entries ) { Meeting.find( @meeting_without_entries.at( ( rand * @meeting_without_entries.size ).to_i ) ) }

  context "TeamMeetingStatDAO subclass," do
    
    let( :team )               { meeting.teams.at( ( rand * meeting.teams.count ).to_i ) }

    subject { MeetingStatDAO::TeamMeetingStatDAO.new( team ) }
  
    describe "[a well formed instance]" do
      it "team is the one used in costruction" do
        expect( subject.team ).to eq( team )
      end

      it_behaves_like( "(the existance of a method returning numeric values)", [
        :male_entries,      :female_entries, 
        :male_ent_swimmers, :female_ent_swimmers,
        :male_results,      :female_results,
        :male_swimmers,     :female_swimmers,
        :male_best,         :female_best,
        :male_worst,        :female_worst,
        :male_average,      :female_average
      ])
    end
    #-- -------------------------------------------------------------------------

    describe "#get_entries_count" do
      it "returns sum of male and female entries count" do
        expect(subject.get_entries_count).to eq(subject.male_entries + subject.female_entries)
      end
    end

    describe "#get_results_count" do
      it "returns sum of male and female results count" do
        expect(subject.get_results_count).to eq(subject.male_results + subject.female_results)
      end
    end

    describe "#get_swimmers_count" do
      it "returns sum of male and female swimmers count" do
        expect(subject.get_swimmers_count).to eq(subject.male_swimmers + subject.female_swimmers)
      end
    end

    describe "#get_golds_count" do
      it "returns sum of male and female golds count" do
        expect(subject.get_golds_count).to eq(subject.male_golds + subject.female_golds)
      end
    end

    describe "#get_silvers_count" do
      it "returns sum of male and female silvers count" do
        expect(subject.get_silvers_count).to eq(subject.male_silvers + subject.female_silvers)
      end
    end

    describe "#get_bronzes_count" do
      it "returns sum of male and female bronzes count" do
        expect(subject.get_bronzes_count).to eq(subject.male_bronzes + subject.female_bronzes)
      end
    end
    #-- -------------------------------------------------------------------------

    context "not a valid instance" do   
      it "raises an exception for wrong meeting parameter" do
        expect{ MeetingStatDAO::TeamMeetingStatDAO.new() }.to raise_error( ArgumentError )
        expect{ MeetingStatDAO::TeamMeetingStatDAO.new( 'Wrong parameter' ) }.to raise_error( ArgumentError )
      end   
    end
    #-- -------------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++
  
  subject { MeetingStatDAO.new( meeting ) }

  describe "[a well formed instance]" do
    it "meeting is the one used in costruction" do
      expect( subject.meeting ).to eq( meeting )
    end

    it "has a valid meeting instance" do
      expect(subject.get_meeting).to be_an_instance_of( Meeting )
    end

    it "responds to generals" do
      expect( subject ).to respond_to( :generals )
    end

    it "has a generals hash" do
      expect( subject.generals ).to be_a_kind_of( Hash )
    end

    it_behaves_like( "(existance of a member array of hashes)", [
      :teams,
      :categories,
      :events
    ])

    describe "#get_general" do
      it "respondo to #get_general" do
        expect( subject ).to respond_to( :get_general )
      end
      it "returns a value if parameter corrisponding to a valid key" do
        valid_key = :teams_count
        expect( subject.generals.has_key?( valid_key ) ).to be true
        expect( subject.get_general( valid_key ) ).not_to be_nil
      end
      it "returns nil if parameter not corrisponding to a valid key" do
        expect( subject.get_general( :wrong_key ) ).to be_nil
      end
      it "returns a not nil value for each general valid key" do
        subject.generals.keys.each do |valid_key|
          expect( subject.get_general( valid_key ) ).not_to be_nil
        end
      end
    end

    describe "#set_general" do
      it "respondo to #set_general" do
        expect( subject ).to respond_to( :set_general )
      end
      it "sets the given value to the parameter if parameter corrisponding to a valid key" do
        valid_key = :teams_count
        value     = ( rand * 100 ).to_i
        expect( subject.generals.has_key?( valid_key ) ).to be true
        expect( subject.get_general( valid_key ) ).to eq( 0 )
        subject.set_general( valid_key, value )
        expect( subject.get_general( valid_key ) ).to eq( value )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_entered_swimmers_count" do
    it "returns sum of male and female entered swimmers count" do
      expect(subject.get_entered_swimmers_count).to eq(subject.ent_swimmers_male_count + subject.ent_swimmers_female_count)
    end
  end

  describe "#get_entries_count" do
    it "returns sum of male and female entries count" do
      expect(subject.get_entries_count).to eq(subject.entries_male_count + subject.entries_female_count)
    end
  end

  describe "#get swimmers_count" do
    it "returns sum of male and female swimmers count" do
      expect(subject.get_swimmers_count).to eq(subject.swimmers_male_count + subject.swimmers_female_count)
    end
  end

  describe "#get_results_count" do
    it "returns sum of male and female results count" do
      expect(subject.get_results_count).to eq(subject.results_male_count + subject.results_female_count)
    end
  end

  describe "#get_disqualifieds_count" do
    it "returns sum of male and female results count" do
      expect(subject.get_disqualifieds_count).to eq(subject.dsqs_male_count + subject.dsqs_female_count)
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "not a valid instance" do   
    it "raises an exception for wrong meeting parameter" do
      expect{ MeetingStatDAO.new() }.to raise_error( ArgumentError )
      expect{ MeetingStatDAO.new( 'Wrong parameter' ) }.to raise_error( ArgumentError )
    end   
  end
  #-- -------------------------------------------------------------------------
  #++
end
