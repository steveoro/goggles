class MeetingIndividualResult < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_program
  belongs_to :entry_time_type
  validates_associated :meeting_program

  has_one  :meeting_event,    :through => :meeting_program
  has_one  :meeting_session,  :through => :meeting_program
  has_one  :meeting,          :through => :meeting_program
  has_one  :season,           :through => :meeting_program

  has_one  :pool_type,      :through => :meeting_program
  has_one  :season_type,    :through => :meeting_program
  has_one  :event_type,     :through => :meeting_program
  has_one  :category_type,  :through => :meeting_program
  has_one  :gender_type,    :through => :meeting_program
                                                    # These reference fields may be filled-in later (thus not validated upon creation):
  belongs_to :swimmer
  belongs_to :team
  belongs_to :team_affiliation
  belongs_to :badge
  belongs_to :disqualification_code_type

  validates_associated :swimmer
  validates_associated :team
  validates_associated :team_affiliation
  validates_associated :badge
  validates_associated :disqualification_code_type

  validates_presence_of     :rank
  validates_length_of       :rank, :within => 1..4, :allow_nil => false
  validates_numericality_of :rank

  validates_presence_of     :standard_points
  validates_numericality_of :standard_points
  validates_presence_of     :meeting_individual_points
  validates_numericality_of :meeting_individual_points
  validates_presence_of     :goggle_cup_points
  validates_numericality_of :goggle_cup_points
  validates_presence_of     :team_points
  validates_numericality_of :team_points

  validates_presence_of     :reaction_time
  validates_numericality_of :reaction_time
  validates_presence_of     :minutes
  validates_length_of       :minutes, :within => 1..3, :allow_nil => false
  validates_numericality_of :minutes
  validates_presence_of     :seconds
  validates_length_of       :seconds, :within => 1..2, :allow_nil => false
  validates_numericality_of :seconds
  validates_presence_of     :hundreds
  validates_length_of       :hundreds, :within => 1..2, :allow_nil => false
  validates_numericality_of :hundreds


  scope :is_valid, -> { where(is_out_of_race: false, is_disqualified: false) }

  scope :sort_meeting_individual_result_by_user,          lambda { |dir| order("users.name #{dir.to_s}, meeting_programs.meeting_session_id #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_meeting,       lambda { |dir| order("meeting_programs.meeting_session_id #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_swimmer,       lambda { |dir| order("swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}, meeting_individual_results.rank #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_team,          lambda { |dir| order("teams.name #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_badge,         lambda { |dir| order("badges.number #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Returns just the formatted timing information
  def get_timing
    "#{minutes}'" + sprintf("%02.0f", seconds) + "\"" + sprintf("%02.0f", hundreds)
  end

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_scheduled_date} #{get_event_type}: #{rank}) #{get_athlete_name}, #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_meeting_program_verbose_name}: #{rank}) #{get_athlete_name} (#{get_year_of_birth}), #{get_timing}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Check if this result is valid for the ranking system.
  def is_valid_for_ranking
    (!self.is_out_of_race) && (!self.is_disqualified)
  end

  # Retrieves the associated Swimmer full name
  def get_athlete_name
    self.swimmer ? self.swimmer.get_full_name() : '?'
  end

  # Retrieves the associated Swimmer's year_of_birth
  def get_year_of_birth
    self.swimmer ? self.swimmer.year_of_birth : '?'
  end

  # Retrieves the associated Team full name
  def get_team_name
    self.team ? self.team.get_full_name() : '?'
  end

  # Retrieves the localized Event Type code (short)
  def get_event_type
    self.meeting_program ? self.meeting_program.event_type.i18n_short : '?'
  end

  # Retrieves the localized Event Type code (full description)
  def get_event_type_description
    self.meeting_program ? self.meeting_program.event_type.i18n_description : '?'
  end

  # Getter for short display name of Category + Gender.
  def get_category_and_gender_short
    self.meeting_program ? self.meeting_program.get_category_and_gender_short : '?'
  end

  # Retrieves the scheduled_date of this result
  def get_scheduled_date                            # The following ActiveRecord chain is granted in existence by validation assertions: (even the first check could be avoided)
    self.meeting_program ? self.meeting_program.meeting_session.scheduled_date : '?'
  end

  # Retrieves the Meeting Program short name
  def get_meeting_program_name
    self.meeting_program ? self.meeting_program.get_full_name() : '?'
  end

  # Retrieves the Meeting Program verbose name
  def get_meeting_program_verbose_name
    self.meeting_program ? self.meeting_program.get_verbose_name() : '?'
  end
  # ----------------------------------------------------------------------------


  # Counts the query results for a specified <tt>meeting_id</tt>, <tt>team_id</tt> and
  # minimum result score.
  #
  def self.count_team_results_for( meeting_id, team_id, min_meeting_score )
    self.includes(:meeting).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ? AND ' +
        'meeting_individual_results.meeting_individual_points >= ?',
        meeting_id, team_id, min_meeting_score ]
    ).count
  end


  # Counts the query results for a specified <tt>meeting_id</tt>, <tt>team_id</tt> and <tt>rank</tt>.
  #
  def self.count_team_ranks_for( meeting_id, team_id, rank )
    self.includes(:meeting).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ? AND ' +
        'meeting_individual_results.rank = ? AND ' +
        'meeting_individual_results.meeting_individual_points > 0',
        meeting_id, team_id, rank ]
    ).count
  end
  # ----------------------------------------------------------------------------


  # Returns an array of "Meeting records" scoped from MeetingIndividualResult (an array,
  # in case there is more than one row with the same exact timing result), being selected by the
  # speficied parameters.
  #
  # If <tt>category_type_id_or_code</tt> is a Fixnum is assumed to be an ID; if it's a String,
  # it's assumed to be the +code+.
  #
  # Obviously, if the value used for this parameter is a Fixnum and the ID is used for the query,
  # this will allow a more precise fine-tuning of the results, since both the season and the code
  # identify a single, unique category_types.id.
  #
  # When meeting_id is supplied only the best timing records for the specified meeting
  # are searched. Otherwise the search is extended to all the individual results specified
  # with the remaining parameters. 
  #
  def self.get_records_for( event_type_code, category_type_id_or_code, gender_type_id, pool_type_id,
                            meeting_id = nil, limit_for_same_ranking_results = 3 )
#FIXME DEBUG THIS:

    if meeting_id
      where_cond = [
        "(meetings.id = ?) AND (event_types.code = ?) AND " +
        "(#{ category_type_id_or_code.instance_of?(String) ? 'category_types.code' : 'category_types.id' } = ?) AND " +
        "(gender_types.id = ?) AND (pool_types.id = ?)",
        meeting_id, event_type_code, category_type_id_or_code, gender_type_id, pool_type_id
      ]
    else
      where_cond = [
        "(event_types.code = ?) AND " +
        "(#{ category_type_id_or_code.instance_of?(String) ? 'category_types.code' : 'category_types.id' } = ?) AND " +
        "(gender_types.id = ?) AND (pool_types.id = ?)",
        event_type_code, category_type_id_or_code, gender_type_id, pool_type_id
      ]
    end

    first_recs = self.includes( :meeting, :event_type, :category_type, :gender_type, :pool_type ).joins(
      :meeting, :event_type, :category_type, :gender_type, :pool_type 
    ).is_valid.select(
      'meetings.id, meeting_program_id, swimmer_id, team_id, minutes, seconds, hundreds, event_types.code, category_types.code, gender_types.code, pool_types.code'
    ).where( where_cond ).order(
      :minutes, :seconds, :hundreds
    ).limit( limit_for_same_ranking_results )

    if first_recs.size > 0                          # Compute the first timing result value
      first_timing_value = first_recs.first.minutes*6000 + first_recs.first.seconds*100 + first_recs.first.hundreds
                                                    # Remove from the result all other rows that have a greater timing result (keep same ranking results)
      first_recs.reject!{ |row| first_timing_value < (row.minutes*6000 + row.seconds*100 + row.hundreds) }
    end
    first_recs
  end
end
