# encoding: utf-8

=begin

= TokenExtractor

  - Goggles framework vers.:  4.00.469
  - author: Steve A.

 Service class to store tokenizing expressions/conditions or absolute indexes
 to retrieve the values (tokens) associated to a single field name.


=== Members:

 - <tt>starting_with</tt> and <tt>ending_with</tt> may store either
   Regexp or Fixnum instances.

 - <tt>line_timeout</tt> is an accessory member that may be used by the
   parsers to store a maximum line number associated to the instance,
   after which the result from tokenize will always be negative (empty string)
   if the additional parameter current_line_number is also used.

=end
class TokenExtractor

  attr_accessor :field_name, :starting_with, :ending_with, :line_timeout

  # Creates a new instance
  def initialize( field_name, starting_with, ending_with, line_timeout = 0 )
    @field_name     = field_name
    @starting_with  = starting_with
    @ending_with    = ending_with
    @line_timeout   = line_timeout
    @computed_start = nil                           # Cache for computed values (sadly, only non-nil results are cached)
    @computed_end   = nil
  end
  #-- -------------------------------------------------------------------------
  #++

  # Clears the cached results. This method is useful only if the same TokenExtractor
  # instance is used to tokenize different source texts.
  #
  def clear()
    @computed_start = nil
    @computed_end   = nil
  end

  # Returns the starting index of the token inside the specified text; nil if not found
  def get_start_index( text )
    return @computed_start unless @computed_start.nil?
    if starting_with.kind_of?( Regexp )
#      matchdata = starting_with.match( text )
#      if matchdata && matchdata.captures.size > 0
#        @computed_start = matchdata.begin(0)
#        @computed_end   = @computed_start + matchdata.captures.first.size
#      else
        @computed_start = ( text =~ starting_with )
#      end
    elsif starting_with.kind_of?( Fixnum )
      @computed_start = starting_with
    else
      @computed_start = nil
    end
  end

  # Returns the ending index of the token inside the specified text; nil if not found
  def get_end_index( text )
    return @computed_end unless @computed_end.nil?
    if ending_with.kind_of?( Regexp )
      @computed_end = ( (text =~ ending_with) || text.size )
    elsif ending_with.kind_of?( Fixnum ) && (start_idx = get_start_index( text ))
      @computed_end = start_idx + ending_with
    else
      @computed_end = nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the token specified by the conditions defined with this
  # instance, or an empty string if no starting point was found.
  #
  # Provided current_line_number is given and line_timeout
  # was used in the constructor, if the current_line_number
  # is greater than line_timeout, the result will always be an
  # empty string.
  #
  def tokenize( text, current_line_number = 0 )
    return '' if (@line_timeout > 0) && (current_line_number > @line_timeout)
    token = ''
    sidx = get_start_index( text )
    if ( sidx && (text.size >= sidx.to_i) )
      eidx = get_end_index( text )
      token = ( text[ sidx .. eidx ] ).strip if eidx
    end
# DEBUG
#    puts "-- after tokenize:  " << (@computed_start ? "cached: (#{@computed_start}.." : 'cached: (nil..') << (@computed_end ? "#{@computed_end})" : 'nil)')
    token
  end

  # Converts the current instance to a readable string
  def to_s
    "[TokenExtractor: #{@field_name}, start=#{@starting_with}, end=#{@ending_with}, timeout:#{@line_timeout}]" +
    (@computed_start ? " cached: (#{@computed_start}.." : ' cached: (nil..') +
    (@computed_end ? "#{@computed_end})" : 'nil)')
  end
  #-- -------------------------------------------------------------------------
  #++
end
