module MeetingsHelper

  # Getter for a unique string key viable for use as a cache key for fragments involving
  # the rending of any specified <tt>action_name</tt> of this controller.
  #
  def cache_key_for_meeting( action_name, meeting_id, max_mir_updated_at, team_id = nil, swimmer_id = nil )
    [
      action_name,
      meeting_id,
      max_mir_updated_at.to_i.to_s,
      team_id,
      swimmer_id
    ].compact.join('-')
  end
  #-- -------------------------------------------------------------------------
  #++
end
