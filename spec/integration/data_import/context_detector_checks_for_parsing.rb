

# Wrapper module for shared check methods for a subject defined such as this:
#
#    subject { ContextDetector.new( dummy_wrapper.context_type_meeting_header, nil ) }
#
module ContextDetectorChecksForParsing

  # Checks if the specified feed is successfully recognized after all rows have
  # been checked.
  #
  # Assumes +subject+ is an instance of ContextDetector. Raises an error otherwise.
  #
  # === Params:
  # - feed_array:
  #   list of all the text lines to be parsed in order.
  #
  # - prev_context_name:
  #   name of the previously recognized contex. Defaults to +nil+.
  #
  def check_for_parsing_ok( feed_array, prev_context_name = nil )
    raise ArgumentError.new("subject must be an instance of ContextDetector!") unless subject.instance_of?( ContextDetector )
    subject.clear
    is_recognized = false
    # Retrieve the total number of conditions to be checked before the result can
    # safely be detected as 'recognized'.
    after_n_feeds = subject.context_type.condition_array.size
    index = 1
    feed_array[ 0 .. feed_array.size-1 ].each_with_index do | feed_line, line_idx |
      is_recognized = subject.feed_and_detect( feed_line, line_idx, prev_context_name )
      index = line_idx + 1
      break if is_recognized && (index >= after_n_feeds)
    end
    expect( is_recognized ).to be true
    expect( index ).to be >= after_n_feeds
  end

  # Checks if the specified feed fails to be recognized after all rows have
  # been checked.
  #
  # Assumes +subject+ is an instance of ContextDetector. Raises an error otherwise.
  #
  # === Params:
  # - feed_array:
  #   list of all the text lines to be parsed in order.
  #
  # - fake_offset_index:
  #   (fake) offset index for the current parsing. Defaults to 0.
  #
  # - prev_context_name:
  #   name of the previously recognized contex. Defaults to +nil+.
  #
  def check_for_parsing_fail( feed_array, fake_offset_index = 0, prev_context_name = nil )
    raise ArgumentError.new("subject must be an instance of ContextDetector!") unless subject.instance_of?( ContextDetector )
    subject.clear
    feed_array[ 0 .. feed_array.size-1 ].each_with_index do | feed_line, line_idx |
      expect( subject.feed_and_detect( feed_line, fake_offset_index + line_idx, prev_context_name ) ).to be false
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
