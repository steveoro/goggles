# encoding: utf-8

require 'fileutils'
require 'common/format'
require_relative '../../../data_import/v2/dao/csi_result_dao'


=begin

= V2::ResultTimeParser

  - Goggles framework vers.:  4.00.793
  - author: Steve A.

 Strategy class dedicated to extracting required Meeting result fields
 from single text tokens extracted from meeting result files.

=end
class V2::ResultTimeParser

  attr_reader :disqualification_code_type_id, :mins_secs_hds_array
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  # === Params:
  # - rank_token: the text token referring to the ranking position of the result
  # - result_time_token: the text token referring to the actual result timing
  # - result_dao: (default +nil+), a full DAO object storing the whole result row;
  #               when present, it may override the rank parameter with its value.
  #
  def initialize( rank_token, result_time_token, result_dao = nil )
    if result_dao
      raise ArgumentError.new(
        "Unrecognized type for result_dao parameter"
      ) unless result_dao.instance_of?( CsiResultDAO )
      @result_dao   = result_dao
      @rank_token   = result_dao.rank
      @result_token = result_time_token
    else
      @result_dao   = nil
      @rank_token   = rank_token
      @result_token = result_time_token
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns +true+ if the Rank text token specified in the constructor contains the
  # "out of race" code. +false+ otherwise.
  #
  def is_out_of_race?
    if @result_dao
      false # no out-of-race information inside CSI result DAO!
    else
      ! ( @rank_token =~ /Fuori gara|fg|F\.G\./i ).nil?
    end
  end

  # Returns +true+ if the text token specified in the constructor contains the
  # "disqualified" code. +false+ otherwise.
  # This will return +true+ also for a "withdrawal" result code.
  #
  def is_disqualified?
    if @result_dao
      @result_dao.is_disqualified || @result_dao.is_retired
    else
      ! ( @result_token =~ /Ritir|Squal/i ).nil?
    end
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
    if @result_dao
      if @result_dao.is_retired
        @disqualification_code_type_id = DisqualificationCodeType::DSQ_RETIRED_ID
      elsif @result_dao.is_disqualified
        @disqualification_code_type_id = DisqualificationCodeType::DSQ_FALSE_START_ID
      else
        @disqualification_code_type_id = nil
      end
    else
      if @result_token =~ /Ritir/i
        @disqualification_code_type_id = DisqualificationCodeType::DSQ_RETIRED_ID
      elsif @result_token =~ /Squal/i
        @disqualification_code_type_id = DisqualificationCodeType::DSQ_FALSE_START_ID
      else
        @disqualification_code_type_id = nil
      end
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
