# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/services/team_merger'


describe TeamMerger, type: :service do
  let(:team)            { create(:team) }


  context "for a valid instance," do
    subject { TeamMerger.new( team, team ) }

    it "responds to #process_text_log" do
      expect( subject ).to respond_to( :process_text_log )
    end
    it "responds to #sql_diff_text_log" do
      expect( subject ).to respond_to( :sql_diff_text_log )
    end
    it "responds to #process" do
      expect( subject ).to respond_to( :process )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#process" do
    it "raises an ArgumentError for an invalid source/slave Team parameter" do
      expect{ TeamMerger.new(nil, team).process }.to raise_error( ArgumentError )
    end
    it "raises an ArgumentError for an invalid source/slave Team parameter" do
      expect{ TeamMerger.new(team, nil).process }.to raise_error( ArgumentError )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "returns true for a process that does not yield errors" do
      expect( TeamMerger.new(team, create(:team)).process ).to be true
    end
    it "returns true for a process that does nothing (src==dest)" do
      expect( TeamMerger.new(team, team).process ).to be true
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
