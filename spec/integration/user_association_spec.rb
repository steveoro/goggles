# encoding: utf-8
require 'spec_helper'


describe User, type: :integration do

  context "when associated to a swimmer" do
    it "befriends automatically all of his/hers current team members"

    # FIXME Should he/she be able to block this kind of friendship also?

    # (If this's the case, then we can't add a simple logic connection to
    #  the Friendship model including all the team members, but we'll have
    #  to generate a friendship row for each one of the athlete.
    #  This could raise the problem of new team members, added later on, not
    #  automatically befriended to the current user...)
  end

end