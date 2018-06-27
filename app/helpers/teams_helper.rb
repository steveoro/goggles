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

  # Returns the HTML for team#printout_best_timings
  # action for the specified Team instance.
  #
  def link_to_best_timings_printout( team )
    return nil unless team.instance_of?( Team )
    link_to(
      team_printout_best_timings_path(id: team.id),
      class: 'btn btn-default',
      'data-toggle' => 'tooltip', 'title' => I18n.t('radiography.team.ttb_records_tooltip', team_name: team.get_full_name)
    ) do
      image_tag('page_white_acrobat.png') << I18n.t('radiography.team.ttb_records_pdf').html_safe
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the HTML for championship#printout_ranking_regional_csi
  # action for the specified Season instance.
  #
  def link_to_goggle_cup_rankings_printout( goggle_cup )
    return nil unless goggle_cup.instance_of?( GoggleCup )
    link_to(
      team_printout_goggle_cup_path(id: goggle_cup.id),
      class: 'btn btn-default'
    ) do
      image_tag('page_white_acrobat.png') << "&nbsp;#{ I18n.t('goggle_cup.ranking') }".html_safe
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
