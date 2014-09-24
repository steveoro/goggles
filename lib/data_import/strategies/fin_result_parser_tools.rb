# encoding: utf-8

require 'fileutils'
require 'fuzzystringmatch'
require 'common/format'
require 'fuzzy_string_matcher'


=begin

= DataImporter

  - Goggles framework vers.:  4.00.517
  - author: Steve A.

== FinResultParserTools module

 Container dedicated to parsing tools for FIN Results files.

 FIN Results are swimming meeting result text files, written mostly in UTF-8 italian
 locale (since F.I.N. is the Italian Swimming Federation).

 All the RegExp used by this Parser class assume the file to be processed is compliant
 with the format used in these kind of files.

=end
module FinResultParserTools

  # Uses #FuzzyStringMatcher::collect_matches() to iterate until it finds at least
  # a single possible match, provided it has a minimum result bias score.
  #
  # All matches found and collected are described inside the returned analysis
  # text string.
  # Matches are collected in FIFO order, with each one selected having a better
  # score than the previous one. The resulting array is sorted on score.
  #
  # If no match is found or if a definite action is not possible, a separate
  # SQL-executable text is also returned.
  #
  # === Parameters:
  # - matching_string: the name of the Team that must be seeked
  #
  # - desired_season_id: the season ID for which the Team is supposed to be
  #   affiliated with if the affiliation row is missing.
  #   (This is actually used only to generate SQL statements in the separated log)
  #
  # - analysis_text_log: the string holding the resulting analysis log
  #
  # - sql_text_log: the string holding the executable SQL stament log, which
  #   contains any suggested action to be executed next. (Which should only
  #   be executed after human check.)
  #
  # - starting_bias_score: the starting bias score for the search
  #
  # - ending_bias_score: the ending limit bias score for the search
  #
  # === Returns:
  # A #DataImportTeamAnalysisResult instance.
  #
  def self.analyze_team_name_best_matches( matching_string, desired_season_id,
                                           analysis_text_log, sql_text_log,
                                           starting_bias_score = FuzzyStringMatcher::BIAS_SCORE_MAX,
                                           ending_bias_score   = FuzzyStringMatcher::BIAS_SCORE_MIN )
    all_teams = Team.all
    all_affiliations = TeamAffiliation.all
    matcher = FuzzyStringMatcher.new( all_teams, :name )
    bias_score_1, result_list_1 = matcher.seek_deep_match( matching_string, starting_bias_score, ending_bias_score )
    matcher = FuzzyStringMatcher.new( all_affiliations, :name )
    bias_score_2, result_list_2 = matcher.seek_deep_match( matching_string, starting_bias_score, ending_bias_score )
                                                    # Collect result lists and min. bias:
    result_list    = result_list_1 + result_list_2
    min_bias_score = bias_score_1 < bias_score_2 ? bias_score_1 : bias_score_2
                                                    # Prepare report:
    analysis_text_log << "\r\n-------------------------------------------------------------------------------------------------------------\r\n"
    analysis_text_log << "                    [[[ '#{matching_string}' ]]]  -- season_id: #{desired_season_id}, best-match search:\r\n\r\n"
    result_hash3 = self.prepare_analysis_report(
      matching_string,
      desired_season_id,
      analysis_text_log,
      result_list,
      min_bias_score
    )

    analysis_text_log = result_hash3[:analysis]
    team_match        = result_hash3[:team_match]        # (Not used yet)
    affiliation_match = result_hash3[:affiliation_match] # (Not used yet)
    hiscoring_match   = result_hash3[:hiscoring_match]   # (Not used yet)
    team_id           = result_hash3[:team_id]
    best_match        = result_hash3[:best_match]

    if team_id.to_i > 0                             # Let's be sure that there aren't really no affiliations with these parameters:
      team_affiliation = TeamAffiliation.where(
        team_id: team_id,
        season_id: desired_season_id
      ).first
      if team_affiliation
        best_match = team_affiliation
        affiliation_match = team_affiliation
      end
    end

    # TODO This is not needed unless we want to store the uniq'ed list of results somewhere: (ALIAS table?)
                                                    # Re-sort the overall result list, clearing duplicates:
#    unique_name_list = result_list.collect{|e| e[:row].name }.uniq
#    overall_unique_list = unique_name_list.collect { |uniq_name| result_list.detect{|e| e[:row].name == uniq_name} }
#    overall_unique_list = overall_unique_list.sort!{ |x,y| x[:score] <=> y[:score] }

    if ( result_list.size < 1 )
      analysis_text_log << "   => NOT FOUND.\r\n"
    elsif ( result_list.size == 1 )
      analysis_text_log << "   --- SINGLE MATCH! ---\r\n"
    elsif ( result_list.size > 1 )
      analysis_text_log << "   --- MULTIPLE CHOICES ---\r\n"
    end
    # [Steve] OK, we could have a match. But we still need to solve how to import all
    # the data linked to a Team which seems to be existing, but under a slightly
    # different affiliation name.
    #
    # The solution is to create aliases to team_id(s) with the current searched name,
    # storing them in a dedicated table that gets checked during data-import on phase-1.
    #
    # The data_import_team_aliases table does just that, and is checked only during
    # the first phase of the data-import procedure.

    matching_string.gsub!("'", "''")              # Escape single quotes in names in case we have to write SQL statements:

    team_analysis_result = DataImportTeamAnalysisResult.new({
      analysis_log_text:  analysis_text_log,
      searched_team_name: matching_string,
      desired_season_id:  desired_season_id,
      chosen_team_id:     team_id,
      team_match_name:    ( team_match && team_match[:row] ? team_match[:row].name : nil ),
      team_match_score:   ( team_match ? team_match[:score] : nil ),
      best_match_name:    ( best_match && best_match[:row] ? best_match[:row].team_name : nil ),
      best_match_score:   ( best_match ? best_match[:score] : nil )
    })
                                                    # Store suggested SQL action into the external log:
    sql_text_log << team_analysis_result.rebuild_sql_text()
    team_analysis_result
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns a formatted string containing the result row main values
  #
  def self.format_result_row( result_row, result_score )
    output = "(#{sprintf("%-16s", result_row.class.name)})"
    output << " '#{result_row.name}', " if result_row.respond_to?(:name)
    output << "score #{sprintf("%1.4f", result_score)}"
    output << ", ID: #{sprintf("%4s", result_row.id)}" if (!result_row.nil?) && result_row.respond_to?(:id)
    output << ", season_id: #{sprintf("%4s", result_row.season_id)}" if result_row.respond_to?(:season_id)
    output << "\t=> Team ID: #{sprintf("%4s", result_row.team_id)}"  if result_row.respond_to?(:team_id)
    output << " >> 100% ! <<" if result_score >= 0.9999
    output
  end


  # Prepares the report of best-matches text given the result hash.
  #
  # === Returns:
  # An hash with the structure:
  #
  #    {
  #      analysis: analysis output text log.
  #
  #      team_match: match {:row, :score} from teams, for the highest-scoring
  #                            match from teams.
  #                            +nil+ when no existing team was found in the results or linked
  #                            to them.
  #
  #      team_id: commodity id from the row above or from affiliation's team
  #                            (may, in fact, not be the same, depending on the "best match").
  #                            +nil+ when no existing team was found in the results.
  #
  #      affiliation_match: match {:row, :score} from affiliations, will store
  #                            the highest-scoring match, indipendently from season_id.
  #
  #      hiscoring_match: absolute highest scoring match, either from teams or affilations
  #                            (indipendently from season_id).
  #
  #      best_match: best match {:row, :score} from affiliations,
  #                            defined only if season_id is equal to the desired value.
  #    }
  #
  def self.prepare_analysis_report( matching_string, desired_season_id, analysis_text_log,
                                    result_list, min_bias_score )
    affiliation_match = nil
    team_match = nil
    team_id = nil
    best_match = nil
    hiscoring_match = nil                           # Overall hi-scoring result (either Team or TeamAff.)

    result_list = result_list.sort!{ |x,y| x[ :score ] <=> y[ :score ] }
    result_list.each { |result|
      analysis_text_log << "   - " << self.format_result_row( result[:row], result[:score] )

      if result[:row].instance_of?( Team )
        # We will store only the highest matches per class, while looping on the results:
        team_match = result if team_match.nil? || (team_match && team_match[:score] < result[:score])

      elsif result[:row].instance_of?( TeamAffiliation )
        if ( desired_season_id == result[:row].season_id )
          analysis_text_log << " (SEASON OK)"
          best_match = result
          # [Steve] Only affiliations with the desired_season_id are the best matches,
          # but we will update also the pointer to the affiliation & highest scoring match
          # if the best match has at least the same result score.
          affiliation_match = result if affiliation_match.nil? || ( affiliation_match && affiliation_match[:score] <= result[:score] )
          hiscoring_match   = result if hiscoring_match.nil?   || ( hiscoring_match   && hiscoring_match[:score] <= result[:score] )
        end
        # We will store only the highest matches per class, while looping on the results:
        affiliation_match = result if affiliation_match.nil? || ( affiliation_match && affiliation_match[:score] < result[:score] )
      end
      hiscoring_match = result if hiscoring_match.nil? || ( hiscoring_match && hiscoring_match[:score] < result[:score] )
      analysis_text_log << "\r\n"
    }
                                                    # Couldn't find a Team in result, but found an affiliation?
    if (best_match)                                 # (That is: look-alike affiliation name found, but linked to a too-different team name?)
      team_id = best_match[:row].team_id            # Always override the chosen team_id with the best match
      team_match = { score: best_match[:score], row: best_match[:row].team } if team_match.nil?
    elsif ( team_match.nil? && best_match.nil? && affiliation_match )
      team_match = { score: affiliation_match[:score], row: affiliation_match[:row].team }
    end
                                                    # Result team_id not set yet?:
    team_id = team_match[:row].id if team_id.nil? && team_match && team_match[:row]

    if (result_list.size > 0)
      analysis_text_log << "\r\n   ==> #{result_list.size} results tot., min. bias: #{sprintf("%1.4f", min_bias_score)}\r\n"
    else
      analysis_text_log << "   (no results)\r\n"
    end

    if team_match
      analysis_text_log << "   Team   BEST...: " << self.format_result_row( team_match[:row], team_match[:score] )
      analysis_text_log << "\r\n"
    end
    if affiliation_match
      analysis_text_log << "   Affil. BEST...: " << self.format_result_row( affiliation_match[:row], affiliation_match[:score] )
      analysis_text_log << "\r\n"
    end
    if hiscoring_match
      analysis_text_log << "   Hi-scoring....: " << self.format_result_row( hiscoring_match[:row], hiscoring_match[:score] )
      analysis_text_log << "\r\n"
    end
    if best_match
      analysis_text_log << "   - Preferred - : " << self.format_result_row( best_match[:row], best_match[:score] )
      analysis_text_log << "\r\n"
    end
    analysis_text_log << "   Chosen team_id = #{team_id}, season_id = #{desired_season_id}\r\n" if team_id
    {
      analysis:           analysis_text_log,
      team_id:            team_id,
      team_match:         team_match,
      affiliation_match:  affiliation_match,
      hiscoring_match:    hiscoring_match,
      best_match:         best_match
    }
  end
  #-- -------------------------------------------------------------------------
  #++
end
