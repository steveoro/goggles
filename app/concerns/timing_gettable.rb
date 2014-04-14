require 'wrappers/timing'


=begin
  
= TimingGettable

- version:  4.00.219.20140413
  - author:   Steve A.

  Container module for interfacing common "timing-related" fields
  and method functions.

=end
module TimingGettable
  extend ActiveSupport::Concern

  included do
    belongs_to :swimmer
    validates_associated :swimmer
  end


  # Returns the formatted timing information in String format.
  #
  def get_timing( show_minutes_even_if_zero = false )
    ( show_minutes_even_if_zero || minutes.to_i > 0 ? "#{minutes.to_i}'" : '' ) +
    sprintf("%02.0f\"", seconds.to_i) +
    sprintf("%02.0f", hundreds.to_i)
  end

  # Returns a new Timing class instance initialized with the timing data from this row
  #
  def get_timing_instance
    Timing.new( hundreds.to_i, seconds.to_i, minutes.to_i )
  end
  #-----------------------------------------------------------------------------

end