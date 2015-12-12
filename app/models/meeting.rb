# encoding: utf-8
require 'drop_down_listable'


=begin

= Season

  - version:  4.00.399
  - author:   Steve A., Leega

=end
class Meeting < ActiveRecord::Base
  include DropDownListable
  include MeetingAccountable

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!
  belongs_to :season
  belongs_to :edition_type
  belongs_to :timing_type
  validates_associated :season
  validates_associated :edition_type
  validates_associated :timing_type

  acts_as_taggable_on :bookings

  belongs_to( :individual_score_computation_type,
              class_name: "ScoreComputationType",
              foreign_key: "individual_score_computation_type_id"
  )
  belongs_to( :relay_score_computation_type,
              class_name: "ScoreComputationType",
              foreign_key: "relay_score_computation_type_id"
  )
  belongs_to( :team_score_computation_type,
              class_name: "ScoreComputationType",
              foreign_key: "team_score_computation_type_id"
  )
  belongs_to( :meeting_score_computation_type,
              class_name: "ScoreComputationType",
              foreign_key: "meeting_score_computation_type_id"
  )

  has_one  :season_type, through: :season

  has_many :meeting_sessions, dependent: :delete_all
  has_many :meeting_team_scores, dependent: :delete_all
  has_many :meeting_reservations, dependent: :delete_all

  has_many :meeting_events, through: :meeting_sessions, dependent: :delete_all
  has_many :meeting_programs, through: :meeting_events, dependent: :delete_all
  has_many :meeting_entries, through: :meeting_programs, dependent: :delete_all
  has_many :meeting_individual_results, through: :meeting_programs, dependent: :delete_all
  has_many :meeting_relay_results, through: :meeting_programs, dependent: :delete_all

  has_many :swimming_pools, through: :meeting_sessions
  has_many :pool_types,     through: :meeting_sessions
  has_many :swimmers,       through: :meeting_individual_results
  has_many :teams,          through: :meeting_individual_results
  has_many :event_types,    through: :meeting_events

  validates_presence_of :code,        length: { within: 1..50 }, allow_nil: false
  validates_presence_of :header_year, length: { within: 1..9 }, allow_nil: false
  validates_presence_of :edition,     length: { maximum: 3 }, allow_nil: false
  validates_presence_of :description, length: { maximum: 100 }, allow_nil: false

  validates_length_of :reference_phone, maximum: 40
  validates_length_of :reference_e_mail, maximum: 50
  validates_length_of :reference_name, maximum: 50
  validates_length_of :configuration_file, maximum: 255
  validates_length_of :max_individual_events, maximum: 2
  validates_length_of :max_individual_events_per_session, maximum: 1

  attr_accessible :description, :entry_deadline, :has_warm_up_pool, :is_under_25_admitted,
                  :reference_phone, :reference_e_mail, :reference_name, :notes, :has_invitation,
                  :has_start_list, :are_results_acquired, :max_individual_events, :configuration_file,
                  :edition, :season_id, :user_id, :is_autofilled, :header_date, :code, :header_year,
                  :max_individual_events_per_session, :is_out_of_season,
                  :edition_type_id, :timing_type_id, :individual_score_computation_type_id,
                  :relay_score_computation_type_id, :team_score_computation_type_id,
                  :meeting_score_computation_type_id,
                  :invitation


  scope :sort_meeting_by_user,   ->(dir) { order("users.name #{dir.to_s}, meetings.description #{dir.to_s}") }
  scope :sort_meeting_by_season, ->(dir) { order("seasons.begin_date #{dir.to_s}, meetings.description #{dir.to_s}") }
  scope :sort_by_date,           ->(dir = 'ASC') { order("header_date #{dir.to_s}") }

  scope :has_only_invitation,    -> { where("has_invitation and not are_results_acquired") }
  scope :has_only_start_list,    -> { where("has_start_list and not are_results_acquired") }
  scope :has_results,            -> { where("are_results_acquired") }

  scope :for_season_type,        ->(season_type) { joins(:season_type).where(['season_types.id = ?', season_type.id]) }
  scope :for_code,               ->(code)        { where(['code = ?', code]) }

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
    case edition_type_id
    when EditionType::ORDINAL_ID
      "#{edition} #{description}"
    when EditionType::ROMAN_ID
      "#{edition.to_roman} #{description}"
    when EditionType::SEASON_ID
      "#{description} #{season.get_full_name}"
    when EditionType::YEAR_ID
      "#{description} #{header_year}"
    else
      description
    end
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_full_name} (#{get_season_type}, #{header_year})"
  end
  # ----------------------------------------------------------------------------

  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  # @overload inherited from DropDownListable
  #
  def self.get_label_symbol
    :get_short_name
  end
  # ----------------------------------------------------------------------------

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the first scheduled date for this meeting; nil when not found
  def get_scheduled_date
    ms = self.meeting_sessions.first
    ms ? Format.a_date( ms.scheduled_date ) : nil
  end

  # Gets together the scheduled date with the verbose name but without the header year
  def get_scheduled_date_with_verbose_name
    "#{get_scheduled_date}, #{get_full_name} (#{get_season_type})"
  end

  # Retrieves the Season Type short name
  def get_season_type
    self.season ? self.season.get_season_type() : '?'
  end
  # ----------------------------------------------------------------------------

  # Computes the shortest possible description for the list of all the events created
  # for this meeting.
  # If sessions = 0 return 'to be defined'
  # If sessions > 0 return a short description
  #
  def get_short_events( separator = ', ' )
    ms = self.meeting_sessions.sort_by_order
    if ms.count > 0
      ms.map{ |ms| ms.get_short_events( separator ) }.join( separator )
    else
      I18n.t('meeting.to_be_defined')
    end
  end

  # Computes the complete list of all the meeting events
  # with session informations.
  # If sessions = 0 return 'to be defined'
  # If sessions > 0 return a description for each session
  #
  def get_complete_events( separator = ', ' )
    ms = self.meeting_sessions.sort_by_order
    if ms.count > 0
      ms.map{ |ms| ms.get_short_events( separator ) }.join("\r\n")
    else
      I18n.t('meeting.to_be_defined')
    end
  end
  # ----------------------------------------------------------------------------

  # Computes the shortest session scheduled dates
  # list for this meeting without duplicated entries.
  # If sessions = 0 return 'to be defined'
  # If sessions > 0 return a short list
  #
  def get_short_dates( separator = ', ' )
    ms = self.meeting_sessions.sort_by_order
    if ms.count > 0
      ms.map{ |ms| ms.get_scheduled_date }.uniq.join( separator )
    else
      I18n.t('meeting.to_be_defined')
    end
  end

  # Computes a short session scheduled dates
  # list for this meeting.
  # If sessions = 0 return 'to be defined'
  # If sessions > 0 return a short list
  #
  def get_session_dates( separator = "\r\n" )
    ms = self.meeting_sessions.sort_by_order
    if ms.count > 0
      ms.map{ |ms| ms.get_scheduled_date }.join( separator )
    else
      I18n.t('meeting.to_be_defined')
    end
  end
  # ----------------------------------------------------------------------------

  # Computes a short session warm-up schedule
  # list for this meeting.
  #
  def get_session_warm_up_times( separator = "\r\n" )
    self.meeting_sessions.sort_by_order.map{ |ms| ms.get_warm_up_time }.join( separator )
  end
  # ----------------------------------------------------------------------------

  # Computes a short session warm-up schedule
  # list for this meeting.
  #
  def get_session_begin_times( separator = "\r\n" )
    self.meeting_sessions.sort_by_order.map{ |ms| ms.get_begin_time }.join( separator )
  end
  # ----------------------------------------------------------------------------

  # Computes a short session warm-up schedule
  # list for this meeting.
  #
  def get_pool_type
    self.meeting_sessions.sort_by_order.first.swimming_pool.pool_type
  end
  # ----------------------------------------------------------------------------

  # Computes the complete list of all the meeting events
  # with session informations.
  #
  def get_athletes_count_by_gender
  end
  # ----------------------------------------------------------------------------
end
