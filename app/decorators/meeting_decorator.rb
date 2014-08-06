=begin

= MeetingDecorator

  - version:  4.00.419
  - author:   Steve A.

  Decorator for the Meeting model.
  Contains all presentation-logic centered methods.

=end
class MeetingDecorator < Draper::Decorator
  delegate_all


  # Returns a specific string to be used as a CSS class for this
  # meeting, according to the associated season type.
  #
  # Returns an empty string when not defined.
  #
  def get_css_class_for_season_type
    if object.season_type && object.season_type.code =~ /CSI/i
      'goggles-meeting-csi'
    elsif object.season_type && object.season_type.code =~ /FIN/i
      'goggles-meeting-fin'
    else
      ''
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns an image_tag for this meeting, according to the associated season type.
  # Returns an empty string when not defined.
  #
  def get_logo_for_season_type
    if object.season_type && object.season_type.code =~ /CSI/i
      h.image_tag( 'logo_csi.png', size: '20x16' )
    elsif object.season_type && object.season_type.code =~ /FIN/i
      h.image_tag( 'logo_fin.png', size: '40x16' )
    elsif object.season
      object.season.get_season_type
    else
      ''
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
