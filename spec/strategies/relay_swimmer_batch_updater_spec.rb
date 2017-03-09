# encoding: utf-8
require 'rails_helper'
require 'relay_swimmer_batch_updater'


describe RelaySwimmerBatchUpdater, type: :strategy do
  context "for a nil current user," do
    it "raises an ArgumentError" do
      expect{ RelaySwimmerBatchUpdater.new(nil) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for a logged-in generic current user (which is NOT a team manager)," do
    it "raises an ArgumentError" do
      expect{ RelaySwimmerBatchUpdater.new( FactoryGirl.build(:user) ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for a logged-in current user team-manager," do
    let(:team_manager_user) do
      TeamManager.includes(:user).joins(:user).limit(100)
        .sort{0.5-rand}.first
        .user
    end
    subject { RelaySwimmerBatchUpdater.new( team_manager_user ) }

    it "is a valid instance" do
      expect( subject ).to be_a( RelaySwimmerBatchUpdater )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
