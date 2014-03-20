require 'wrappers/timing'


class Swimmer < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  # This will be used to discriminate the actual user associated with this data
  # (the "associated_user_id") and the user_id which has created/updated/modified
  # the data itself (usually a user with a higher grant) 
  has_one :associated_user,  :class_name  => "User", 
                             :foreign_key => "associated_user_id"
  belongs_to :gender_type
  validates_associated :gender_type

  has_many :badges
  has_many :teams, :through => :badges
  has_many :category_types, :through => :badges

  has_many :meeting_individual_results
  has_many :meeting_relay_swimmers
  has_many :meeting_relay_results,  :through => :meeting_relay_swimmers

  has_many :meeting_sessions,       :through => :meeting_individual_results
  has_many :meetings,               :through => :meeting_individual_results

  has_many :swimmer_results

  validates_presence_of :complete_name
  validates_length_of   :complete_name, :within => 1..100, :allow_nil => false

  validates_length_of   :last_name, :maximum => 50
  validates_length_of   :first_name, :maximum => 50

  validates_presence_of :year_of_birth
  validates_length_of   :year_of_birth, :within => 2..4, :allow_nil => false

  validates_length_of :phone_mobile,  :maximum =>  40
  validates_length_of :phone_number,  :maximum =>  40
  validates_length_of :e_mail,        :maximum => 100
  validates_length_of :nickname,      :maximum => 25


  scope :sort_swimmer_by_user,        lambda { |dir| order("users.name #{dir.to_s}, swimmers.complete_name #{dir.to_s}") }
  scope :sort_swimmer_by_name,        lambda { |dir| order("complete_name #{dir.to_s}") }
  scope :sort_swimmer_by_gender_type, lambda { |dir| order("gender_types.code #{dir.to_s}, swimmers.complete_name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    last_name.to_s.empty? ? "#{complete_name}" : "#{last_name} #{first_name}"
  end

  # Computes a description for the name associated with this data
  def get_full_name_with_nickname
    last_name.to_s.empty? ? "#{complete_name}#{nickname.to_s.empty? ? '' : ' ('+nickname+')'}" : "#{first_name} #{nickname.to_s.empty? ? '' : ' ('+nickname+') '} #{last_name}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_full_name} (#{year_of_birth}, #{gender_type ? gender_type.code : '?'})"
  end

  # Safe getter for the nickname (it can be nil)
  def get_nickname
    self.nickname ? self.nickname : ''
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  # (Override)
  #
  def self.get_label_symbol
    :get_full_name
  end
  # ----------------------------------------------------------------------------


  # Returns true if the current row's gender_type_id is equal to MALE_ID 
  def is_male
    ( self.gender_type_id == GenderType::MALE_ID )
  end

  # Returns true if the current row's gender_type_id is equal to FEMALE_ID 
  def is_female
    ( self.gender_type_id == GenderType::FEMALE_ID )
  end
  # ----------------------------------------------------------------------------


  # Returns the array of distinct team names associated to the specified swimmer_id.
  # An empty array when not found.
  #
  # This is useful to create multiple links to team-related data, looping on each
  # item.
  #
  def self.get_team_names( swimmer_id )
    swimmer = Swimmer.find_by_id( swimmer_id )
    swimmer ? swimmer.teams.collect{|row| row.name }.uniq : []    
  end
  # ----------------------------------------------------------------------------

  # Retrieves a comma-separated string containing all the distinct team
  # names associated with this instance.
  #
  def get_team_names
     self.teams.collect{ |row| row.name }.uniq.join(', ')
  end
  # ----------------------------------------------------------------------------

  # Returns the Badge row instance for the affiliation to <tt>team_id</tt> for
  # the specified <tt>season_id</tt>.
  # Returns +nil+ when not found.
  #
  def get_badge_for( season_id, team_id )
     self.badges.includes(:season, :team).where( :season_id => season_id, :team_id => team_id ).first
  end

  # Returns an +Array+ of Badge row instances linked to this Swimmer,
  # possibly filtered by season, if the parameter is given.
  #
  def get_badges_array( season_id = nil )
     all_badges = self.badges.includes(:season, :team)
     all_badges = all_badges.where( :season_id => season_id ) if season_id
     all_badges
  end

  # Similarly to <tt>self.get_team_names( swimmer_id )</tt>, returns an +Array+
  # where each item is a String composed of the TeamAffiliation's Badge number and
  # the corresponding Team name.
  #
  # This is useful to create multiple links to team-related data, looping on each
  # item.
  # The parameter, when present, allows to filter the results by season.
  #
  def get_badges_with_team_names_array( season_id = nil )
     all_badges = get_badges_array( season_id )
     all_badges.collect{ |row| "#{I18n.t('badge.short')} #{row.number}, #{row.team.editable_name}" }
  end
  # ----------------------------------------------------------------------------


  # Helper getter for the current category type of this swimmer,
  # according to the latest registered badge.
  #
  def get_current_category_type_from_badges
    self.badges.joins(:season).order('seasons.header_year').last.category_type
  end


  # Helper getter for the current category type of this swimmer,
  # computed from the two most common season types (MASFIN & MASCSI).
  # Returns an array with the unique category type codes found.
  #
  def get_current_category_type_codes
    last_fin_season = Season.get_last_season_by_type( SeasonType::CODE_MAS_FIN )
    last_csi_season = Season.get_last_season_by_type( SeasonType::CODE_MAS_CSI )
    curr_fin_category = last_fin_season ? CategoryType.get_category_from( last_fin_season.id, self.year_of_birth ) : nil
    curr_csi_category = last_csi_season ? CategoryType.get_category_from( last_csi_season.id, self.year_of_birth ) : nil
    [ curr_fin_category, curr_csi_category ].compact.collect{ |category| category.code }.uniq
  end
  # ----------------------------------------------------------------------------

  # Returns the total meters swam by this swimmer
  #
  def get_total_meters_swam
    relay_lengths = self.meeting_relay_swimmers.includes(:event_type).collect{ |mrs| mrs.event_type ? mrs.event_type.phase_length_in_meters : 0 }
    ind_lengths   = self.meeting_individual_results.includes(:event_type).collect{ |mir| mir.event_type ? mir.event_type.length_in_meters : 0 }
    ( relay_lengths + ind_lengths ).inject{ |sum, lenght| sum + lenght }
  end

  # Returns the total time swam by this swimmer as a Timing instance
  #
  def get_total_time_swam
    relay_timings = self.meeting_relay_swimmers.collect{ |mrs| mrs.get_timing_instance.to_hundreds }
    ind_timings   = self.meeting_individual_results.collect{ |mir| mir.get_timing_instance.to_hundreds }
    total_hundreds = ( relay_timings + ind_timings ).inject{ |sum, hundreds| sum + hundreds }
    Timing.new( total_hundreds )
  end
  # ----------------------------------------------------------------------------

  # Returns the first meeting registered for this Swimmer; nil when not found.
  def get_first_meeting
    ms = self.meeting_sessions.includes(:meeting).order(:scheduled_date).first
    ms ? ms.meeting : nil
  end

  # Returns the last meeting registered for this Swimmer; nil when not found.
  def get_last_meeting
    ms = self.meeting_sessions.includes(:meeting).order(:scheduled_date).last
    ms ? ms.meeting : nil
  end
  # ----------------------------------------------------------------------------

  # Returns the best-ever MeetingIndividualResult according to the not-null standard points registered.
  # +nil+ when not found.
  #
  def get_best_individual_result
    self.meeting_individual_results.is_valid.where('standard_points > 0').order(:standard_points).last
  end

  # Returns the worst-ever MeetingIndividualResult according to the not-null standard points registered.
  # +nil+ when not found.
  #
  def get_worst_individual_result
    self.meeting_individual_results.is_valid.where('standard_points > 0').order(:standard_points).first
  end

  # Returns the total count of registered disqualifications
  def get_disqualifications_count
    ( self.meeting_individual_results.where(:is_disqualified => true).count +
      self.meeting_relay_results.where(:is_disqualified => true).count )
  end
  # ----------------------------------------------------------------------------
end
