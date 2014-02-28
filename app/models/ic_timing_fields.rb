require 'wrappers/timing'


=begin
  
= ICTimingFields

  - version:  4.00.195.20140228
  - author:   Steve A.

  Container module for interfacing common "timing-related" fields
  and method functions.

  *ASSUMES existance of the fields:*
  - hundreds
  - seconds
  - minutes

=end
module ICTimingFields

  # Returns the formatted timing information in String format.
  #
  def get_timing
    ( minutes.to_i > 0 ? "#{minutes.to_i}'" : '' ) +
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