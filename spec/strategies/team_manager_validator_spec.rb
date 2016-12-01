# encoding: utf-8
require 'rails_helper'
require 'team_manager_validator'


describe TeamManagerValidator, type: :strategy do
    let(:old_meeting)   { Meeting.find_by_id( [13101, 13102, 13103, 13105, 14101, 14102, 14103, 14104, 14105, 15101, 15102, 15103, 15104, 15105].sort{rand * 0.5}.first ) }
    let(:new_meeting)   { create(:meeting, header_date: Date.today + 10.days) }
    let(:team_manager)  do
      create(
        :team_manager,
        team_affiliation: create(:team_affiliation, season: new_meeting.season )
      )
    end


  describe "self.can_manage" do
    context "with a nil current user and a valid Meeting," do
      it "returns false" do
        expect(
          TeamManagerValidator.can_manage( nil, new_meeting )
        ).to be false
      end
    end
    context "with a valid user/team-manager but a nil Meeting," do
      it "returns false" do
        expect(
          TeamManagerValidator.can_manage( team_manager.user, nil )
        ).to be false
      end
    end
    context "with a valid user/team-manager that can manage an old meeting (with results already acquired)," do
      it "returns true" do
        expect(
          TeamManagerValidator.can_manage( User.find(2), old_meeting )
        ).to be true
      end
    end
    context "with a valid user/team-manager that can manage a new, future meeting with no results," do
      it "returns true" do
        expect(
          TeamManagerValidator.can_manage( team_manager.user, new_meeting )
        ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "self.is_manageable" do
    context "for a nil meeting," do
      it "returns false" do
        expect( TeamManagerValidator.is_manageable(nil) ).to be false
      end
    end
    context "for an old meeting with results already acquired," do
      it "returns false" do
        expect( TeamManagerValidator.is_manageable(old_meeting) ).to be false
      end
    end
    context "for a new, future meeting with no results," do
      it "returns true" do
        expect( TeamManagerValidator.is_manageable(new_meeting) ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
