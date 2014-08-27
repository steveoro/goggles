# encoding: utf-8
require 'drop_down_listable'


=begin

= CategoryType model

  - version:  4.00.359.20140718
  - author:   Steve A.

=end
class Team < ActiveRecord::Base
  include DropDownListable

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!
  belongs_to :city
  validates_associated :city

  has_many :badges
  has_many :meeting_individual_results
  has_many :meetings, through: :meeting_individual_results
  has_many :meeting_relay_results
  has_many :team_affiliations
  has_many :seasons,      through: :team_affiliations
  has_many :season_types, through: :team_affiliations
  has_many :goggle_cups

  validates_presence_of :name
  validates_length_of :name, within: 1..60, allow_nil: false

  validates_presence_of :editable_name
  validates_length_of :editable_name, within: 1..60, allow_nil: false

  validates_length_of :address,       maximum: 100
  validates_length_of :phone_mobile,  maximum:  40
  validates_length_of :phone_number,  maximum:  40
  validates_length_of :fax_number,    maximum:  40
  validates_length_of :e_mail,        maximum: 100
  validates_length_of :contact_name,  maximum: 100
  validates_length_of :home_page_url, maximum: 150

  scope :sort_team_by_user, ->(dir) { order("users.name #{dir.to_s}, teams.name #{dir.to_s}") }
  scope :sort_team_by_city, ->(dir) { order("cities.name #{dir.to_s}, teams.name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    editable_name
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{editable_name}#{city ? ' - ' + city.get_full_name : ''}"
  end

  # Same as get_full_name but adds also the ID at the end.
  def get_full_name_with_id
    "#{editable_name} (#{id})"
  end


  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Check if team has a Goggle cup not closed (ended) at a certain date
  #
  # params
  # evaluation_date: the date the goggle cup should be current at (default today)
  #
  def has_goggle_cup_at?( evaluation_date = Date.today )
    goggle_cups.each do |goggle_cup|
      return true if goggle_cup.is_current_at?( evaluation_date )
    end
    false
  end
  # ----------------------------------------------------------------------------

  # Returns the current goggle cup if present
  #
  # params
  # evaluation_date: the date the goggle cup should be current at (default today)
  #
  def get_current_goggle_cup_at( evaluation_date = Date.today )
    goggle_cups.each do |goggle_cup|
      return goggle_cup if goggle_cup.is_current_at?( evaluation_date )
    end
    nil
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  # @overload inherited from DropDownListable
  #
  def self.get_label_symbol
    :get_full_name
  end
  # ----------------------------------------------------------------------------

  # Retrieves the array of unique swimmer IDs registered for a specified meeting_id
  # 
  def self.get_swimmer_ids_for( team_id, meeting_id )
    team = Team.find_by_id( team_id )
    team ? team.meeting_individual_results.includes(:meeting).where(['meetings.id=?', meeting_id]).collect{|row| row.swimmer_id}.uniq : []
  end
  # ----------------------------------------------------------------------------
end
