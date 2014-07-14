# encoding: utf-8

=begin

= RecordCollector
  - Goggles framework vers.:  4.00.347.20140711
  - author: Steve A.

 Collector strategy class for individual records stored into a newly created
 RecordCollection instance.

 Records are collected according to the filtering parameters set using the
 constructor.

=end
class RecordCollector

  # Creates a new instance while setting the filtering parameters for the records
  # selection.
  #
  # === Supported filtering options:
  #
  # When provided, any of these options are combined together and will be used
  # to filter out the results during the collection loops.
  #
  # - swimmer: a Swimmer instance
  # - team a Team instance
  # - federation_type: a FederationType instance
  # - meeting: a Meeting instance (this filter is ignored when looping on IndividualRecords)
  #
  def initialize( options = {} )
    @collection = RecordCollection.new()
    # Options safety check:
    @swimmer         = options[:swimmer] if options[:swimmer].instance_of?( Swimmer )
    @team            = options[:team] if options[:team].instance_of?( Team )
    @federation_type = options[:federation_type] if options[:federation_type].instance_of?( FederationType )
    @meeting         = options[:meeting] if options[:meeting].instance_of?( Meeting )
    # Cache the codes lists:
    @pool_type_codes     = PoolType.select(:code).uniq.map{ |row| row.code }.delete_if{ |e| e == '33' }
    @event_type_codes    = EventType.are_not_relays.select(:code).uniq.map{ |row| row.code }
    @category_type_codes = CategoryType.is_valid.are_not_relays.select(:code).uniq.map{|row| row.code }
    @gender_type_codes   = GenderType.select(:code).uniq.map{ |row| row.code }.delete_if{ |e| e == 'X' }
  end
  #-- --------------------------------------------------------------------------
  #++

  # Getter for the internal list #count method.
  def count()
    @collection.count()
  end

  # Clears the internal list of records.
  def clear()
    @collection.clear()
  end

  # Saves the internal list of records into the database without clearing the list.
  #
  def save()
    @collection.each { |key, row| row.save }
  end

  # Saves the internal list of records into the database while removing them from
  # the list when successful.
  # Returns true on no errors during serialization.
  #
  def commit()
    @collection.each do |key, row|
      @collection.delete_with_key(key) if row.save
    end
    ( @collection.count == 0 )
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns the internal RecordCollection instance updated with the records collected using
  # the specified parameters.
  #
  # This method works by scanning existing MeetingIndividualResult(s) on DB.
  #
  def collect_from_results_having( pool_type_code, event_type_code, category_type_code, gender_type_code )
# DEBUG
#    puts "\r\n---[ RecordCollector#collect_from_results_having('#{pool_type_code}', '#{event_type_code}', '#{category_type_code}', '#{gender_type_code}') ]---"
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
    update_and_return_collection_with_first_results( mir )
  end


  # Returns the internal RecordCollection instance updated with the records collected using
  # the specified parameters.
  #
  # This method works by scanning existing IndividualRecord(s) on DB.
  #
  def collect_from_records_having( pool_type_code, event_type_code, category_type_code, gender_type_code )
    ir = IndividualRecord
      .joins( :pool_type, :event_type, :category_type, :gender_type )
      .where(
      [
        '(pool_types.code = ?) AND (event_types.code = ?) AND ' +
        '(category_types.code = ?) AND (gender_types.code = ?) AND ' +
        '(minutes * 6000 + seconds*100 + hundreds > 0)', # (avoid null times)
        pool_type_code, event_type_code, category_type_code, gender_type_code
      ]
    )
    ir = ir.where( ['swimmer_id = ?', @swimmer.id] ) if @swimmer
    ir = ir.where( ['team_id = ?', @team.id]) if @team
    ir = ir.where( ['federation_type_id = ?', @federation_type.id] ) if @federation_type
    update_and_return_collection_with_first_results( ir )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the list of allowed PoolType codes
  def pool_type_code_list
    @pool_type_codes
  end

  # Returns the list of allowed EventType codes
  def event_type_codes_list
    @event_type_codes
  end

  # Returns the list of allowed CategoryType codes
  def category_type_codes_list
    @category_type_codes
  end

  # Returns the list of allowed GenderType codes
  def gender_type_codes_list
    @gender_type_codes
  end


  # Executes the block while passing iteratively self plus all the codes combinations
  # of PoolType(s), EventType(s), CategoryType(s) & GenderType(s) as parameters
  # for the block -- which must have the same signature as #collect_from_records_having()
  # or #collect_from_results_having().
  #
  # This allows to loop on either one of the above methods while filling the internal
  # record collection for each possible combinatory tuple.
  #
  # This will yield a RecordCollection instance filled with all the best results
  # available for each particular combination of filtering parameters specified
  # in the constructor. As in:
  #
  #     collector.full_scan() do |this, pool_code, event_code, category_code, gender_code|
  #       this.collect_from_records_having( pool_code, event_code, category_code, gender_code )
  #     end
  #
  # ...Or:...
  #
  #     collector.full_scan() do |this, pool_code, event_code, category_code, gender_code|
  #       this.collect_from_results_having( pool_code, event_code, category_code, gender_code )
  #     end
  #
  # Please, be aware that an unfiltered full scan using #collect_from_results_having
  # may take several minutes to complete (depending on Server speed & power).
  #
  # While the latter method is painstakingly slow, it can be used to fill the entries into
  # the individual_records table. These can be later retrieved and stored on another
  # RecordCollection with the former method.
  #
  def full_scan( &block )
    @pool_type_codes.each do |pool_type_code|
      @event_type_codes.each do |event_type_code|
        @category_type_codes.each do |category_type_code|
          @gender_type_codes.each do |gender_type_code|
            yield( self, pool_type_code, event_type_code, category_type_code, gender_type_code ) if block_given?
          end
        end
      end
    end
    @collection
  end
  #-- -------------------------------------------------------------------------
  #++


  # Interface implementation for DelayedJob.
  # Performs a batch, full scan of MeetingIndividualResult, while
  # iterating on each Federation and then on each Team.
  #
  # The collected records are either "team records" (when filtered
  # by the current Team in the loop) or "feration records" (when
  # filtered upon the current FederationType in the loop).
  #
  # The results serialized after each #full_scan invocation (upon
  # each iteration of one of the two loops).
  #
  def perform
    
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns the internal collection after having added the first +limit+ results
  # among the ones specified.
  #
  # <tt>prefiltered_results</tt> is a Relation of either IndividualRecord or
  # MeetingIndividualResult instances.
  #
  def update_and_return_collection_with_first_results( prefiltered_results, limit = 3 )
    # Store these max first ranking results:
    first_recs = prefiltered_results.order( :minutes, :seconds, :hundreds ).limit(limit)
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
end
