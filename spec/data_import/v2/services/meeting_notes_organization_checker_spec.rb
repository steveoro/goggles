# encoding: utf-8
require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/services/meeting_notes_organization_checker'


shared_examples_for "[a successful #notes correction]" do
  it "returns an nonempty string" do
    expect( @result ).to be_an_instance_of( String )
    expect( @result.size ).to be > 1
  end
  it "returns a string containing the dates text" do
    expect( @result ).to be_an_instance_of( String )
    expect( @result ).to include( @meeting_dates )
  end
  it "returns a string containing the organization text" do
    expect( @result ).to be_an_instance_of( String )
    expect( @result ).to include( @organization.split(/['"]/).sort{ |str| str.size }.first )
  end
  it "returns a string containing the ID of the meeting" do
    expect( @result ).to be_an_instance_of( String )
    expect( @result ).to include( @fixture.id.to_s )
  end
end
#-- ---------------------------------------------------------------------------
#++


describe V2::MeetingNotesOrganizationChecker, type: :service do
  let(:organization)        { "#{FFaker::Address.city} Swimming Team" }
  let(:year)                { ((rand * 100) % 50).to_i + 1945 }
  let(:month)               { ((rand * 100) % 12).to_i + 1 }
  let(:day)                 { ((rand * 100) % 28).to_i + 1 }
  let(:meeting_dates_text)  { "%04d-%02d-%02d" % [year, month, day] }

  let(:meeting)             { create( :meeting, notes: "#{meeting_dates_text}\r\n#{organization}" ) }
  let(:di_meeting)          { create( :data_import_meeting, notes: "#{meeting_dates_text}\r\n#{organization}" ) }
  #-- -------------------------------------------------------------------------
  #++

  describe "self.check_and_fix()" do
    it "responds to self.check_and_fix()" do
      expect( V2::MeetingNotesOrganizationChecker ).to respond_to( :check_and_fix )
    end

    context "for a valid Meeting instance," do
      it "returns an empty string" do
        expect( V2::MeetingNotesOrganizationChecker.check_and_fix(meeting, meeting_dates_text, organization) ).to eq( '' )
      end
    end

    context "for a valid DataImportMeeting instance," do
      it "returns an empty string" do
        expect( V2::MeetingNotesOrganizationChecker.check_and_fix(di_meeting, meeting_dates_text, organization) ).to eq( '' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "for a Meeting w/ empty notes," do
      before(:all) do
        @fixture = create( :meeting )
        @fixture.notes = ''
        year           = ((rand * 100) % 50).to_i + 1945
        month          = ((rand * 100) % 12).to_i + 1
        day            = ((rand * 100) % 28).to_i + 1
        @meeting_dates = "%04d-%02d-%02d" % [year, month, day]
        @organization  = "#{FFaker::Address.city} Swimming Team"
        @result = V2::MeetingNotesOrganizationChecker.check_and_fix(@fixture, @meeting_dates, @organization)
# DEBUG
#        puts "\r\n- Checking @fixture: #{@fixture.inspect}"
#        puts "- @result: '#{@result}'"
      end
      it_behaves_like( "[a successful #notes correction]" )
    end

    context "for a Meeting w/ nil header_year," do
      before(:all) do
        @fixture = create( :meeting )
        @fixture.notes = nil
        year           = ((rand * 100) % 50).to_i + 1945
        month          = ((rand * 100) % 12).to_i + 1
        day            = ((rand * 100) % 28).to_i + 1
        @meeting_dates = "%04d-%02d-%02d" % [year, month, day]
        @organization  = "#{FFaker::Address.city} Swimming Team"
        @result = V2::MeetingNotesOrganizationChecker.check_and_fix(@fixture, @meeting_dates, @organization)
# DEBUG
#        puts "\r\n- Checking @fixture: #{@fixture.inspect}"
#        puts "- @result: '#{@result}'"
      end
      it_behaves_like( "[a successful #notes correction]" )
    end

    context "for a DataImportMeeting w/ empty notes," do
      before(:all) do
        @fixture = create( :data_import_meeting )
        @fixture.notes = ''
        year           = ((rand * 100) % 50).to_i + 1945
        month          = ((rand * 100) % 12).to_i + 1
        day            = ((rand * 100) % 28).to_i + 1
        @meeting_dates = "%04d-%02d-%02d" % [year, month, day]
        @organization  = "#{FFaker::Address.city} Swimming Team"
        @result = V2::MeetingNotesOrganizationChecker.check_and_fix(@fixture, @meeting_dates, @organization)
      end
      it_behaves_like( "[a successful #notes correction]" )
    end

    context "for a DataImportMeeting w/ nil notes," do
      before(:all) do
        @fixture = create( :data_import_meeting )
        @fixture.notes = nil
        year           = ((rand * 100) % 50).to_i + 1945
        month          = ((rand * 100) % 12).to_i + 1
        day            = ((rand * 100) % 28).to_i + 1
        @meeting_dates = "%04d-%02d-%02d" % [year, month, day]
        @organization  = "#{FFaker::Address.city} Swimming Team"
        @result = V2::MeetingNotesOrganizationChecker.check_and_fix(@fixture, @meeting_dates, @organization)
      end
      it_behaves_like( "[a successful #notes correction]" )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
