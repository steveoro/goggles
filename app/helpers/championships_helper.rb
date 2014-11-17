=begin

= MeetingsHelper

  - Goggles framework vers.:  4.00.562
  - author: Leega

=end
module ChampionshipsHelper

  # Getter for a unique string key viable for use as a cache key for fragments involving
  # the rending of any specified <tt>action_name</tt> of this controller.
  #
  def cache_key_for_championship_history( season_type_id, history_updated_at, team_id = nil )
    [
      'history',
      season_type_id,
      history_updated_at.to_i.to_s,
      I18n.locale.to_s,
      team_id,
    ].compact.join('-')
  end
  #-- -------------------------------------------------------------------------
  #++
end
