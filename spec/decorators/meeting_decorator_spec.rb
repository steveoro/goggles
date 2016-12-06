require 'rails_helper'


describe MeetingDecorator, type: :model do
  include Rails.application.routes.url_helpers

  before :each do
    @meeting = Meeting.find_by_id( [13101, 13102, 13103, 13105, 14101, 14102, 14103, 14104, 14105, 15101, 15102, 15103, 15104, 15105].sort{rand * 0.5}.first )
    expect( @meeting ).to be_an_instance_of(Meeting)
    @decorated_instance = MeetingDecorator.decorate( @meeting )
  end

  subject { @decorated_instance }


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method returning strings)", [
        :get_css_class_for_season_type
      ]
    )
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_logo_for_season_type" do
    it_behaves_like( "(the existance of a method)", [:get_logo_for_season_type] )

    context "while called on a well-defined instance," do
      it "returns either an ActiveSupport::SafeBuffer or a String" do
        result = subject.get_logo_for_season_type
        expect( result ).to be_an_instance_of(ActiveSupport::SafeBuffer).or be_an_instance_of(String)
      end
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_linked_short_name" do
    it "responds to #get_linked_short_name method" do
      expect( subject ).to respond_to( :get_linked_short_name )
    end
    it "returns an HTML link" do
      expect( subject.get_linked_short_name ).to include( 'href' )
    end
    it "returns an HTML link to the meeting show full path" do
      expect( subject.get_linked_short_name ).to include( meeting_show_full_path(id: subject.id) )
    end
    it "returns a string containing the meeting short name" do
      expect( subject.get_linked_short_name ).to include( ERB::Util.html_escape(subject.get_short_name) )
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_linked_city_with_date" do
    it "responds to #get_linked_short_name method" do
      expect( subject ).to respond_to( :get_linked_city_with_date )
    end
    it "returns an HTML link" do
      expect( subject.get_linked_city_with_date ).to include( 'href' )
    end
    it "returns an HTML link to the meeting show full path" do
      expect( subject.get_linked_city_with_date ).to include( meeting_show_full_path(id: subject.id) )
    end
    it "returns a string containing the meeting shortest name" do
      expect( subject.get_linked_city_with_date ).to include( ERB::Util.html_escape(subject.get_city) )
    end
    it "returns a string containing the meeting scheduled date" do
      expect( subject.get_linked_city_with_date ).to include( ERB::Util.html_escape(subject.get_scheduled_date) )
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_linked_full_name_with_date" do
    it "responds to #get_linked_full_name_with_date method" do
      expect( subject ).to respond_to( :get_linked_full_name_with_date )
    end
    it "returns an HTML link" do
      expect( subject.get_linked_full_name_with_date ).to include( 'href' )
    end
    it "returns an HTML link to the meeting show full path" do
      expect( subject.get_linked_full_name_with_date ).to include( meeting_show_full_path(id: subject.id) )
    end
    it "returns a string containing the meeting full name" do
      expect( subject.get_linked_full_name_with_date ).to include( ERB::Util.html_escape(subject.get_full_name) )
    end
    it "returns a string containing the meeting scheduled date" do
      expect( subject.get_linked_full_name_with_date ).to include( ERB::Util.html_escape(subject.get_scheduled_date) )
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_linked_full_name" do
    it "responds to #get_linked_full_name method" do
      expect( subject ).to respond_to( :get_linked_full_name )
    end
    it "returns an HTML link" do
      expect( subject.get_linked_full_name ).to include( 'href' )
    end
    it "returns an HTML link to the meeting show full path" do
      expect( subject.get_linked_full_name ).to include( meeting_show_full_path(id: subject.id) )
    end
    it "returns a string containing the meeting full name" do
      expect( subject.get_linked_full_name ).to include( ERB::Util.html_escape(subject.get_full_name) )
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_linked_name" do
    it "responds to #get_linked_name method" do
      expect( subject ).to respond_to( :get_linked_name )
    end

    context "without parameters" do
      it "returns an HTML link" do
        expect( subject.get_linked_name ).to include( 'href' )
      end
      it "returns an HTML link to the meeting show full path" do
        expect( subject.get_linked_name ).to include( meeting_show_full_path(id: subject.id) )
      end
      it "returns a string containing the meeting short name as default" do
        expect( subject.get_linked_name ).to include( ERB::Util.html_escape(subject.get_short_name) )
      end
    end

    context "with get_short_name as parameter" do
      it "returns an HTML link" do
        expect( subject.get_linked_name( :get_short_name ) ).to include( 'href' )
      end
      it "returns an HTML link to the meeting show full path" do
        expect( subject.get_linked_name( :get_short_name ) ).to include( meeting_show_full_path(id: subject.id) )
      end
      it "returns a string containing the meeting short name" do
        expect( subject.get_linked_name( :get_short_name ) ).to include( ERB::Util.html_escape(subject.get_short_name) )
      end
    end

    context "with :get_full_name as parameter" do
      it "returns an HTML link" do
        expect( subject.get_linked_name( :get_full_name ) ).to include( 'href' )
      end
      it "returns an HTML link to the meeting show full path" do
        expect( subject.get_linked_name( :get_full_name ) ).to include( meeting_show_full_path(id: subject.id) )
      end
      it "returns a string containing the meeting short name" do
        expect( subject.get_linked_name( :get_full_name ) ).to include( ERB::Util.html_escape(subject.get_full_name) )
      end
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#manage_reservation_button" do
    it "responds to #manage_reservation_button" do
      expect( subject ).to respond_to( :manage_reservation_button )
    end

    context "with nil current User," do
      it "returns an empty string" do
        expect( subject.manage_reservation_button(nil) ).to eq('')
      end
    end

    context "with a user that is not a team_manager," do
      it "returns an empty string" do
        expect( subject.manage_reservation_button(create(:user)) ).to eq('')
      end
    end

    context "with a User that is a team_manager but not for the current meeting/season," do
      it "returns an empty string" do
        expect( subject.manage_reservation_button(create(:team_manager).user) ).to eq('')
      end
    end

    context "with a User that is a valid team_manager for the selected meeting (and the meeting doesn't have results acquired)," do
      let(:meeting)       { create(:meeting, header_date: Date.today + 10.days) }
      let(:team_manager)  do
        create(
          :team_manager,
          team_affiliation: create(:team_affiliation, season: meeting.season )
        )
      end
      subject { meeting.decorate }

# FIXME [20161206] FEATURE CURRENTLY DISABLED AND RELEASE POSTPONED:
# TODO ENABLE THE FOLLOWING TESTS AND EDIT meeting_decorator.rb, lines 124-129 TO ENABLE IT
      xit "returns an HTML link" do
        expect( subject.manage_reservation_button(team_manager.user) ).to include( 'href' )
      end
      xit "returns an HTML link to the meeting_reservations_edit path" do
        expect( subject.manage_reservation_button(team_manager.user) ).to include( meeting_reservations_edit_path(id: subject.id) )
      end
      xit "returns a string containing the manage reservation button title" do
        expect( subject.manage_reservation_button(team_manager.user) ).to include( I18n.t('meeting_reservation.manage_button_title') )
      end
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_session_warm_up_times" do
    it "responds to #get_session_warm_up_times method" do
      expect( subject ).to respond_to( :get_session_warm_up_times )
    end
    it "returns a string" do
      expect( subject.get_session_warm_up_times ).to be_a_kind_of( String )
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_session_begin_times" do
    it "responds to #get_session_begin_times method" do
      expect( subject ).to respond_to( :get_session_begin_times )
    end
    it "returns a string" do
      expect( subject.get_session_begin_times ).to be_a_kind_of( String )
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_linked_swimming_pool" do
    it "responds to #get_linked_swimming_pool" do
      expect( subject ).to respond_to( :get_linked_swimming_pool )
    end

    context "meeting with defined swimming pool" do
      it "returns a string" do
        expect( subject.get_linked_swimming_pool ).to be_a_kind_of( String )
      end
      it "returns an HTML link" do
        expect( subject.get_linked_swimming_pool ).to include( 'href' )
      end
      it "returns an HTML link to the swimming pool path" do
        expect( subject.get_linked_swimming_pool ).to include( swimming_pool_path(id: subject.get_swimming_pool.id) )
      end
      it "returns a string containing the swimming pool name" do
        expect( subject.get_linked_swimming_pool ).to include( ERB::Util.html_escape(subject.get_swimming_pool.get_full_name) )
      end
      it "returns a string containing the swimming pool choosen type name" do
        expect( subject.get_linked_swimming_pool( :get_verbose_name ) ).to include( ERB::Util.html_escape(subject.get_swimming_pool.get_verbose_name) )
      end
    end

    context "meeting without defined swimming pool" do
      before :each do
        @empty_meeting = create( :meeting ).decorate
      end

      it "returns a string" do
        expect( @empty_meeting.get_linked_swimming_pool ).to be_a_kind_of( String )
      end
      it "returns an HTML link" do
        expect( @empty_meeting.get_linked_swimming_pool ).to include( '?' )
      end
      it "returns an HTML link" do
        expect( @empty_meeting.get_linked_swimming_pool ).not_to include( 'href' )
      end
    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
