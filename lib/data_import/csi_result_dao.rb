# encoding: utf-8


=begin

= CsiResultDAO

  - Goggles framework vers.:  4.00.757
  - author: Steve A.

 DAO class containing the extracted from the data files from C.S.I. results or entry
 lists.

=end
class CsiResultDAO
  # Text code contained in the result datafile if the swimmer has been disqualified
  DSQ_RAW_CODE = '999997'

  # Text code contained in the result datafile if the swimmer has retired himself from the event (hasn't shown up at call)
  RET_RAW_CODE = '999996'

  # Text code contained in the result datafile if the swimmer has subscribed himself without specifying any entry time
  ENTRY_NOTIME_RAW_CODE = '999998'

  # Text code contained in the result datafile if the result is missing
  RESULT_NOTIME_RAW_CODE = '999999'

  # Translation hash for the combined category_code supplied by the datafile: category_types.code
  # (@ category_code[last_position-2])
  CATEGORY_TYPE_CODES = {
    '1' => 'SEN',
    '2' => 'M20',
    '3' => 'M25',
    '4' => 'M30',
    '5' => 'M35',
    '6' => 'M40',
    '7' => 'M45',
    '8' => 'M50',
    '9' => 'OVER'
  }

  # Translation hash for the combined category_code supplied by the datafile: stroke_types.code
  # (@ category_code[last_position-1])
  STROKE_TYPE_CODES = {
    '1' => 'FA',
    '2' => 'DO',
    '3' => 'RA',
    '4' => 'SL',
    '5' => 'MI'
  }

  # Translation hash for the combined category_code supplied by the datafile: length_in_meters
  # (@ category_code[last_position])
  LENGTH_TYPE_CODES = {
    '1' => 25,
    '2' => 50,
    '3' => 100,
    '4' => 200,
    '5' => 400,
    '6' => 800,
    '7' => 1500
  }

  # These must be initialized on creation:
  attr_reader :complete_name, :year_of_birth, :team_name, :result_timing, :entry_timing,
              :rank, :badge_code, :total_events, :category_code, :combined_key,
              :entry_order,
              # These will be computed from the above fields:
              :is_disqualified, :is_retired, :is_entry_no_time, :is_result_missing,
              :length_in_metres, :stroke_type_code, :category_type_code, :gender_type_id
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new instance.
  #
  def initialize( complete_name, year_of_birth, team_name, result_timing, entry_timing,
                  rank, badge_code, total_events, category_code, combined_key,
                  entry_order )
    @complete_name    = complete_name
    @year_of_birth    = year_of_birth
    @team_name        = team_name
    @badge_code       = badge_code
    @total_events     = total_events
    @category_code    = category_code
    @combined_key     = combined_key
    @entry_order      = entry_order
    @entry_timing     = '0'
    @result_timing    = '0'
    @rank             = '0'
    @is_disqualified  = false
    @is_retired       = false
    @is_entry_no_time = false
    @is_result_missing= false
                                                    # Handle special codes:
    case result_timing
    when DSQ_RAW_CODE
      @is_disqualified = true
    when RET_RAW_CODE
      @is_retired = true
    when RESULT_NOTIME_RAW_CODE
      @is_result_missing = true
    else
      @result_timing = result_timing
      @rank = rank
    end

    case entry_timing
    when ENTRY_NOTIME_RAW_CODE
      @is_entry_no_time = true
    else
      @entry_timing = entry_timing
    end
                                                    # Divide the combined fields:
    combo_category_size = @category_code.size
    @length_in_metres   = LENGTH_TYPE_CODES[ @category_code[combo_category_size-1] ]
    @stroke_type_code   = STROKE_TYPE_CODES[ @category_code[combo_category_size-2] ]
    @category_type_code = CATEGORY_TYPE_CODES[ @category_code[combo_category_size-3] ]
    @gender_type_id     = combo_category_size > 3 ? GenderType::MALE_ID : GenderType::FEMALE_ID
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the event_types.code for the current instance.
  def event_types_code
    @event_types_code ||= "#{@length_in_metres}#{@stroke_type_code}"
  end

  # Returns the result timing in "standard" string format (mm'ss"hds).
  # Returns an empty string for zero results.
  def decorated_result_time
    @decorated_result_time ||= decorate_timing( @result_timing )
  end

  # Returns the entry timing in "standard" string format (mm'ss"hds).
  # Returns an empty string for zero results.
  def decorated_entry_time
    @decorated_entry_time ||= decorate_timing( @entry_timing )
  end


  # Returns a corresponding value in the internal format for the "combo category code",
  # which represents stroke, category and length types all in one string.
  def CsiResultDAO.get_combo_category_code( length_in_meters, stroke_type_code, category_type_code,
                                            is_male = false )
    ( is_male ? '1' : '' ) +
    CsiResultDAO::CATEGORY_TYPE_CODES.key( category_type_code ) +
    CsiResultDAO::STROKE_TYPE_CODES.key( stroke_type_code ) +
    CsiResultDAO::LENGTH_TYPE_CODES.key( length_in_meters )
  end


  # Displays the current instance as a String.
  def to_s
    "[CsiResultDAO: '#{@complete_name}' (#{@year_of_birth}, g:#{@gender_type_id})=> '#{@team_name}' b:#{@badge_code}]: " <<
    "event: #{event_types_code}, cat. #{@category_type_code}, rank: #{@rank}) " <<
    "#{decorated_result_time} (entry: #{decorated_entry_time})" <<
    (@is_disqualified ? ' DSQ' : '') << (@is_retired ? ' RET' : '')
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Decorates the specified timing string, assuming it is in "condensed format" (MMSSHH)
  # Supports any kind of timing (from reaction times to entry times).
  #
  def decorate_timing( condensed_timing )
    return '' if condensed_timing == '0'
    case condensed_timing.size
    when 1..2
      "00\'00\"%02d" % condensed_timing.to_i
    when 3
      ("00\'%02d\"" % condensed_timing[0].to_i) +
      ("%02d"       % condensed_timing[1..2].to_i)
    when 4
      ("00\'%02d\"" % condensed_timing[0..1].to_i) +
      ("%02d"       % condensed_timing[2..3].to_i)
    when 5
      ("%02d\'" % condensed_timing[0].to_i) +
      ("%02d\"" % condensed_timing[1..2].to_i) +
      ("%02d"   % condensed_timing[3..4].to_i)
    when 6
      ("%02d\'" % condensed_timing[0..1].to_i) +
      ("%02d\"" % condensed_timing[2..3].to_i) +
      ("%02d"   % condensed_timing[4..5].to_i)
    else                                            # Any other unsupported format:
      condensed_timing
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
