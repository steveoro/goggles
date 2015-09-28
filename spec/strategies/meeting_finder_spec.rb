# encoding: utf-8
require 'spec_helper'

require 'meeting_finder'


describe MeetingFinder, type: :strategy do

  it_behaves_like( "(the existance of a method)", [
    :search
  ] )
  #-- -------------------------------------------------------------------------
  #++

  context "when no search term is supplied," do
    subject { MeetingFinder.new }

    describe "#search_ids" do
      it "returns all Meeting rows" do
        expect( subject.search_ids.size ).to eq( Meeting.count )
      end
    end

    describe "#search" do
      it "returns all Meeting rows" do
        expect( subject.search.count ).to eq( Meeting.count )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when an existing search term is supplied," do
    subject { MeetingFinder.new("SAN MARINO") }

    describe "#search_ids" do
      it "returns some Meeting rows" do
        result_count = subject.search_ids.size
        expect( result_count ).to be > 0
        expect( result_count ).to be < Meeting.count
      end
    end

    describe "#search" do
      it "returns some Meeting rows" do
        result_count = subject.search.count
        expect( result_count ).to be > 0
        expect( result_count ).to be < Meeting.count
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when a non-existing search term is supplied," do
    subject { MeetingFinder.new("LARICIUMBALALLILLALLERO") }

    describe "#search_ids" do
      it "returns an empty list" do
        expect( subject.search_ids ).to respond_to(:each)
        expect( subject.search_ids.size ).to eq( 0 )
      end
    end

    describe "#search" do
      it "returns an empty list" do
        expect( subject.search ).to respond_to(:each)
        expect( subject.search.count ).to eq( 0 )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
