

# Wrapper module for shared check methods for a subject defined such as this:
#
#    subject { V2::ContextDetector.new( dummy_wrapper.context_type_meeting_header, nil ) }
#
module V2::ContextDetectorChecksForParsing

  # Checks if the specified feed is successfully recognized after all rows have
  # been checked.
  # Assumes +subject+ is an instance of V2::ContextDetector. Raises an error otherwise.
  #
  # === Params:
  # - feed_array:
  #   list of all the text lines to be parsed in order.
  #
  # - prev_context_name:
  #   name of the previously recognized contex. Defaults to +nil+.
  #
  def check_for_parsing_ok( feed_array, prev_context_name = nil )
    check_for_parsing( true, feed_array, 0, prev_context_name )
  end

  # Checks if the specified feed fails to be recognized after all rows have
  # been checked.
  # Assumes +subject+ is an instance of V2::ContextDetector. Raises an error otherwise.
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
    check_for_parsing( false, feed_array, fake_offset_index, prev_context_name )
  end


  # Checks if the specified feed fails or succeeds to be recognized after the minimum
  # amount of rows specified in the context definition have been checked out.
  #
  # Note that this implementation is a more strict version of the actual algorithm
  # used by the context detector and assumes that the feed of lines starts with the
  # *actual* first line used in the recognition buffer.
  # That is, the recognition loop will stop after the minimum required number of lines
  # has been fed-in, even though the actual feed is several lines longer.
  #
  # Assumes +subject+ is an instance of V2::ContextDetector. Raises an error otherwise.
  #
  # === Params:
  # - is_ok:
  #   +true+ if the context shold be recognized, +false+ otherwise.
  #
  # - feed_array:
  #   list of all the text lines to be parsed in order.
  #
  # - fake_offset_index:
  #   (fake) offset index for the current parsing. Defaults to 0.
  #
  # - prev_context_name:
  #   name of the previously recognized contex. Defaults to +nil+.
  #
  def check_for_parsing( is_ok, feed_array, fake_offset_index = 0, prev_context_name = nil )
    raise ArgumentError.new("subject must be an instance of V2::ContextDetector!") unless subject.instance_of?( V2::ContextDetector )
    subject.clear
    is_recognized = is_ok
    # Retrieve the total minimum number of conditions to be checked before the result can
    # safely be detected as 'recognized' (or not).
    after_n_feeds = subject.context_type.condition_array.size
    feed_array[ 0 .. after_n_feeds-1 ].each_with_index do | feed_line, line_idx |
      is_recognized = subject.feed_and_detect( feed_line, fake_offset_index + line_idx, prev_context_name )
# DEBUG
      puts " #{fake_offset_index + line_idx}: #{is_recognized}"
    end
    expect( is_recognized ).to eq( is_ok )
  end
  #-- -------------------------------------------------------------------------
  #++
end
