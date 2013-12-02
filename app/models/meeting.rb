class Meeting < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :season
  belongs_to :edition_type
  belongs_to :timing_type
  validates_associated :season
  validates_associated :edition_type
  validates_associated :timing_type

  belongs_to( :individual_score_computation_type,
              :class_name  => "ScoreComputationType", 
              :foreign_key => "individual_score_computation_type_id"
  )
  belongs_to( :relay_score_computation_type,
              :class_name  => "ScoreComputationType", 
              :foreign_key => "relay_score_computation_type_id"
  )
  belongs_to( :team_score_computation_type,
              :class_name  => "ScoreComputationType", 
              :foreign_key => "team_score_computation_type_id"
  )
  belongs_to( :meeting_score_computation_type,
              :class_name  => "ScoreComputationType", 
              :foreign_key => "meeting_score_computation_type_id"
  )

  has_one  :season_type, :through => :season

  has_many :meeting_sessions, :dependent => :delete_all
  has_many :meeting_team_scores, :dependent => :delete_all

  has_many :meeting_events, :through => :meeting_sessions, :dependent => :delete_all
  has_many :meeting_programs, :through => :meeting_events, :dependent => :delete_all
  has_many :meeting_individual_results, :through => :meeting_programs, :dependent => :delete_all
  has_many :meeting_relay_results, :through => :meeting_programs, :dependent => :delete_all

  # TODO Add other has_many relationships only when needed

  validates_presence_of :code
  validates_length_of   :code, :within => 1..20, :allow_nil => false

  validates_presence_of :header_year
  validates_length_of :header_year, :within => 1..9, :allow_nil => false

  validates_presence_of :edition
  validates_length_of   :edition, :maximum => 3, :allow_nil => false

  validates_presence_of :description
  validates_length_of :description, :maximum => 100

  validates_length_of :reference_phone, :maximum => 40
  validates_length_of :reference_e_mail, :maximum => 50
  validates_length_of :reference_name, :maximum => 50

  validates_length_of :configuration_file, :maximum => 255

  validates_length_of :max_individual_events, :maximum => 1
  validates_length_of :max_individual_events_per_session, :maximum => 1


  scope :sort_meeting_by_user,                    lambda { |dir| order("users.name #{dir.to_s}, meetings.description #{dir.to_s}") }
  scope :sort_meeting_by_season,                  lambda { |dir| order("seasons.begin_date #{dir.to_s}, meetings.description #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes the shortest possible description for the name associated with this data
  def get_short_name
    sname = description.split(/trofeo|meeting/i)
    if sname.length > 1
      # Remove spaces, split in tokens, delete empty tokens and take just the first 3, joined together:
      ( ( sname[1].strip.split(/\s|\,/) ).delete_if{|item| item==''} )[0..2].join(' ')
    else
      # Just use the name if it wasn't "splittable":
      sname[0]
    end
  end

  # Computes a shorter description for the name associated with this data
  def get_full_name
    description
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{description} (#{get_season_type})"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Season Type short name
  def get_season_type
    self.season ? self.season.get_season_type() : '?'
  end
  # ----------------------------------------------------------------------------

  # Computes the shortest possible description for the list of all the events created
  # for this meeting.
  # 
  def get_short_events
    events = self.meeting_events.includes(:event_type).joins(:event_type).collect{ |row| row.event_type.i18n_short }
    events.join('--').gsub(' ','').gsub('--', ', ') # Make the list more readable
  end
  # ----------------------------------------------------------------------------

end
