require 'active_support'

=begin
  
= MeetingAccountable

  - version:  4.00.281.20140515
  - author:   Steve A.

  Concern that adds methods to count meeting results.

=end
module MeetingAccountable
  extend ActiveSupport::Concern

  included do
  end


  # Counts the results for the specified meeting, invoking the filtering
  # scope block when it is given.
  #
  def count_results_for( meeting, &scope_block )
    if scope_block
      scope_block.call(
         meeting.meeting_individual_results
      ).count
    else
      meeting.meeting_individual_results.count
    end
  end
  # ---------------------------------------------------------------------------
end
