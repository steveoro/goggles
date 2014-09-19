
=begin

= Tools/Utilities module

  - version:  4.00.505
  - author:   Steve A.

  Generic collection of utilities for the data-import section.

=end
module Tools
  # Wrapper for any Logging tool
  module Logging

    # Either uses the specified logger instance (if available) or outputs the message
    # directly on the console using +puts+.
    #
    # <tt>condition_for_logging</tt> is checked before allowing any logging.
    #
    def log_somehow( logger, msg, condition_for_logging, logging_method_sym = :debug )
      return unless condition_for_logging
      if logger && logger.respond_to?( logging_method_sym )
        logger.send( logging_method_sym, msg )
      else
        puts( msg )
      end
    end
    #-- --------------------------------------------------------------------------
    #++
  end
end
