# encoding: utf-8

=begin

= RecordCollector
  - Goggles framework vers.:  4.00.339.20140708
  - author: Steve A.

 Collector strategy class for individual records stored into a newly created
 RecordCollection instance.

 Records are collected according to the filtering parameters set using the
 constructor.

=end
class RecordCollector

  # Creates a new instance while setting the filtering parameters for the records
  # selection.
  def initialize( swimmer = nil, team = nil, season = nil, meeting = nil )
    @collection = RecordCollection.new()
    @swimmer = swimmer
    @team = team
    @season = season
    @meeting = meeting
  end
  #-- --------------------------------------------------------------------------
  #++

  # Returns the internal RecordCollection instance updated with the records collected using
  # the specified parameters.
  #
  def collect_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
# DEBUG
    puts "\r\n---[ RecordCollector#collect('#{pool_type_code}', '#{event_type_code}', '#{category_type_code}', '#{gender_type_code}') ]---"
#######################################################
    # TODO / FIXME

    mir = MeetingIndividualResult.is_valid
      .has_rank(1).joins( :pool_type, :event_type, :category_type, :gender_type )
      .where(
      [
        '(pool_types.code = ?) AND (event_types.code = ?) AND ' +
        '(category_types.code = ?) AND (gender_types.code = ?)',
        pool_type_code, event_type_code, category_type_code, gender_type_code
      ]
    )
    mir = mir.where( ['swimmer_id = ?', @swimmer.id] ) if @swimmer
    mir = mir.where( ['team_id = ?', @team.id]) if @team
    mir = mir.joins( :meeting ).where( ['meetings.id = ?', @meeting.id]) if @meeting
                                                    # Store these max first ranking results:
    first_recs = mir.order( :minutes, :seconds, :hundreds ).limit(3)
# DEBUG
    puts "- first_recs.size = #{first_recs.size}"

    if first_recs.size > 0                          # Compute the first timing result value
      first_timing_value = first_recs.first.minutes*6000 + first_recs.first.seconds*100 + first_recs.first.hundreds
# DEBUG
      puts "- first_timing_value = #{first_timing_value}"
      puts "- first_recs.first => #{first_recs.first.get_swimmer_name}, #{first_recs.first.get_meeting_program_verbose_name}\r\n"
                                                    # Remove from the result all other rows that have a greater timing result (keep same ranking results)
      first_recs.reject!{ |row| first_timing_value < (row.minutes*6000 + row.seconds*100 + row.hundreds) }
    end
    first_recs.each { |rec| @collection << rec }
    @collection
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  #-- -------------------------------------------------------------------------
  #++
end
