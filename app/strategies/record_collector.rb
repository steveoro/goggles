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
#    puts "\r\n---[ RecordCollector#collect_for('#{pool_type_code}', '#{event_type_code}', '#{category_type_code}', '#{gender_type_code}') ]---"

    mir = MeetingIndividualResult.is_valid
      .has_rank(1).joins( :pool_type, :event_type, :category_type, :gender_type )
      .where(
      [
        '(pool_types.code = ?) AND (event_types.code = ?) AND ' +
        '(category_types.code = ?) AND (gender_types.code = ?) AND ' +
        '(minutes * 6000 + seconds*100 + hundreds > 0)', # (avoid null times)
        pool_type_code, event_type_code, category_type_code, gender_type_code
      ]
    )
    mir = mir.where( ['swimmer_id = ?', @swimmer.id] ) if @swimmer
    mir = mir.where( ['team_id = ?', @team.id]) if @team
    mir = mir.joins( :meeting ).where( ['meetings.id = ?', @meeting.id]) if @meeting
                                                    # Store these max first ranking results:
    first_recs = mir.order( :minutes, :seconds, :hundreds ).limit(3)
# DEBUG
#    puts "Initial first_recs.size: #{first_recs.size}"

    if first_recs.size > 0                          # Compute the first timing result value
      first_timing_value = first_recs.first.minutes*6000 + first_recs.first.seconds*100 + first_recs.first.hundreds
                                                    # Remove from the result all other rows that have a greater timing result (keep same ranking results)
      first_recs.reject!{ |row| first_timing_value < (row.minutes*6000 + row.seconds*100 + row.hundreds) }
    end
# DEBUG
#    first_recs.each do |row|
#      puts "- ID:#{row.id} => #{row.get_full_name}\r\n"
#    end
    first_recs.each { |rec| @collection << rec }
    @collection
  end
  #-- -------------------------------------------------------------------------
  #++


  # Performs a full scan of all the combinations of PoolType(s), EventType(s),
  # CategoryType(s) & GenderType(s) while filling the internal record collection
  # for each possible combinatory tuple.
  #
  # This will yield a RecordCollection instance filled with all the best results
  # available for each particular combination of parameters.
  #
  def full_scan()
    pool_type_codes     = PoolType.select(:code).uniq.map{ |row| row.code }
    event_type_codes    = EventType.are_not_relays.select(:code).uniq.map{ |row| row.code }
    category_type_codes = CategoryType.is_valid.are_not_relays.select(:code).uniq.map{|row| row.code }
    gender_type_codes   = GenderType.select(:code).uniq.map{ |row| row.code }

    pool_type_codes.each do |pool_type_code|
      event_type_codes.each do |event_type_code|
        category_type_codes.each do |category_type_code|
          gender_type_codes.each do |gender_type_code|
            collect_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
          end
        end
      end
    end
    @collection
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  #-- -------------------------------------------------------------------------
  #++
end
