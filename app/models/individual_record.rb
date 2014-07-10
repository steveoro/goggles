# encoding: utf-8


=begin

= IndividualRecord model

  - version:  4.00.345.20140710
  - author:   Steve A.

  Stores the current & best individual results (or records) collected from all
  team or federation results.
  
  This entity must be periodically updated by a batch rake task (usually after
  each MeetingIndividualResult insertion).

=end
class IndividualRecord < ActiveRecord::Base
  include SwimmerRelatable
  include TimingGettable
  include TimingValidatable

  belongs_to :pool_type
  belongs_to :event_type
  belongs_to :category_type
  belongs_to :gender_type

  belongs_to :team
  belongs_to :season
  belongs_to :federation_type

  belongs_to :meeting_individual_result             # (May be null)

  validates_associated :pool_type
  validates_associated :event_type
  validates_associated :category_type
  validates_associated :gender_type

  validates_associated :team
  validates_associated :season
  validates_associated :federation_type


  scope :team_records,        -> { where(is_team_record: true) }
  scope :federation_records,  -> { where(is_team_record: false) }
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
