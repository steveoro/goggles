# encoding: utf-8

require 'fileutils'
require 'common/format'


=begin

= ResultTimeParser

  - Goggles framework vers.:  4.00.567
  - author: Steve A.

 Strategy class dedicated to extracting required Meeting result fields
 from single text tokens extracted from meeting result files.

=end
class ResultTimeParser

  attr_reader :disqualification_code_type_id, :mins_secs_hds_array
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  # === Params:
  # - rank_token: the text token referring to the ranking position of the result
  # - result_time_token: the text token referring to the actual result timing
  #
  def initialize( rank_token, result_time_token )
    @rank_token   = rank_token
    @result_token = result_time_token
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns +true+ if the Rank text token specified in the constructor contains the
  # "out of race" code. +false+ otherwise.
  #
  def is_out_of_race?
    ! ( @rank_token =~ /Fuori gara|F\.G\./i ).nil?
  end

  # Returns +true+ if the text token specified in the constructor contains the
  # "disqualified" code. +false+ otherwise.
  # This will return +true+ also for a "withdrawal" result code.
  #
  def is_disqualified?
    ! ( @result_token =~ /Ritir|Squal/i ).nil?
  end

  # Given the text token specified in the constructor, it parses:
  #
  # - A possible #disqualification_code_type_id, which will update
  #   the dedicated member (0 when not applicable).
  #
  # - The result timing, expressed as an array of integer, which will
  #   update #mins_secs_hds_array ([0,0,0] when none found).
  #
  # Yields self at the end, so this call is chainable.
  #
  def parse()
# DEBUG
#    puts("ResultTimeParser.parse(), rank: #{@rank_token}, result: '#{@result_token}' ) called.")
    # Get the disqualification code ID:
    if @result_token =~ /Ritir/i
      @disqualification_code_type_id = DisqualificationCodeType::DSQ_RETIRED_ID
    elsif @result_token =~ /Squal/i
      @disqualification_code_type_id = DisqualificationCodeType::DSQ_FALSE_START_ID
    else
      @disqualification_code_type_id = nil
    end
    # Get the actual result time:
    if ( @result_token =~ /(?<mins>\d{1,2})(\'|\s)(?<secs>\d{1,2})(\"|\s)(?<hds>\d{1,2})/ui ).nil?
      @mins_secs_hds_array = [0, 0, 0]
    else
      @mins_secs_hds_array = @result_token.split(/\'|\"|\s/).collect!{ |e| e.to_i }
    end
    self
  end
  #-- -------------------------------------------------------------------------
  #++
end
