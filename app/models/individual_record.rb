# encoding: utf-8


=begin

= IndividualRecord

  - version:  4.00.343.20140709
  - author:   Steve A.

=end
class IndividualRecord < ActiveRecord::Base
  belongs_to :meeting_individual_result
  belongs_to :pool_type
  belongs_to :event_type
  belongs_to :category_type
  belongs_to :gender_type
  belongs_to :swimmer
  belongs_to :team
  belongs_to :season_type
  belongs_to :federation_type

  validates_associated :meeting_individual_result
  validates_associated :pool_type
  validates_associated :event_type
  validates_associated :category_type
  validates_associated :gender_type
  validates_associated :swimmer
  validates_associated :team
  validates_associated :season_type
  validates_associated :federation_type

  scope :is_global,             -> { where(is_team_record: false, is_season_record: false, is_federation_record: false) }
  scope :is_team_global,        -> { where(is_team_record: true, is_season_record: false, is_federation_record: false) }
  scope :is_federation_global,  -> { where(is_team_record: false, is_season_record: false, is_federation_record: true) }

  scope :is_team_local,         -> { where(is_team_record: true, is_season_record: false, is_federation_record: true) }
end
