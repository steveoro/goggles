# encoding: utf-8


=begin

= TeamBuddyLinker

  - Goggles framework vers.:  4.00.531
  - author: Steve A.

  Generic strategy/service class dedicated to link a specified user to
  all of his/her team mates.

  In order to do so:

  - the @user must be a "goggler"; that is, a user with a swimmer associated
    to it;

  - the @user must be a "certified goggler" (that is, "certified" by any
    team mate to actually be the athlete that he/she claims to be);


=== Typical usage:

    TeamBuddyLinker.new( @user ).socialize_with_team_mates

=end
class TeamBuddyLinker

  # These attribute getters are mainly used in specs and nothing more.
  attr_reader :user, :associated_swimmer, :associated_teams
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new instance, storing the User instance for which this
  # strategy should be used.
  #
  def initialize( user )
    raise ArgumentError.new(
      "TeamBuddyLinker requires as a parameter a user instance associated to a swimmer!"
    ) unless user.instance_of?(User) && user.swimmer
    @user = user
    @associated_swimmer = user.swimmer
    @associated_teams   = user.swimmer.teams
  end
  #-- -------------------------------------------------------------------------
  #++


  # Binds the #user to all of his/her team mates, declaring them automatically
  # as "swimming buddies" with all sharing priviledges turned on.
  #
  def socialize_with_team_mates()
    team_mates = []                                 # Build up the team-mates list
    @associated_teams.each do |team|
      team.badges.each do |badge|
        team_mates << badge.swimmer unless badge.swimmer_id == @associated_swimmer.id
      end
    end
    # For each team mate which is already a registered goggler, create an automatic
    # "whole-share" invitation together with its approval:
    team_mates.each do |swimmer|
      if swimmer.associated_user
        @user.invite( swimmer.associated_user, true, true, true )
        swimmer.associated_user.approve( @user, true, true, true )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
