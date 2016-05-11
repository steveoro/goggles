module TeamsHelper
  # Getter for a unique string key viable for use as a cache key for fragments involving
  # the rending of any specified <tt>action_name</tt> of this controller.
  #
  def cache_key_for_team( action_name, team_id, max_updated_at, current_swimmer_id = nil )
    [
      action_name,
      team_id,
      max_updated_at.to_i.to_s,
      current_swimmer_id,
      I18n.locale.to_s,
    ].compact.join('-')
  end
  #-- -------------------------------------------------------------------------
  #++
end
