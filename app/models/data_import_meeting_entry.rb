require 'wrappers/timing'
require 'swimmer_relatable'
require 'timing_gettable'
require 'timing_validatable'
require 'data_importable'


#
# == DataImportMeetingEntry
#
# Model class
#
# @author   Steve A.
# @version  4.00.811
#
class DataImportMeetingEntry < ActiveRecord::Base
  include SwimmerRelatable
  include TimingGettable
  include EventTypeRelatable
  include DataImportable

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!
  belongs_to :meeting_entry, foreign_key: "conflicting_id"

  validates_presence_of :import_text

  belongs_to :data_import_meeting_program
  belongs_to :data_import_swimmer
  belongs_to :data_import_team
  belongs_to :data_import_badge

  belongs_to :meeting_program
  belongs_to :team
  belongs_to :team_affiliation
  belongs_to :badge

  belongs_to :entry_time_type

  validates_presence_of :athlete_name
  validates_length_of   :athlete_name, within: 1..100, allow_nil: false
  validates_presence_of :team_name
  validates_length_of   :team_name, within: 1..50, allow_nil: false

  validates_length_of   :athlete_badge_number, maximum: 40
  validates_length_of   :team_badge_number, maximum: 40

  validates_presence_of     :year_of_birth
  validates_length_of       :year_of_birth, within: 2..4, allow_nil: false
  validates_numericality_of :year_of_birth


  #-- ----------------------------------------------------------------------------
  # Base methods:
  #-- ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data.
  def get_full_name
    "#{get_meeting_program_name}: #{start_list_number}) #{get_swimmer_name}, #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data.
  def get_verbose_name
    "#{get_meeting_program_verbose_name}: #{start_list_number}) #{get_swimmer_name} (#{get_year_of_birth}), #{get_timing}"
  end
  # ----------------------------------------------------------------------------


  # Retrieves the associated Swimmer full name
  def get_swimmer_name
    self.swimmer ? self.swimmer.get_full_name() : ( self.data_import_swimmer ? self.data_import_swimmer.get_full_name() : '?')
  end

  # Retrieves the associated Team full name
  def get_team_name
    self.team ? self.team.get_full_name() : (self.data_import_team ? self.data_import_team.get_full_name() : '?')
  end

  # Retrieves the localized Event Type code
  def get_event_type
    self.meeting_program ? self.meeting_program.event_type.i18n_short : (self.data_import_meeting_program ? self.data_import_meeting_program.event_type.i18n_short : '?')
  end

  # Retrieves the scheduled_date of this result
  def get_scheduled_date                            # The following ActiveRecord chain is granted in existence by validation assertions: (even the first check could be avoided)
    self.meeting_program ? self.meeting_program.get_meeting_session_name :  (self.data_import_meeting_program ? self.data_import_meeting_program.get_meeting_session_name() : '?')
  end

  # Retrieves the Meeting Program short name
  def get_meeting_program_name
    self.meeting_program ? self.meeting_program.get_full_name() :  (self.data_import_meeting_program ? self.data_import_meeting_program.get_full_name() : '?')
  end

  # Retrieves the Meeting Program verbose name
  def get_meeting_program_verbose_name
    self.meeting_program ? self.meeting_program.get_verbose_name() :  (self.data_import_meeting_program ? self.data_import_meeting_program.get_verbose_name() : '?')
  end
  # ----------------------------------------------------------------------------

end
