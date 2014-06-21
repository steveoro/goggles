require 'spec_helper'
require 'date'


describe MeetingSession do

  context "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :description,
      :session_order,
      :scheduled_date
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  # This section is separated from the context below because really it's
  # more of a functional test instead of normal unit test.
  context "[a valid, pre-existing seeded domain]" do
    # TODO It uses a just a single predetermined seed to verify the values => Use a factory, forcing how many detail rows will be created instead, and move to the section below.
    subject { Meeting.find_by_id(13105).meeting_sessions.last }

    it_behaves_like( "MeetingAccountable",
      # These values were hand-verified for Meeting #13105, sess. #314: (single-session meeting)
      1,    # team_id
      297,  # tot_male_results
      164,  # tot_female_results
      92,   # tot_team_results
      64,   # tot_male_entries
      34,   # tot_female_entries
      98    # tot_team_entries
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "[a well formed instance]" do
    subject { create( :meeting_session ) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [ 
      :meeting
    ])    

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_short_name,
        :get_full_name,
        :get_verbose_name,
        :get_short_events,
        :get_scheduled_date,
        :get_warm_up_time,
        :get_begin_time,
        :get_pool_attributes,
        :get_pool_full_description,
        :get_order_with_date,
        :get_meeting_name,
        :get_meeting_verbose_name
      ])

      it_behaves_like( "(the existance of a method returning numeric values)", [ 
        :get_pool_length_in_meters,
        :get_pool_lanes_number
      ])

      it "#get_short_name should return correct short description: short day part and event list" do
        expect( subject.get_short_name ).not_to eq( '?' )
        #TODO Contains semicolon
      end
  
      it "#get_full_name should return correct full description: date full day part and event list" do
        expect( subject.get_full_name ).not_to eq( '?' )
        #TODO starts with a valid date
        #TODO Contains semicolon
      end

      it "#get_verbose_name should return correct verbose description: date full day part, timing schedule and event list" do
        expect( subject.get_verbose_name ).not_to eq( '?' )
        #TODO starts with a valid date
        #TODO Contains semicolon
        #TODO Contains parenthesis
      end

      it "#get_scheduled_date returns a date or 'To be defined...'"
      
      it "#get_warm_up_time returns a time or 'nd'"
      
      it "#get_begin_time returns a time or 'nd'"     
      
      it "has a method to return session events start list"     
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
