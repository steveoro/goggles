require 'rails_helper'


describe SwimmerPresenceDAO, type: :model do

  let(:fix_swimmer)       { Swimmer.find(23) }
  let(:fix_date)          { Date.today() - (rand * 300).to_i }
  let(:fix_year )         { fix_date.month < 10 ? fix_date.year - 1 : fix_date.year }
  let(:fix_header_year )  { "#{fix_year}/#{fix_year+1}" }
  let(:fix_meeting )      { Meeting.find(18101) }

  subject { SwimmerPresenceDAO.new( fix_swimmer, fix_header_year ) }

  describe "[a well formed instance]" do
    it "responds to to_csv" do
      expect( subject ).to respond_to( :to_csv )
    end

    it_behaves_like( "(existance of a member array)", [
      :seasons,
      :meetings
    ])

    describe "#add_meeting" do
      it "returns a number" do
        expect( subject.add_meeting(SwimmerPresenceDAO::MeetingPresenceDAO.new(fix_meeting)) ).to be >= 0
      end

      it "increase #meeting count" do
        expect( subject.meetings.count ).to eq( 0 )
        expect( subject.add_meeting(SwimmerPresenceDAO::MeetingPresenceDAO.new(fix_meeting)) ).to eq( 1 )
        expect( subject.meetings.count ).to eq( 1 )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
end
