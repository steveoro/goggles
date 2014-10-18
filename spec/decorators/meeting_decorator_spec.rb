require 'spec_helper'


describe MeetingDecorator, type: :model do
  include Rails.application.routes.url_helpers

  before :each do
#    @meeting = Meeting.find_by_id( ((rand * Meeting.count) % Meeting.count).to_i + 1 )
    # FIXME Randomize correctly this: (the above gets some wrong IDs)
    @meeting = Meeting.find_by_id( 13105 )
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
    it "returns a string containing the meeting scheduled date" do
      expect( subject.get_linked_short_name ).to include( ERB::Util.html_escape(subject.get_scheduled_date) )
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  describe "#get_linked_name" do
    it "responds to #get_linked_name method" do
      expect( subject ).to respond_to( :get_linked_name )
    end
    it "returns an HTML link" do
      expect( subject.get_linked_name ).to include( 'href' )
    end
    it "returns an HTML link to the meeting show full path" do
      expect( subject.get_linked_name ).to include( meeting_show_full_path(id: subject.id) )
    end
    it "returns a string containing the meeting short name" do
      expect( subject.get_linked_name ).to include( ERB::Util.html_escape(subject.get_short_name) )
    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
