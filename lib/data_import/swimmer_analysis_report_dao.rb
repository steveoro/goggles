# encoding: utf-8


=begin

= TeamAnalysisReportDAO

  - Goggles framework vers.:  4.00.669
  - author: Steve A.

 DAO class containing the fields composed during the "team name analysis" phase
 of the data-import procedure.

 === Members:

 - swimmer_match: highest-scoring match resulted from the swimmer scanning, a single
                  Hash with structure {:row, :score}.
                  +nil+ when no existing Swimmer was found in the results or there was
                  no traceable link to any of them.

 - swimmer_id: commodity id from the row above (may, in fact, not be the same, depending
               on the "best match"). +nil+ when no existing Swimmer was found in the results.

 - hiscoring_match: absolute highest scoring match (same Hash structure as above).

 - best_match: best match (as always, {:row, :score}), defined when special strategy
               conditions may apply.

 - text_log: resulting verbose text log of the analysis (never +nil+).

=end
class SwimmerAnalysisReportDAO

  # These must be initialized on creation:
  attr_reader :swimmer_match, :swimmer_id,
              :hiscoring_match, :best_match, :text_log
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  def initialize( swimmer_match, swimmer_id, hiscoring_match, best_match, text_log )
    @swimmer_match     = swimmer_match
    @swimmer_id        = swimmer_id
    @hiscoring_match   = hiscoring_match
    @best_match        = best_match
    @text_log          = text_log || ''
  end
  #-- -------------------------------------------------------------------------
  #++
end
