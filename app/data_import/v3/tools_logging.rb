# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/framework/string_logger'


=begin

= Tools/Utilities module

  - version:  4.00.825
  - author:   Steve A.

  Generic collection of utilities for the data-import section.

=end
module Tools
  # Wrapper for any Logging tool
  module Logging::V3

    # Defines a text holder for the process log messages.
    #
    def process_log
      @process_log ||= ""
    end
    #-- -----------------------------------------------------------------------
    #++

    # Either uses the specified logger instance (if available) or outputs the message
    # directly on the console using +puts+.
    #
    # <tt>condition_for_logging</tt> is checked before allowing any logging.
    #
    # Note that this method simply outputs to a pre-defined (external) Logger instance,
    # without capturing any output.
    # To log & capture the output simultaneously on the dedicated +process_log+
    # member, use the #update_process_logs method instead.
    #
    # This method is typically best used for debug output, where checking a condition
    # is useful before logging.
    #
    def log( msg, condition_for_logging, logging_method_sym = :debug )
      return unless condition_for_logging
      if defined?(logger) &&
         ( logger.instance_of?(StringLogger) || logger.respond_to?(logging_method_sym) )
        logger.send( logging_method_sym, msg.to_s )
      else
        puts( msg.to_s )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    # Stores unconditionally the text +msg+ into the +process_log+ and +logger+
    # members, only if they are defined.
    #
    def update_process_logs( msg, logging_method_sym = :info )
      log( msg.to_s, true, logging_method_sym )
      if defined?(process_log) && process_log.respond_to?( :<< )
        process_log << (msg.to_s + "\r\n")
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
end
