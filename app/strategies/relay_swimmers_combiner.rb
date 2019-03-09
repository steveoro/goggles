require 'wrappers/timing'

#
# == RelaySwimmersCombiner
#
# Pattern to find out available relay swimmer 
# and combine them into possible relays for a given meeting relay
# Available relay swimmers are those reserved for relays in the given meeting relay
# 
#
# @author   Leega
# @version  6.093
#
class RelaySwimmersCombiner

  # These must be initialized on creation:
  attr_reader :team, :meeting_event

  # These can be edited later on:
  #attr_accessor 

  # Initialization
  #
  def initialize( team, meeting_event )
    @team           = team
    @meeting_event = meeting_event
  end
  #-- --------------------------------------------------------------------------
  #++
end
