# encoding: utf-8

# Utility class to store tokenizing expressions/conditions or absolute indexes
# to retrieve the values (tokens) associated to a single field name.
#
# <tt>starting_with</tt> and <tt>ending_with</tt> may store either
# Regexp or Fixnum instances.
#
class TokenExtractor
  attr_accessor :field_name, :starting_with, :ending_with

  # Creates a new instance
  def initialize( field_name, starting_with, ending_with )
    self.field_name = field_name
    self.starting_with = starting_with
    self.ending_with = ending_with
    @computed_start = nil                           # Cache for computed values (sadly, only non-nil results are cached)
    @computed_end   = nil
  end


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
      @computed_start = ( text =~ starting_with )
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


  # Returns the token specified by the conditions defined with this instance, or an empty
  # string if no starting point was found
  def tokenize( text )
    token = ''
    sidx = get_start_index( text )
    if ( sidx && (text.size >= sidx.to_i) )
      eidx = get_end_index( text )
      token = ( text[ sidx .. eidx ] ).strip if eidx
    end
    token
  end


  # Converts the current instance to a readable string
  def to_s
    "[TokenExtractor: #{field_name}, start=#{starting_with}, end=#{ending_with}]" +
    (@computed_start ? " => [#{@computed_start}.." : ' => [nil..') +
    (@computed_end ? "#{@computed_end}]" : 'nil]')
  end
end
