# encoding: utf-8

=begin

= RecordCollector
  - Goggles framework vers.:  4.00.357.20140717
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
  # === Initialization options:
  # - list: an object responding to :each, containing a list of row instances to
  #         be added to the internal collection during initialization.
  #         (These will be converted to IndividualRecord(s) and indexed by their values)
  #
  # === Supported filtering options:
  # When provided, any of these options are combined together and will be used
  # to filter out the results during the collection loops.
  #
  # - swimmer: a Swimmer instance
  # - team: a Team instance (mutually exclusive filter with federation_type)
  # - federation_type: a FederationType instance (mutually exclusive filter with team, takes precedence over team)
  # - meeting: a Meeting instance (this filter is ignored when looping on IndividualRecords)
  #
  def initialize( options = {} )
    list_of_rows     = options[:list].respond_to?(:each) ? options[:list] : nil
    @collection = RecordCollection.new( list_of_rows )
    # Options safety check:
    @swimmer         = options[:swimmer] if options[:swimmer].instance_of?( Swimmer )
    @team            = options[:team] if options[:team].instance_of?( Team )
    @federation_type = options[:federation_type] if options[:federation_type].instance_of?( FederationType )
    @meeting         = options[:meeting] if options[:meeting].instance_of?( Meeting )
    # Set precedence on filter values:
    @team = nil if @federation_type
    # Cache the unique codes lists:
    @pool_type_codes     = PoolType.select(:code).uniq.map{ |row| row.code }.delete_if{ |e| e == '33' }
    @event_type_codes    = EventType.are_not_relays.select(:code).uniq.map{ |row| row.code }
    @category_type_codes = CategoryType.is_valid.are_not_relays.select(:code).uniq.map{|row| row.code }
    @gender_type_codes   = GenderType.select(:code).uniq.map{ |row| row.code }.delete_if{ |e| e == 'X' }
  end
  #-- --------------------------------------------------------------------------
  #++

  # Getter for the internal list.
  def collection
    @collection
  end

  # Getter for the internal list #count method.
  def count
    @collection.count
  end

  # Clears the internal list of records.
  def clear
    @collection.clear
  end

  # Shortcut for #commit(false).
  # Saves/persists the internal list of records into the database as #commit, but
  # without clearing the list when the save is performed successfully.
  #
  # Returns true on no errors during serialization.
  #
  def save
    commit( false )
  end

  # Saves/persists the internal list of records into the database while removing
  # them from the list when successful.
  #
  # Returns true on no errors during serialization.
  # (The list should be empty afterwards when <tt>remove_from_list</tt> = true.)
  #
  def commit( remove_from_list = true )
    persisted_ok = 0
    @collection.each do |key, row|
      existing_record = nil
      is_team_record = false
      is_ok = false
      if @team                                      # Team-filtered collection?
        is_team_record = true
        existing_record = IndividualRecord.where(
          pool_type_id:     row.pool_type_id,
          event_type_id:    row.event_type_id,
          category_type_id: row.category_type_id,
          gender_type_id:   row.gender_type_id,
          team_id:          row.team_id,
          is_team_record:   true
        ).first
      else                                          # (Assuming it is a) FederationType-filtered collection:
        existing_record = IndividualRecord.where(
          pool_type_id:       row.pool_type_id,
          event_type_id:      row.event_type_id,
          category_type_id:   row.category_type_id,
          gender_type_id:     row.gender_type_id,
          federation_type_id: row.federation_type_id,
          is_team_record:     is_team_record
        ).first
      end
                                                    # Persist row:
      if existing_record
        is_ok = existing_record.update_attributes(
          minutes: row.minutes,
          seconds: row.seconds,
          hundreds: row.hundreds,
          swimmer_id: row.swimmer_id,
          team_id: row.team_id,
          season_id: row.season_id,
          federation_type_id: row.federation_type_id,
          meeting_individual_result_id: row.meeting_individual_result_id,
          is_team_record: is_team_record
        )
      else
        row.is_team_record = is_team_record
        is_ok = row.save
      end
      persisted_ok += 1 if is_ok
      @collection.delete_with_key(key) if remove_from_list && is_ok
    end
    remove_from_list ? (@collection.count == 0) : (@collection.count == persisted_ok) 
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
    mir = mir.joins( :federation_type ).where( ['federation_types.id = ?', @federation_type.id]) if @federation_type
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
    ir = ir.where( swimmer_id: @swimmer.id ) if @swimmer
    ir = ir.team_records.where( team_id: @team.id ) if @team
    ir = ir.federation_records.where( federation_type_id: @federation_type.id ) if @federation_type
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
    first_recs.each { |rec| @collection << rec }    # Add the first records to the collection
    @collection
  end
  #-- -------------------------------------------------------------------------
  #++
end
