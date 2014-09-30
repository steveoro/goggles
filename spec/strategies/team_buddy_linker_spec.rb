# encoding: utf-8
require 'spec_helper'

require 'team_buddy_linker'


describe TeamBuddyLinker, type: :strategy do
  before :each do
    team     = create( :team )
    badges   = create_list( :badge, 3, team: team )
    swimmers = badges.map{ |badge| badge.swimmer }
    @user, @user2, @user3 = create_list( :user, 3 )
    @user.set_associated_swimmer( swimmers[0] )
    @user2.set_associated_swimmer( swimmers[1] )
    @user3.set_associated_swimmer( swimmers[2] )
  end

  subject { TeamBuddyLinker.new( @user ) }

  it_behaves_like( "(the existance of a method)", [
    :user, :associated_swimmer, :associated_teams,
    :socialize_with_team_mates
  ] )
  #-- -------------------------------------------------------------------------
  #++

  describe "#user" do
    it "returns the user specified for this strategy" do
      expect( subject.user ).to eq( @user )
    end
  end

  describe "#associated_swimmer" do
    it "returns the associated swimmer of the user" do
      expect( subject.associated_swimmer ).to eq( @user.swimmer )
    end
  end

  describe "#associated_teams" do
    it "returns the teams of the user" do
      expect( subject.associated_teams ).to eq( @user.swimmer.teams )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#socialize_with_team_mates" do
    it "adds all the team mates as 'total sharing friends' to the user" do
      expect{ subject.socialize_with_team_mates }.to change{
        @user.friends.size
      }
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end