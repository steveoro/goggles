require 'ic_i18n'

class DayPartType < ActiveRecord::Base
  include ICI18n

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 1, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists
  # ----------------------------------------------------------------------------


  # Unique ID used inside the DB to address a "morning" DayPartType instance 
  MORNING_ID = 1

  # Unique ID used inside the DB to address an "afternoon" DayPartType instance 
  AFTERNOON_ID = 2

  # Unique ID used inside the DB to address an "evening" DayPartType instance 
  EVENING_ID = 3

  # Unique ID used inside the DB to address a nighty DayPartType instance 
  NIGHT_ID = 4
  # ----------------------------------------------------------------------------


  # Commodity Hash used to enlist all defined IDs and their corresponding codes.
  #
  TYPES_HASH = {
    MORNING_ID    => 'M',
    AFTERNOON_ID  => 'P',
    EVENING_ID    => 'S',
    NIGHT_ID      => 'N'
  }
  # ----------------------------------------------------------------------------
end
