=begin

= MeetingsHelper

  - Goggles framework vers.:  6.109
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

  # Getter for a unique string key viable for use as a cache key for fragments involving
  # the rending of any specified <tt>action_name</tt> of this controller.
  #
  def cache_key_for_season_type_records( season_type_id, history_updated_at, swimmer_id = nil )
    [
      'season_type_records',
      season_type_id,
      history_updated_at.to_i.to_s,
      I18n.locale.to_s,
      swimmer_id,
    ].compact.join('-')
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the HTML for championship#printout_ranking_regional_csi
  # action for the specified Season instance.
  #
  def link_to_csi_team_rankings_printout( season )
    return nil unless season.instance_of?( Season )
    link_to(
      championships_printout_ranking_regional_csi_path(id: season.id),
      class: 'btn btn-default'
    ) do
      image_tag('page_white_acrobat.png') << "&nbsp;#{ I18n.t('championships.team_ranking') }".html_safe
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
