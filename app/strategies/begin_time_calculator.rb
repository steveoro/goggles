=begin

= BeginTimeCalculator

  - Goggles framework vers.:  4.00.661
  - author: Steve A.

 Allows to compute an esteemed begin time for any Meeting program or event given
 the number of total registered athletes, the event ordinal number and its base
 time.

=end
class BeginTimeCalculator

  # Computes the esteemed begin time of any event, given the parameters.
  #
  # == Params:
  # - scheduled_date: the scheduled date for this event/program;
  # - event_order: the ordinal number of the event/program;
  # - total_athletes: the total number of athletes for this event/program;
  # - base_time_mins: the base time minutes for this event (taken from time_standards);
  # - previous_begin_time: (default +nil+) when given as either a Time or a DateTime instance,
  #   the previous event begin time allows the computation to be more precise;
  # - pool_lanes_total: (default 8) the typical/medium number of pool lanes occupancy;
  # - starting_hour: (default 8) the starting hour of the event (24h format).
  #
  # == Returns
  # An instance of Time representing the alleged/esteemed begin time for this event
  # or program.
  #
  def self.compute( scheduled_date, event_order, total_athletes, base_time_mins,
                    previous_begin_time = nil, pool_lanes_total = 8, starting_hour = 8 )
                                                    # Compute heat number:
    heat_number_approx = self.get_esteemed_heat_number(
      total_athletes,
      pool_lanes_total,
      event_order
    )
                                                    # Compute esteemed duration:
    esteemed_duration_in_mins = self.get_esteemed_duration_in_mins(
      base_time_mins,
      heat_number_approx
    )
    if previous_begin_time                          # Add a begin_time, when given:
      esteemed_duration_in_mins += previous_begin_time.min
    end
    esteemed_duration_in_hours = esteemed_duration_in_mins / 60
    if previous_begin_time                          # Add a begin_time, when given:
      esteemed_duration_in_hours += previous_begin_time.hour
    end
                                                    # Prepare the result:
    Time.utc(
      scheduled_date.year,
      scheduled_date.month,
      scheduled_date.day + (esteemed_duration_in_hours / 24),
      esteemed_duration_in_hours % 24,
      esteemed_duration_in_mins % 60
    )
  end
  #-- --------------------------------------------------------------------------
  #++


  # Computes an esteemed heat number given the parameters.
  #
  def self.get_esteemed_heat_number( total_athletes, pool_lanes_total, event_order )
    event_order = event_order.to_i > 0 ? event_order.to_i : 1
    ( total_athletes / pool_lanes_total ) + event_order
  end


  # Computes an esteemed event duration in minutes given the parameters.
  #
  def self.get_esteemed_duration_in_mins( base_time_mins, heat_number_approx )
    if base_time_mins.to_i < 3
      heat_number_approx * 2
    else
      heat_number_approx * base_time_mins.to_i + 2
    end
  end
end
