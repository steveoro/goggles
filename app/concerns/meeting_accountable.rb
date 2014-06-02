require 'active_support'

=begin
  
= MeetingAccountable

  - version:  4.00.281.20140515
  - author:   Steve A.

  Concern that adds methods to count meeting results and entries.

=end
module MeetingAccountable
  extend ActiveSupport::Concern

  included do
  end
  #-- -------------------------------------------------------------------------
  #++


  # Counts the results for the specified meeting, invoking the filtering
  # scope block when it is given.
  #
  def count_results_for( meeting, &scope_block )
    return 0 unless meeting
    if scope_block
      scope_block.call( meeting.meeting_individual_results ).count
    else
      meeting.meeting_individual_results ? meeting.meeting_individual_results.count : 0
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Counts the entries for the specified meeting, invoking the filtering
  # scope block when it is given.
  #
  def count_entries_for( meeting, &scope_block )
    return 0 unless meeting
    if scope_block
      scope_block.call( meeting.meeting_entries ).count
    else
      meeting.meeting_entries ? meeting.meeting_entries.count : 0
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
