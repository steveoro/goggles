# encoding: utf-8

require 'fileutils'
require 'common/format'


=begin

= MeetingDateParser

  - Goggles framework vers.:  4.00.515
  - author: Steve A.

 Strategy class dedicated to parse Meeting dates from tokens of text.

=end
class MeetingDateParser

  # Parses a text date extracted from a Meeting result text file.
  # Locale is simply ignored as of this version.
  #
  # === Returns:
  # An array of Date instances, one for each successful parsed date.
  # Returns +nil+ ( _not_ an array of +nil+s ) otherwise.
  #
  def parse( text_token )
# DEBUG
#    puts("MeetingDateParser.parse( '#{text_token}' ) called.")
    matcher = /((?:\d{1,2}[\/\-\,\s])+)(?:([gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic]\D*|\d{1,2})[\/\-\,\s])(\d{2,4})/i
    match_data = matcher.match( text_token )
    return nil unless match_data

    days_part  = match_data.captures[0]
    month_part = match_data.captures[1]
    year_part  = match_data.captures[2]
    return nil if days_part.nil? || month_part.nil? || year_part.nil?
    resulting_dates = []
                                                    # Make sure we have a numeric month:
    unless month_part =~ /\d{1,2}/i                 # Month isn't numeric? Translate it:
      month_num = ['gen','feb','mar','apr','mag','giu','lug','ago','set','ott','nov','dic'].index( month_part.downcase[0..2] ) + 1
      month_part = "%02d" % month_num.to_s
    end

    days_list = days_part.split(/[\-\,\/]/)         # Make a list of all the enclosed days
    days_list.each do |day_part|
      text_date = "#{ year_part }-#{ month_part }-#{ day_part }"
# DEBUG
#      puts("MeetingDateParser.parse(): text_date: '#{text_date}'")
      begin
        resulting_dates << Date.parse( text_date )
      rescue
        nil
      end
    end

    resulting_dates.size > 0 ? resulting_dates : nil
  end
  #-- -------------------------------------------------------------------------
  #++
end
