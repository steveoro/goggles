require 'wrappers/timing'
require 'timing_gettable'


#
# == MeetingIndividualResult
#
# Model class
#
# @author   Steve A., Leega
# @version  4.00.797
#
class MeetingIndividualResult < ActiveRecord::Base
  include SwimmerRelatable
  include TimingGettable
  include TimingValidatable

  include EventTypeRelatable

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!

  belongs_to :meeting_program
  validates_associated :meeting_program

  has_one  :meeting_event,    through: :meeting_program
  has_one  :meeting_session,  through: :meeting_program
  has_one  :meeting,          through: :meeting_program
  has_one  :season,           through: :meeting_program

  has_one  :pool_type,        through: :meeting_program
  has_one  :season_type,      through: :meeting_program
  has_one  :event_type,       through: :meeting_program
  has_one  :category_type,    through: :meeting_program
  has_one  :gender_type,      through: :meeting_program
  has_one  :federation_type,  through: :season_type

  has_many :passages
                                                    # These reference fields may be filled-in later (thus not validated upon creation):
  belongs_to :team
  belongs_to :team_affiliation
  belongs_to :badge
  belongs_to :disqualification_code_type

  validates_associated :team
  validates_associated :team_affiliation
  validates_associated :badge
  validates_associated :disqualification_code_type

  validates_presence_of     :rank
  validates_length_of       :rank, within: 1..4, allow_nil: false
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


  attr_accessible :rank, :is_play_off, :is_out_of_race, :is_disqualified, :standard_points,
                  :meeting_individual_points, :minutes, :seconds, :hundreds,
                  :meeting_program_id, :swimmer_id, :team_id, :badge_id, :user_id,
                  :disqualification_code_type_id, :goggle_cup_points, :reaction_time,
                  :team_points, :team_affiliation_id


  delegate :short_name, to: :category_type, prefix: true
  delegate :code,       to: :event_type, prefix: true

  scope :is_valid,                    ->              { where(is_out_of_race: false, is_disqualified: false) }
  scope :is_not_disqualified,         ->              { where(is_disqualified: false) }

  scope :is_male,                     ->              { joins(:swimmer).where(["swimmers.gender_type_id = ?", GenderType::MALE_ID]) }
  scope :is_female,                   ->              { joins(:swimmer).where(["swimmers.gender_type_id = ?", GenderType::FEMALE_ID]) }

  scope :has_rank,                    ->(rank_filter) { where(rank: rank_filter) }
  scope :has_points,                  ->(score_sym = 'standard_points') { where("#{score_sym.to_s} > 0") }
  scope :has_time,                    ->              { where("((minutes * 6000) + (seconds * 100) + hundreds > 0)") }

  scope :sort_by_user,                ->(dir = 'ASC') { order("users.name #{dir.to_s}, meeting_programs.meeting_session_id #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_by_meeting,             ->(dir)         { order("meeting_programs.meeting_session_id #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_by_swimmer,             ->(dir = 'ASC') { joins(:swimmer).order("swimmers.complete_name #{dir.to_s}, meeting_individual_results.rank #{dir.to_s}") }
  scope :sort_by_team,                ->(dir = 'ASC') { joins(:team, :swimmer).order("teams.name #{dir.to_s}, swimmers.complete_name #{dir.to_s}") }
  scope :sort_by_badge,               ->(dir = 'ASC') { joins(:badge).order("badges.number #{dir.to_s}") }
  scope :sort_by_timing,              ->(dir = 'ASC') { order("is_disqualified, (hundreds+(seconds*100)+(minutes*6000)) #{dir.to_s}") }
  scope :sort_by_rank,                ->(dir = 'ASC') { order("is_disqualified, rank #{dir.to_s}") }
  scope :sort_by_date,                ->(dir = 'ASC') { includes(:meeting_session).order("meeting_sessions.scheduled_date #{dir.to_s}") }
  scope :sort_by_goggle_cup,          ->(dir = 'DESC') { order("goggle_cup_points #{dir.to_s}") }
  scope :sort_by_pool_and_event,      ->(dir = 'ASC') { joins(:event_type, :pool_type).order("pool_types.length_in_meters #{dir.to_s}, event_types.style_order #{dir.to_s}") }
  scope :sort_by_gender_and_category, ->(dir = 'ASC') { joins(:gender_type, :category_type).order("gender_types.code #{dir.to_s}, category_types.code #{dir.to_s}") }
  scope :sort_by_updated_at,          ->(dir = 'ASC') { order("updated_at #{dir.to_s}") }
  scope :sort_by_event_order,         ->(dir = 'ASC') { includes(:meeting_event).order("meeting_events.event_order #{dir.to_s}") }

  scope :for_event_by_pool_type,      ->(event_by_pool_type)   { joins(:event_type, :pool_type).where(["event_types.id = ? AND pool_types.id = ?", event_by_pool_type.event_type_id, event_by_pool_type.pool_type_id]) }
  scope :for_pool_type,               ->(pool_type)            { joins(:pool_type).where(['pool_types.id = ?', pool_type.id]) }
  scope :for_season_type,             ->(season_type)          { joins(:season_type).where(['season_types.id = ?', season_type.id]) }
  scope :for_team,                    ->(team)                 { where(team_id: team.id) }
  scope :for_category_type,           ->(category_type)        { joins(:category_type).where(['category_types.id = ?', category_type.id]) }
  scope :for_gender_type,             ->(gender_type)          { joins(:gender_type).where(['gender_types.id = ?', gender_type.id]) }
  scope :for_event_type,              ->(event_type)           { joins(:event_type).where(["event_types.id = ?", event_type.id]) }
  scope :for_swimmer,                 ->(swimmer)              { where(swimmer_id: swimmer.id) }
  scope :for_category_code,           ->(category_code)        { joins(:category_type).where(['category_types.code = ?', category_code]) }
  scope :for_date_range,              ->(date_begin, date_end) { joins(:meeting).where(['meetings.header_date between ? and ?', date_begin, date_end]) }
  scope :for_season,                  ->(season)               { joins(:season).where(['seasons.id = ?', season.id]) }
  scope :for_closed_seasons,          ->                       { joins(:season).where("seasons.end_date is not null and seasons.end_date < curdate()") }
  
  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_scheduled_date} #{get_event_type}: #{rank}) #{get_swimmer_name}, #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_meeting_program_verbose_name}: #{rank}) #{get_swimmer_name} (#{get_year_of_birth}), #{get_timing}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Check if this result is valid for the ranking system.
  def is_valid_for_ranking
    !(
      (meeting_event && meeting_event.is_out_of_race) ||
      (meeting_program && meeting_program.is_out_of_race) ||
      self.is_out_of_race ||
      self.is_disqualified
    )
  end

  # Retrieves the associated Team full name
  def get_team_name
    self.team ? self.team.get_full_name() : '?'
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Category Type id as it is; returns 0 in case of an invalid record
  def get_category_type_id
    self.category_type ? self.category_type.id : 0
  end

  # Retrieves the Category Type code as it is; returns '?' in case of an invalid record
  def get_category_type_code
    self.category_type ? self.category_type.code : '?'
  end

  # Retrieves the Category Type short name as it is; returns '?' in case of an invalid record
  def get_category_type_short_name
    self.category_type ? self.category_type.short_name : '?'
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Season id as it is; returns 0 in case of an invalid record
  def get_season_id
    self.season ? self.season.id : 0
  end

  # Retrieves the Gender Type id as it is; returns 0 in case of an invalid record
  def get_gender_type_id
    self.gender_type ? self.gender_type.id : 0
  end

  # Retrieves the Pool Type id as it is; returns 0 in case of an invalid record
  def get_pool_type_id
    self.pool_type ? self.pool_type.id : 0
  end
  # ----------------------------------------------------------------------------

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
  #-- --------------------------------------------------------------------------
  #++

  # Returns +true+ if this instance is associated to the specified PoolType#code.
  # +false+ otherwise. Code-equality test (w/ safety) checker.
  def has_pool_type_code?( code )
     pool_type ? pool_type.code == code : false
  end

  # Returns +true+ if this instance is associated to the specified EventType#code.
  # +false+ otherwise. Code-equality test (w/ safety) checker.
  def has_event_type_code?( code )
     event_type ? event_type.code == code : false
  end

  # Returns +true+ if this instance is associated to the specified CategoryType#code.
  # +false+ otherwise. Code-equality test (w/ safety) checker.
  def has_category_type_code?( code )
     category_type ? category_type.code == code : false
  end

  # Returns +true+ if this instance is associated to the specified GenderType#code.
  # +false+ otherwise. Code-equality test (w/ safety) checker.
  def has_gender_type_code?( code )
     gender_type ? gender_type.code == code : false
  end

  # Returns +true+ if this instance is associated to the specified GenderType#code.
  # +false+ otherwise. Code-equality test (w/ safety) checker.
  def has_federation_type_code?( code )
     federation_type ? federation_type.code == code : false
  end
  #-- --------------------------------------------------------------------------
  #++


  # Counts the query results for a specified <tt>meeting_id</tt>, <tt>team_id</tt> and
  # minimum result score.
  #
  def self.count_team_results_for( meeting_id, team_id, min_meeting_score )
    self.joins( :meeting ).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ? AND ' <<
        'meeting_individual_results.meeting_individual_points >= ?',
        meeting_id, team_id, min_meeting_score ]
    ).count
  end


  # Counts the query results for a specified <tt>meeting_id</tt>, <tt>team_id</tt> and <tt>rank_filter</tt>.
  # <tt>rank_filter</tt> can be also an Array of required ranks.
  #
  def self.count_team_ranks_for( meeting_id, team_id, rank_filter )
    self.joins( :meeting ).has_rank( rank_filter ).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ? AND ' <<
        'meeting_individual_results.meeting_individual_points > 0',
        meeting_id, team_id ]
    ).count
  end


  # Counts the query results for a specified <tt>meeting_id</tt> (optional), <tt>swimmer_id</tt> and <tt>rank_filter</tt>.
  # <tt>rank_filter</tt> can be also an Array of required ranks.
  #
  def self.count_swimmer_ranks_for( swimmer_id, rank_filter, meeting_id = nil )
    mir = MeetingIndividualResult.is_valid.has_rank( rank_filter )
      .where([
        '(swimmer_id = ?) AND (meeting_individual_results.meeting_individual_points > 0)',
        swimmer_id
      ])
    mir = mir.joins( :meeting ).where( ['meetings.id = ?', meeting_id]) if meeting_id
    mir.count
  end
  #-- --------------------------------------------------------------------------
  #++

  # Safe getter to retrieve the associated sorted list of passages.
  # Returns an empty array when none are found.
  # (User #get_passages.count to get the total number of passages.)
  #
  def get_passages
    passages ? passages.sort_by_distance : []
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns an array of 1st-rank Meeting result records, scoped from MeetingIndividualResult
  # (an array, in case there is more than one row with the same exact timing result at the same
  # ranking position), being selected by the speficied parameters.
  #
  # This allows to find out what is/are the current record(s) for a specified event, category, gender
  # and pool type.
  #
  # === "Special" parameters:
  #
  # - <tt>category_type_id_or_code</tt> => if it's a Fixnum is assumed to be an ID; if it's a String,
  # it's assumed to be the +code+. If it's +nil+, the "all time" value will be searched.
  # Obviously, if the value used for this parameter is a Fixnum and the ID is used for the query,
  # this will allow a more precise fine-tuning of the results, since both the season and the code
  # identify a single, unique category_types.id (whereas, using the code, you'll get the current
  # record among all seasons).
  #
  # - <tt>pool_type_id</tt> => when supplied, only the results obtained from meetings attended at a
  # matching pool_type will be selected; if +nil+, this WHERE condition is skipped (and the result
  # will be computed among all available pool types).
  #
  # - <tt>meeting_id</tt> => when supplied, only the best timing records for the specified meeting
  # are searched; when +nil+, the search is extended to all the individual results specified
  # with the remaining parameters. Remember that if also <tt>pool_type_id</tt> is present, the latter
  # must match the actual pool_type_id used for the selected meeting, otherwise the result will
  # be an empty array.
  #
  # - <tt>swimmer_id</tt> => when supplied, only the best timing records for the specified swimmer
  # will be collected; when +nil+, the search is extended to all swimmers.
  #
  # - <tt>team_id</tt> => when supplied, only the best timing records for the specified team
  # will be collected; when +nil+, the search is extended to all teams.
  #
  # @deprecated Use RecordCollection and RecordCollector classes instead.
  #
  def self.deprecated_get_records_for( event_type_code, category_type_id_or_code_or_nil, gender_type_id,
                            pool_type_id = nil, meeting_id = nil, swimmer_id = nil, team_id = nil,
                            limit_for_same_ranking_results = 3 )
    mir = MeetingIndividualResult.is_valid.has_rank(1)
    mir = mir.joins( :pool_type ).where( ['pool_types.id = ?', pool_type_id]) if pool_type_id
    mir = mir.joins( :meeting ).where( ['meetings.id = ?', meeting_id]) if meeting_id
    mir = mir.where( ['swimmer_id = ?', swimmer_id]) if swimmer_id
    if category_type_id_or_code_or_nil
      if category_type_id_or_code_or_nil.instance_of?(String)
        mir = mir.where( ['category_types.code = ?', category_type_id_or_code_or_nil])
      elsif category_type_id_or_code_or_nil.instance_of?(Fixnum)
        mir = mir.where( ['category_types.id = ?', category_type_id_or_code_or_nil])
      end
    end
    mir = mir.where( ['team_id = ?', team_id]) if team_id
    where_cond = [
      "(event_types.code = ?) AND (gender_types.id = ?)",
      event_type_code, gender_type_id
    ]
# DEBUG
    puts "\r\n---[ #{self.name}.get_records_for() ]---"
    puts "- pool_type_id = #{pool_type_id}"
    puts "- meeting_id = #{meeting_id}"
    puts "- where_cond = #{where_cond.inspect}\r\n"

    first_recs = mir.includes(
      :meeting_program, :event_type, :category_type, :gender_type
    ).joins(
      :meeting_program, :event_type, :category_type, :gender_type
    ).where( where_cond ).order(
      :minutes, :seconds, :hundreds
    ).limit( limit_for_same_ranking_results )
# DEBUG
    puts "\r\n- first_recs.size = #{first_recs.size}"

    if first_recs.size > 0                          # Compute the first timing result value
      first_timing_value = first_recs.first.minutes*6000 + first_recs.first.seconds*100 + first_recs.first.hundreds
# DEBUG
      puts "- first_timing_value = #{first_timing_value}"
      puts "- first_recs.first => #{first_recs.first.get_swimmer_name}, #{first_recs.first.get_meeting_program_verbose_name}\r\n"
                                                    # Remove from the result all other rows that have a greater timing result (keep same ranking results)
      first_recs.reject!{ |row| first_timing_value < (row.minutes*6000 + row.seconds*100 + row.hundreds) }
    end
    first_recs
  end
end
