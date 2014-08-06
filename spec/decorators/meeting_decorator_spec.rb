require 'spec_helper'


describe MeetingDecorator do
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
end
