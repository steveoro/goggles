# encoding: utf-8

=begin

= Timing
  - Goggles framework vers.:  4.00.164.20140129
  - author: Steve A.

 Utility class to store timing data and to allow simple mathematical operations
 between timings (delta, sum, ...).

=== Members:
 - <tt>:hundreds</tt> => Fixnum value for hundreds of a second.
 - <tt>:seconds</tt> => Fixnum value for seconds.
 - <tt>:minutes</tt> => Fixnum value for minutes.
 - <tt>:hours</tt> => Fixnum value for hours.
 - <tt>:days</tt> => Fixnum value for days.

=end
class Timing

  attr_accessor :hundreds, :seconds, :minutes, :hours, :days 

  # Creates a new instance.
  # Note the ascending precision of the parameters, which allows to skip
  # the rarely used ones.
  #
  def initialize( hundreds = 0, seconds = 0, minutes = 0, hours = 0, days = 0 )
    self.hundreds = hundreds
    self.seconds = seconds
    self.minutes = minutes
    self.hours = hours
    self.days = days
                                                    # Adjust the result:
    set_from_hundreds( self.to_hundreds )
  end

  # Clears the cached results. This method is useful only if the same TokenExtractor
  # instance is used to tokenize different source texts.
  #
  def clear()
    self.hundreds = 0
    self.seconds = 0
    self.minutes = 0
    self.hours = 0
    self.days = 0
    self
  end
  # ---------------------------------------------------------------------------

  # Sets the current instance value according to the total Fixnum value of hundreds of a second
  # specified as a parameter.
  #
  def set_from_hundreds( hundreds_value )
    self.days = hundreds_value / 8640000
    remainder = hundreds_value % 8640000
    self.hours = remainder / 360000
    remainder  = remainder % 360000
    self.minutes = remainder / 6000
    remainder    = remainder % 6000
    self.seconds = remainder / 100
    remainder    = remainder % 100
    self.hundreds = remainder
    self
  end
  # ---------------------------------------------------------------------------

  # Returns a new instance containing as member values the sum of the current instance
  # with the one specified as a parameter.
  #
  def +( timing )
    Timing.new(
      self.hundreds + timing.hundreds,
      self.seconds + timing.seconds,
      self.minutes + timing.minutes,
      self.hours + timing.hours,
      self.days + timing.days
    )
  end

  # Returns a new instance containing as member values the differemce between
  # the current instance and the one specified as a parameter.
  #
  def -( timing )
    Timing.new(
      self.hundreds - timing.hundreds,
      self.seconds - timing.seconds,
      self.minutes - timing.minutes,
      self.hours - timing.hours,
      self.days - timing.days
    )
  end
  # ---------------------------------------------------------------------------

  # Converts the current instance to total Fixnum value of hundreds of a second.
  def to_hundreds
    self.hundreds + self.seconds * 100 + self.minutes * 6000 +
    self.hours * 360000 + self.days * 8640000
  end

  # Converts the current instance to a readable string.
  # If +hide_zero_members+ is true, members of the class that have a zero value
  # will not be included in the output string.
  def to_s
    (days > 0 ? "#{days}d " : '') +
    (hours > 0 ? "#{hours}h " : '') +
    sprintf("%2s'%2s\"%02.0f", minutes, seconds, hundreds)
  end
  # ---------------------------------------------------------------------------

  # Commodity class method. Same as to_s.
  #
  def self.to_s( hundreds = 0, seconds = 0, minutes = 0, hours = 0, days = 0 )
    Timing.new( hundreds, seconds, minutes, hours, days ).to_s
  end

  # Commodity class method. Similar to +to_s+ method, but it doesn't include
  # members with non positive values in the output string.
  #
  def self.to_compact_s( hundreds = 0, seconds = 0, minutes = 0, hours = 0, days = 0 )
    (days > 0 ? "#{days}d " : '') +
    (hours > 0 ? "#{hours}h " : '') +
    (minutes > 0 ? sprintf("%2s'", minutes) : '') +
    (seconds > 0 ? sprintf("%2s\"", seconds) : '') +
    (hundreds > 0 ? sprintf("%02.0f", hundreds) : '')
  end
  # ---------------------------------------------------------------------------

  # Outputs the specified value of seconds in an hour-format string (Hh MM' SS").
  #
  def self.to_hour_string( total_seconds )
    tot_h = total_seconds.to_i/3600
    rem_min = (total_seconds.to_i%3600)
    sprintf("%1s\h %2s\' %02.0f\"", tot_h, rem_min/60, rem_min%60)
  end

  # Outputs the specified value of seconds in a minute-format (M'SS").
  #
  def self.to_minute_string( total_seconds )
    sprintf( "%1s\'%02.0f\"", total_seconds.to_i/60, total_seconds.to_i%60 )
  end
  # ---------------------------------------------------------------------------
end
