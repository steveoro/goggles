=begin

= MeetingDecorator

  - version:  4.00.793
  - author:   Steve A.

  Decorator for the MeetingIndividualResult model.
  Contains all presentation-logic centered methods.

=end
class MeetingIndividualResultDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all


  # Returns either the rank value or a short disqualification
  # description for the current object instance.
  # (No more than 3 chars, since it must be shown in place of the ranking.)
  #
  def get_rank_description
    # TODO Do we need to localize these very short 3-char strings?
    if ( object.disqualification_code_type_id == DisqualificationCodeType::DSQ_RETIRED_ID )
      I18n.t('disqualification_code_types.generic_ret_code')
    elsif ( object.disqualification_code_type_id == DisqualificationCodeType::DSQ_FALSE_START_ID )
      I18n.t('disqualification_code_types.generic_dsq_code')
    elsif object.is_disqualified  # (default case, with any other code set)
      I18n.t('disqualification_code_types.generic_dsq_code')
    else
      object.rank
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the image tag corresponding to the medal simbol for any valid ranking
  # position (1..3) or an empty string.
  #
  def show_any_rank_medal()
    if ( object.is_valid_for_ranking && object.rank > 0 && object.rank < 4 )
      case object.rank
      when 1
        h.image_tag( "medal_gold_3.png" )
      when 2
        h.image_tag( "medal_silver_3.png" )
      when 3
        h.image_tag( "medal_bronze_3.png" )
      end
    else
      ''
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
