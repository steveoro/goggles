# encoding: utf-8


=begin

= DataImporter

  - Goggles framework vers.:  4.00.89.20131110
  - author: Steve A.

  Container Class for individual results from the "Team Analysis"
  phase automatically launched during data-import whenever a
  problematic team name is not recognized. 

=== Main members:  
 - :analysis_log_text
    => string holding the result analysis text,

 - :sql_text
    => string holding the SQL executable text of the suggested action,

 - :chosen_team_id
    => possible team_id used as new alias:
       - when +nil+ => possibly a new team must be added;
       - when > 0   => possibly a new team alias must be added; 

 - :best_match_name
    => possible team association best match's name.
      (it can be +nil+ and it is defined only if both the name has been
      recognized and its row has the desidered season_id)
       - when +nil+ => possibly a new affiliation must be created;
       - when > 0   => possibly an existing affiliation should be used
                       (by creating an alias with :team_id); 

=end
class DataImportTeamAnalysisResult < ActiveRecord::Base

  belongs_to :data_import_session
  validates_associated  :data_import_session

  attr_accessible :analysis_log_text, :sql_text, :searched_team_name,
                  :desired_season_id, :chosen_team_id,
                  :team_match_name, :team_match_score,
                  :best_match_name, :best_match_score

  validates_length_of       :searched_team_name, :maximum => 60
  validates_length_of       :team_match_name, :maximum => 60
  validates_length_of       :best_match_name, :maximum => 60
  # ---------------------------------------------------------------------------

  # +true+ if one of the suggested action for this result
  # is the creation of a new "team alias" row.
  def can_insert_alias
    self.chosen_team_id.to_i > 0 
  end

  # +true+ if one of the suggested action for this result
  # is the creation of a brand new team row.
  def can_insert_team
    self.chosen_team_id.nil?
  end

  # +true+ if one of the suggested action for this result
  # is the creation of a new team affiliation row.
  def can_insert_affiliation
    self.best_match_name.nil?
  end
  # ---------------------------------------------------------------------------

  # Convert the current instance to a readable string
  def to_s
    "[DataImportTeamAnalysisResult: data_import_session_id=#{data_import_session_id}, '#{searched_team_name}', season_id=#{desired_season_id} -" +
    " team match: '#{team_match_name}' (ID:#{chosen_team_id}) score: #{team_match_score}," +
    " best match: '#{best_match_name}' score: #{team_match_score}]"
  end
  # ---------------------------------------------------------------------------
end
# -----------------------------------------------------------------------------
