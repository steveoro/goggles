# encoding: utf-8


=begin

= TeamAnalysisReportDAO

  - Goggles framework vers.:  4.00.521
  - author: Steve A.

 DAO class containing the fields composed during the "team name analysis" phase
 of the data-import procedure.

 === Members:

 - team_match: highest-scoring match resulted from the teams scanning, a single
               Hash with structure {:row, :score}.
               +nil+ when no existing Team was found in the results or there was
               no traceable link to any of them.

 - team_id: commodity id from the row above or from affiliation's Team
            (may, in fact, not be the same, depending on the "best match").
            +nil+ when no existing Team was found in the results.

 - affiliation_match: match (same as above, an Hash of {:row, :score}) from the
                      Team affiliations; will store the highest-scoring match,
                      indipendently from season_id.

 - hiscoring_match: absolute highest scoring match (same Hash structure as above),
                    either from teams or affilations (indipendently from season_id).

 - best_match: best match (as always, {:row, :score}) from affiliations,
               defined only if season_id is equal to the desired value.

 - text_log: resulting verbose text log of the analysis (never +nil+).

=end
class TeamAnalysisReportDAO

  # These must be initialized on creation:
  attr_reader :team_match, :team_id, :affiliation_match,
              :hiscoring_match, :best_match, :text_log
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  def initialize( team_match, team_id, affiliation_match, hiscoring_match, best_match, text_log )
    @team_match        = team_match
    @team_id           = team_id
    @affiliation_match = affiliation_match
    @hiscoring_match   = hiscoring_match
    @best_match        = best_match
    @text_log          = text_log || ''
  end
  #-- -------------------------------------------------------------------------
  #++
end
