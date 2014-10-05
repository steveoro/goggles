# encoding: utf-8
require 'spec_helper'


describe User, type: :integration do

  context "when a confirm is received for the association to a swimmer, by a team-mate that is a goggler" do
    it "befriends automatically all of his/hers current team members"

    # TODO Use the dedicated strategy TeamBuddyLinker class:
    # => TeamBuddyLinker.new( @user ).socialize_with_team_mates
  end

end