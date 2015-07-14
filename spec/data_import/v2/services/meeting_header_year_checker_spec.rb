# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/services/meeting_header_year_checker'


shared_examples_for "[a successful #header_year correction]" do
  it "returns an nonempty string" do
    expect( @result ).to be_an_instance_of( String )
    expect( @result.size ).to be > 1
  end
  it "returns a string containing the correct header_year" do
    expect( @result ).to be_an_instance_of( String )
    expect( @result ).to include( @fixture.season.build_header_year )
  end
  it "returns a string containing the ID of the meeting" do
    expect( @result ).to be_an_instance_of( String )
    expect( @result ).to include( @fixture.id.to_s )
  end
end
#-- ---------------------------------------------------------------------------
#++


describe V2::MeetingHeaderYearChecker, type: :service do
  let(:meeting)    { create( :meeting ) }
  let(:di_meeting) { create( :data_import_meeting ) }
  #-- -------------------------------------------------------------------------
  #++

  describe "self.check_and_fix()" do
    it "responds to self.check_and_fix()" do
      expect( V2::MeetingHeaderYearChecker ).to respond_to( :check_and_fix )
    end

    context "for a valid Meeting instance," do
      it "returns an empty string" do
        expect( V2::MeetingHeaderYearChecker.check_and_fix(meeting) ).to eq( '' )
      end
    end

    context "for a valid DataImportMeeting instance," do
      it "returns an empty string" do
        expect( V2::MeetingHeaderYearChecker.check_and_fix(di_meeting) ).to eq( '' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "for a Meeting w/ empty header_year," do
      before(:all) do
        @fixture = create( :meeting )
        @fixture.header_year = ''
        @result = V2::MeetingHeaderYearChecker.check_and_fix(@fixture)
# DEBUG
#        puts "\r\n- Checking @fixture: #{@fixture.inspect}"
#        puts "- @result: '#{@result}'"
      end
      it_behaves_like( "[a successful #header_year correction]" )
    end

    context "for a Meeting w/ nil header_year," do
      before(:all) do
        @fixture = create( :meeting )
        @fixture.header_year = nil
        @result = V2::MeetingHeaderYearChecker.check_and_fix(@fixture)
# DEBUG
#        puts "\r\n- Checking @fixture: #{@fixture.inspect}"
#        puts "- @result: '#{@result}'"
      end
      it_behaves_like( "[a successful #header_year correction]" )
    end

    context "for a DataImportMeeting w/ empty header_year," do
      before(:all) do
        @fixture = create( :data_import_meeting )
        @fixture.header_year = ''
        @result = V2::MeetingHeaderYearChecker.check_and_fix(@fixture)
      end
      it_behaves_like( "[a successful #header_year correction]" )
    end

    context "for a DataImportMeeting w/ nil header_year," do
      before(:all) do
        @fixture = create( :data_import_meeting )
        @fixture.header_year = nil
        @result = V2::MeetingHeaderYearChecker.check_and_fix(@fixture)
      end
      it_behaves_like( "[a successful #header_year correction]" )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
