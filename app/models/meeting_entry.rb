class MeetingEntry < ActiveRecord::Base
  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_program
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
  validates_associated :swimmer
  validates_associated :team
  validates_associated :team_affiliation
  validates_associated :badge

  belongs_to :entry_time_type

  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Returns just the formatted timing information
  def get_timing
    "#{minutes}'" + sprintf("%02.0f", seconds) + "\"" + sprintf("%02.0f", hundreds)
  end

  # Returns a new Timing class instance initialized with the timing data from this row
  def get_timing_instance
    Timing.new( hundreds, seconds, minutes )
  end

  # Computes a shorter description for the name associated with this data
  # Leega. Have to check for presence of start_list_number?
  def get_full_name
    "#{get_scheduled_date} #{get_event_type}: #{start_list_number}) #{get_athlete_name}, #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  # Leega. Have to check for presence of start_list_number?
  def get_verbose_name
    "#{get_meeting_program_verbose_name}: #{start_list_number}) #{get_athlete_name} (#{get_year_of_birth}), #{get_timing}"
  end
  # ----------------------------------------------------------------------------

  # Leega. Have to repat those method that are equal to those in meeting_individual_results?
  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
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
  # ----------------------------------------------------------------------------

  # Retrieves the localized Event Type ID as it is; returns 0 in case of an invalid record
  def get_event_type_id
    self.event_type ? self.event_type.id : 0
  end

  # Retrieves the localized Event Type code (short)
  def get_event_type
    self.event_type ? self.event_type.i18n_short : '?'
  end

  # Retrieves the localized Event Type code (full description)
  def get_event_type_description
    self.event_type ? self.event_type.i18n_description : '?'
  end

  # Retrieves the Event Type code as it is
  def get_event_type_code
    self.event_type ? self.event_type.code : '?'
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
  # ----------------------------------------------------------------------------
end
