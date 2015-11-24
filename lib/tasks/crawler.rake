# encoding: utf-8
require 'date'
require 'rubygems'
require 'fileutils'
require 'mechanize'
require 'rest_client'

require 'framework/console_logger'


=begin

= Web-Crawling Helper tasks

  - Goggles framework vers.:  4.00.839
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end

LOCALCOPY_DIR = File.join("#{Dir.pwd}.docs", 'meeting_data', 'FIN_crawled')
LOG_DIR       = File.join( Dir.pwd, 'log' ) unless defined? LOG_DIR
SEARCH_URL    = 'http://google.com/'
# -----------------------------------------------------------------------------


namespace :crawler do

  # Performs a query directly on the specified URL page and returns
  # an Array of Mechanize::Page::Link instances or an emtpy one in case of error or no results.
  #
  # == Params:
  #
  # - dump_forms: allows to dump all forms and field names found on the page, skipping the actual search
  # - form_name: form name to be used (assuming a form with this name will be found at the specified URL)
  # - query_field: query field name to be used (assuming a field name will be found at the specified URL)
  #
  def get_search_link_results( search_url, search_text, dump_forms = false,
                        form_name = 'gbqf', query_field = 'q' )
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    result_links = []

    a.get( search_url ) do |page|
      if dump_forms                                   # - Just dump the names:
        page.forms.each do |form|                     # Scan for forms and fields and dump their names if requested
          puts "> forms found:"
          puts "  '#{form.name}' with fields:"        # For Google: 'gbqf' => google basic query form @2014
          form.fields.each do |field|
            puts "  - '#{field.name}'"                # For Google: 'q' => query field
          end
        end
      else                                            # - Do the link search:
        search_result = page.form_with(:name => form_name) do |search|
          search.send( query_field, search_text )
        end.submit

        search_result.links.each do |link|
          unless link.href.nil? || link.href == '' || link.href == '#' ||
                 # [Steve, 20140306] This is a crude regexp for filtering out less-interesting links from the google front search page
                 (link.href =~ /google|\/search\?q\=|\/support\/websearch|youtube|blogger|\/advanced_search\?q|\/webhp\?tab|\/preferences|\/policies|\/history\/optout|javascript\:void/)
            result_links << link
            puts "- '#{link.text}':"
            puts "  #{link.href}\r\n"
            puts " "
          end
        end
      end
    end
    result_links
  end
  # -----------------------------------------------------------------------------


  desc <<-DESC
  Searches the web for result links regarding a specific text.

          *** This task uses the Mechanize library ***

  Options: text=<text_to_be_searched> [site=#{SEARCH_URL}]
           [dump_forms=<0>|1]
           [form_name='gbqf'] [query_field='q']
           [output_path=#{LOCALCOPY_DIR}]
           [log_dir=#{LOG_DIR}]

  - 'dump_forms'  => when set to a positive number it will skip the search
    and dump the list of all form and field names found on the specified URL.

  - 'site' => the search engine URL to be used, on which we are assuming there's
    a search form to be invoked.

  - 'form_name' => form name to be used (assuming a form with this name will
    be found at the specified URL).

  - 'query_field' => query field name to be used (assuming a field with this name will
    be found at the specified URL).

  - 'output_path' => the output path for storing the results. (TODO)

  - 'log_dir' => allows to override the default log dir destination. (TODO)

  DESC
  task :search do |t|
    puts "\r\n*** Crawler::search ***"
    search_url  = ENV.include?("site") ? ENV["site"] : SEARCH_URL
    search_text = ENV.include?("text") ? ENV["text"] : "\"master swimming\" meeting results"
    form_name   = ENV.include?("form_name") ? ENV["form_name"] : 'gbqf'
    query_field = ENV.include?("query_field") ? ENV["query_field"] : 'q'
    output_path = ENV.include?("output_path") ? ENV["output_path"] : LOCALCOPY_DIR
    log_dir     = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR
    dump_forms  = ENV.include?("dump_forms") && (ENV["dump_forms"].to_i > 0)
    puts "search_url:  '#{search_url}'"
    puts "search_text: '#{search_text}'"
    puts "form_name:   '#{form_name}'"
    puts "query_field: '#{query_field}'"
    puts "output_path: #{output_path}"
    puts "log_dir:     #{log_dir}"
    puts "dump_forms:  #{dump_forms}"
    puts "\r\n"

    result_list = get_search_link_results( search_url, search_text, dump_forms, form_name, query_field )
    if File.directory?( output_path )
      # TODO
      puts "\r\nResults serialization: TODO."
    else
      puts "'#{output_path}' not found: aborting results serialization..."
    end
    puts "\r\nDone."
  end
  # ---------------------------------------------------------------------------


  # Scans a web-page for links and returns an Array of Mechanize::Page::Link instances
  # or an emtpy one in case of error or no results.
  #
  # == Params:
  #
  # - match_text: only links with text matching the specified Regexp will be included,
  #   filtering out the rest. Defaults to nil to include all the links found.
  #
  def get_page_link_results( site_url, match_text = nil )
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    result_links = []

    a.get( site_url ) do |page|
      page.links.each do |link|
        if match_text.nil? || ((link.text =~ match_text) != nil)
          result_links << link
          puts "- '#{link.text}':"
          puts "  #{link.href}\r\n"
          puts " "
        end
      end
    end
    result_links
  end
  #-- -------------------------------------------------------------------------
  #++


  desc <<-DESC
  Searches a specific URL for links matching a specific Regexp text.

  Options: url=<site URL> [match=regexp string to be matched in link.text|<any link>]
           [output_path=#{LOCALCOPY_DIR}]
           [log_dir=#{LOG_DIR}]

  - 'url' => the page URL to be crawled.

  - 'match' => a text regexp to be used agains the link text-only part (not the href).

  - 'output_path' => the output path for storing the results. (TODO)

  - 'log_dir' => allows to override the default log dir destination. (TODO)

  DESC
  task :site do |t|
    puts "\r\n*** Crawler:::site ***"
    site_url    = ENV.include?("url") ? ENV["url"] : SEARCH_URL
    match_text  = ENV.include?("match") ? ENV["match"] : nil
    match_text  = Regexp.new( match_text ) unless match_text.nil?
    output_path = ENV.include?("output_path") ? ENV["output_path"] : LOCALCOPY_DIR
    log_dir     = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR
    puts "site_url:    '#{site_url}'"
    puts "match_text:  #{match_text.nil? ? '[anything]' : match_text.to_s }"
    puts "output_path: #{output_path}"
    puts "log_dir:     #{log_dir}"
    puts "\r\n"

    result_list = get_page_link_results( site_url, match_text )
    if File.directory?( output_path )
      # TODO
      puts "\r\nResults serialization: TODO."
    else
      puts "'#{output_path}' not found: aborting results serialization..."
    end
    puts "\r\nDone."
  end
  #-- -------------------------------------------------------------------------
  #++


  desc <<-DESC
  Crawls the web to retrieve currently available FIN Championship result pages,
meeting entries and manifests.

      *** This task uses the API @ kimonolabs.com + the RestClient gem ***

Options: [output_path=#{LOCALCOPY_DIR}]
         [season=<season_id>]
         [start_from=0]

  - 'output_path' the path where the files will be stored after the crawling.

  - 'season' the season ID used as extension for the output_path above; default is
    current season (which uses FIN_meetings_current as API to scrape the addresses).

  - 'start_from' allows the crawling loop to start from a different offset than 0,
    computed among all the results found from the FIN_supermasters_meetings API.


Kimono APIs used to retrieve the list of sub-pages for each year:
    1) FIN_meetings_current: (current sport year only, season 142)
       - 'https://www.kimonolabs.com/api/247amgrm?apikey=e1e82989ef91e6287ae417ede85f9ed2'
         crawls http://www.federnuoto.it/discipline/master/circuito-supermaster.html

    2) FIN_meetings_2012-2013: (season 122)
       - 'https://www.kimonolabs.com/api/8758dnce?apikey=e1e82989ef91e6287ae417ede85f9ed2'
         crawls http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2012-2013.html

    3) FIN_meetings_2013-2014: (season 132)
       - 'https://www.kimonolabs.com/api/edy8o246?apikey=e1e82989ef91e6287ae417ede85f9ed2'
         crawls http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2013-2014.html


Kimono APIs used to retrieve exact manifest dates for each manifest link found:
    4) FIN_curr_manifest_dates: (current sport year only, with on-demand parameters)
       - 'https://www.kimonolabs.com/api/ondemand/dcofgezg?apikey=e1e82989ef91e6287ae417ede85f9ed2'

         Sample crawled URL:
         - 'http://www.federnuoto.it/discipline/master/circuito-supermaster/549.html?view=manifestazione'

         Parameters to append:
          - '&kimpath4=newvalue', default: '549.html'
          - '&view=newvalue',     default: 'manifestazione'

    5) FIN_old_manifest_dates: (for all other sport years, with on-demand parameters)
       - 'https://www.kimonolabs.com/api/ondemand/6va4131o?apikey=e1e82989ef91e6287ae417ede85f9ed2'

         Sample crawled URL:
         - 'http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2013-2014/380.html?view=manifestazione'

         Parameters to append: (with on-demand parameters)
          - '&kimpath4=newvalue', default: 'stagione-2013-2014'
          - '&kimpath5=newvalue', default: '380.html'
          - '&view=newvalue',     default: 'manifestazione'

DESC
  task :kimono_get_fin_data do |t|
    puts "\r\n*** Crawler::kimono_get_fin_data ***"
    season_id   = ENV.include?("season")      ? ENV["season"].to_i : 142
    output_path = (ENV.include?("output_path") ? ENV["output_path"] : LOCALCOPY_DIR) + ".#{season_id}"
    start_from  = ENV.include?("start_from")  ? ENV["start_from"].to_i : 0
    puts "output_path:  #{output_path}"
                                                    # Create the output path, if missing:
    FileUtils.mkdir_p( output_path ) if !File.directory?( output_path )
    puts "\r\n"

    # [Steve, 20141216] Links used by the APIs below:
    #
    # Current FIN championships:
    # (1) - http://www.federnuoto.it/discipline/master/circuito-supermaster.html
    #
    # Previous FIN championships:
    # (2) - http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2013-2014.html
    # (3) - http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2012-2013.html
    #
    # To change or update the above links, edit directly the Kimono APIs.
    # (It is possible to set the FIN_supermasters_meetings API to return everything that is available
    # or just the individual rows that have changed.)
    #
    api_endpoint = case season_id
    when 142
      'https://www.kimonolabs.com/api/247amgrm?apikey=e1e82989ef91e6287ae417ede85f9ed2'
    when 132
      'https://www.kimonolabs.com/api/edy8o246?apikey=e1e82989ef91e6287ae417ede85f9ed2'
    when 122
      'https://www.kimonolabs.com/api/8758dnce?apikey=e1e82989ef91e6287ae417ede85f9ed2'
    else
      puts "\r\nUnsupported/unavailable season ID! Nothing to do..."
      nil
    end
    exit if api_endpoint.nil?
                                                    # Call correct API:
    web_response = get_web_response( api_endpoint )
    response     = JSON.parse( web_response )
    total_rows   = response['results']['collection2'].size

    response['results']['collection2'][ start_from .. total_rows ].each_with_index do |row_hash, index|
      city = row_hash['city']
      days = row_hash['days']
      row_title      = row_hash['manifest']['text']
      manifest_link  = row_hash['manifest']['href']
      results_link   = row_hash['results'].instance_of?(Hash) ? row_hash['results']['href'] : row_hash['results']
      startlist_link = results_link.gsub('risultati','startlist') if results_link
                                                  # Retrieve meeting_dates from the manifest URL:
      manifest_page_name = manifest_link.instance_of?(String) ? manifest_link.split('/').last.to_s.split('?').first : nil
      puts "\r\n- (#{ start_from + index + 1 }/#{ total_rows }) #{row_title}, #{days}, manifest_page_name: #{manifest_page_name}"

      title, meeting_dates = retrieve_title_and_manifest_dates_with_kimono( season_id, manifest_page_name ) if manifest_page_name
                                                  # Skip file save for cancelled meetings (w/o dates):
      if meeting_dates
        iso_date = get_iso_date_from_meeting_dates( meeting_dates )
        base_man_filename = get_output_filename_from( iso_date, title, city )
        puts "  #{meeting_dates}, #{title}, #{city} => ris/sta/#{base_man_filename}"
                                                  # For each meeting, get the result and the manifest page:
        store_web_manifest( manifest_link,  File.join(output_path, base_man_filename) )
        # [Steve, 20151122] For the results, the full output name will have the suffix appended after we read its contents,
        # so, the output filename will be just a base name with just a date:
        store_web_results(  results_link,   File.join(output_path, "ris#{iso_date}"), city, meeting_dates )
        store_web_results(  startlist_link, File.join(output_path, "sta#{iso_date}"), city, meeting_dates )
      else
        puts "  Not found (probably cancelled)."
      end
    end
    puts "Done."
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the web response for a specified page link using RestClient.
  # Note that this method may halt the program in case of errors.
  #
  # @param page_link, link to the page to be retrieved
  #
  def get_web_response( page_link, verbose = false )
    puts "  Retrieving '#{page_link}'..." if verbose
    web_response = RestClient.get( page_link ) do |response, request, result, &block|
      case response.code
      when 200
        response
      when 404
        puts " The request returned object not found! (error code: 404)"
        nil
      when 503
        puts " The request got frozen! (Try again later; error code: 503)"
        nil
      when 504
        puts " Gateway timeout, error code: 504. Try again later."
        nil
      else
        response.return!(request, result, &block) # Do the defaul behaviour
      end
    end
    exit if web_response.nil?                     # Bail out in case of errors
    web_response
  end


  # Returns the manifest title string and the text representing the dates, assuming
  # the specified manifest_page_name is the name of a manifest page linked to FIN results
  # of any type.
  #
  # @param season_id, the season_id used to select the correct API endpoint
  # @param manifest_page_name, the page containing the manifest of the meeting
  #
  def retrieve_title_and_manifest_dates_with_kimono( season_id, manifest_page_name )
    api_endpoint = case season_id
    when 142
      puts "  Retrieving manifest dates using API 'FIN_curr_manifest_dates'..."
      "https://www.kimonolabs.com/api/ondemand/dcofgezg?apikey=e1e82989ef91e6287ae417ede85f9ed2&kimpath4=#{manifest_page_name}"
    else
      puts "  Retrieving manifest dates using API 'FIN_old_manifest_dates'..."
      "https://www.kimonolabs.com/api/ondemand/6va4131o?apikey=e1e82989ef91e6287ae417ede85f9ed2&kimpath5=#{manifest_page_name}"
    end
                                                    # Call correct API:
    web_response = get_web_response( api_endpoint )
    response     = JSON.parse( web_response )
    result_hash  = response['results']['collection1'].first
    puts "  response: #{result_hash.inspect}"
    [ result_hash['title'], result_hash['meeting_dates'] ]
  end


  # Returns the ISO-formatted string date from the text representing the meeting dates.
  #
  # @param meeting_dates_text, the string containing the date to be ISO formatted
  #
  def get_iso_date_from_meeting_dates( meeting_dates_text )
    days, month_name, year = meeting_dates_text.split(' ')
    get_iso_date( year, month_name, days )
  end


  # Returns the ISO-formatted string date from each single field
  # representing the meeting dates.
  #
  # @param year, the year of the Meeting
  # @param month_name, the month name of the Meeting
  # @param meeting_days, 1 or 2 days for the meeting date, separated either by ',' or '-'
  #
  def get_iso_date( year, month_name, meeting_days )
    day = meeting_days.split(/[\-\,]/).first
    month = case month_name
    when /gen|1/i
      1
    when /feb|2/i
      2
    when /mar|3/i
      3
    when /apr|4/i
      4
    when /mag|5/i
      5
    when /giu|6/i
      6
    when /lug|7/i
      7
    when /ago|8/i
      8
    when /set|9/i
      9
    when /ott|10/i
      10
    when /nov|11/i
      11
    when /dic|12/i
      12
    else
      0
    end
    "%04d%02d%02d" % [ year.to_i, month, day.to_i ]
  end


  # Retrieves the specified page_link.
  #
  # @param page_link, link to the manifest page
  # @param use_restclient, +true+ to use RestClient gem; +false+ to use the standard Net::HTTP library
  #
  def get_html_doc_for_storage( page_link, use_restclient = true )
      puts "  Retrieving '#{page_link}' using #{ use_restclient ? 'RestClient' : 'Net::HTTP'} library..."
      web_response = use_restclient ? get_web_response( page_link ) : get_raw_web_response( page_link )
      puts "  #{ web_response.size } chars."
# DEBUG
#      puts "\r\n-----8<------"
#      puts web_response.to_s
#      puts "-----8<------"
#      puts " "
      Nokogiri::HTML( web_response ).css('#content')
  end


  # Retrieves and stores the specified page_link to the destination output_filename.
  #
  # === Params:
  #
  # @param page_link, link to the manifest page
  #
  # @param output_filename, the full output file name, minus the extension
  #
  # @param use_restclient, +true+ to use RestClient gem; +false+ to use the standard Net::HTTP library
  #        [Steve, 20151122] Currently the Net::HTTP has issues while retrieving the single result or manifest pages
  #
  def store_web_manifest( page_link, output_filename, use_restclient = true )
    if page_link.instance_of?(String) && page_link.size > 1
      html_doc = get_html_doc_for_storage( page_link, use_restclient )
      html_doc.css('.stampa-loca').unlink           # Remove non-working external href to PDF print preview
      # XXX 'Organizer' info is currently not used:
                                                    # Retrieve the Organizer name to be added as a suffix:
      # description = html_doc.css('.organizzazione').text
      # organizer   = description.to_s =~ /\s+Manifestazione\sorganizzata\sda.\s+/i ?
        # description.split(/Manifestazione organizzata da.\s+/i).last
          # .split(/\<br\/?\>|\n/i).first.gsub(/[\s'`\:\.]/i, '').downcase :
        # "unknown"
      # puts "  Organizer code from manifest: #{organizer}"
                                                    # Save to file with a minimal header:
      File.open( "#{output_filename}.html", 'w' ) do |f|
        f.puts "<!DOCTYPE html>"
        f.puts "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"it-it\" lang=\"it-it\" dir=\"ltr\" >"
        f.puts "<head>"
        f.puts "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
        f.puts "</head>"
        f.puts "<body>"
        f.puts html_doc.to_html
        f.puts "</body>"
        f.puts "</html>"
      end
    else
      puts "  Manifest link seems to be still undefined. 'Skipping."
    end
  end


  # Retrieves and stores the specified page_link to the destination output_filename.
  #
  # === Params:
  #
  # @param page_link, link to the results or start-list page
  #
  # @param output_filename, the base for the output file name; a standardized suffix will be appended,
  #        based upon the file contents (the meeting title) and/or the actual city name
  #
  # @param city_name, the city in which the meeting is held
  #
  # @param meeting_dates, the actual "verbose date" (or dates) during which the meeting is held
  #
  # @param use_restclient, +true+ to use RestClient gem; +false+ to use the standard Net::HTTP library
  #        [Steve, 20151122] Currently the Net::HTTP has issues while retrieving the single result or manifest pages
  #
  def store_web_results( page_link, output_filename, city_name, meeting_dates, use_restclient = true )
    if page_link.instance_of?(String) && page_link.size > 1
      html_doc    = get_html_doc_for_storage( page_link, use_restclient )
      title       = html_doc.css( 'h1' ).text
      description = html_doc.css( 'h3' ).text
      filename_suffix = get_suffix_from_title_and_city( title, city_name )
      # XXX 'Organizer' info is currently not used:
                                                    # Retrieve the Organizer name to be added as a suffix:
      # organizer   = "unknown"
      # if description.to_s =~ /manifestazione organizzata da /i
        # organizer_token = description.split(/manifestazione organizzata da /i).last
        # unless organizer_token.nil?
          # organizer = organizer_token.gsub(/[\s'`\:\.]/i, '')
            # .gsub('à', 'a')
            # .gsub(/[èé]/, 'e')
            # .gsub('ì', 'i')
            # .gsub('ò', 'o')
            # .gsub('ù', 'ù')
            # .downcase
        # end
      # end
      # puts "  Organizer code for res./sta.: #{organizer}"
      event_list  = html_doc.css( '.gara h2' ).map { |node| node.text }
      result_list = html_doc.css( '.gara pre' ).map { |node| node.text }
                                                    # Extract the contents on file:
      File.open( "#{output_filename}#{filename_suffix}.txt", 'w' ) do |f|
        f.puts title
        f.puts description
        f.puts meeting_dates
        f.puts "\r\n#{ event_list.join(', ') }"
        f.puts "\r\n"
                                                    # Rebuild result list w/ titles:
        result_list.each_with_index do |result_text, index|
          f.puts "#{ event_list[ index ] }"
          f.puts "\r\n"
          f.puts result_text
          f.puts "\r\n"
        end
        if html_doc.css( '.classifica pre' ).size > 0
          f.puts "\r\nClassifica"
          f.puts "\r\n"
          f.puts html_doc.css( '.classifica pre' ).text
        end
        if html_doc.css( '.statistiche pre' ).size > 0
          f.puts "\r\nStatistiche"
          f.puts "\r\n"
          f.puts html_doc.css( '.statistiche pre' ).text
        end
      end
    else
      puts "  Results or Start-List link seems to be still undefined. 'Skipping."
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  desc <<-DESC
  Crawls the web to retrieve all the available FIN Championship result pages,
meeting entries and manifests except the ones from the current season.

          *** This task uses the API @ apifier.com ***

Options: token=<API_token>
         [output_path=#{LOCALCOPY_DIR}]

  - 'token' the token required to access the API.

  - 'output_path' the path where the files will be stored after the crawling.


Apifier API used to retrieve the list of all sub-pages for each year:

    1) Supermaster_FIN_old_season_meetings:
       - Defined at https://www.apifier.com/crawlers/AQm3bFNSvkaWKWXMR
         crawls all calendar pages except the current one, assuming the calendar
         pages have the format:
         http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-20XX-20YY.html

DESC
  task :apifier_get_old_fin_data do |t|
    puts "\r\n*** Crawler::apifier_get_old_fin_data ***"
    token = ENV.include?("token")  ? ENV["token"] : ''

    # [Steve, 20151121] Links used by the API endpoint below:
    #
    # Previous FIN championships:
    # (1) season 142 => http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2014-2015.html
    # (2) season 132 => http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2013-2014.html
    # (3) season 122 => http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2012-2013.html
    #
    # To change or update the above links, edit directly the crawler at:
    # https://www.apifier.com/crawlers/AQm3bFNSvkaWKWXMR
    #
    api_run_endpoint = "https://www.apifier.com/api/v1/YZw3JnXkocmreiBvj/crawlers/Supermaster_FIN_old_season_meetings/execute?token=#{token}"
    run_apifier_crawler( api_run_endpoint )
  end
  #-- -------------------------------------------------------------------------
  #++


  desc <<-DESC
  Crawls the web to retrieve the current FIN Championship result pages,
meeting entries and manifests for the current season.

          *** This task uses the API @ apifier.com ***

Options: token=<API_token>
         [output_path=#{LOCALCOPY_DIR}]

  - 'token' the token required to access the API.

  - 'output_path' the path where the files will be stored after the crawling.


Apifier API used to retrieve the list of all sub-pages for each year:

    1) Supermaster_FIN_current_season_meetings:
       - Defined at https://www.apifier.com/crawlers/p2DPKSzRAZWavEH5D
         crawls the current calendar page stored at:
         http://www.federnuoto.it/discipline/master/circuito-supermaster.html

DESC
  task :apifier_get_current_fin_data do |t|
    puts "\r\n*** Crawler::apifier_get_current_fin_data ***"
    token = ENV.include?("token")  ? ENV["token"] : ''

    # [Steve, 20151122] Links used by the API endpoint below:
    #
    # Current FIN championships:
    # (1) season 152 => http://www.federnuoto.it/discipline/master/circuito-supermaster.html
    #
    # To change or update the above links, edit directly the crawler at:
    # https://www.apifier.com/crawlers/p2DPKSzRAZWavEH5D
    #
    api_run_endpoint = "https://www.apifier.com/api/v1/YZw3JnXkocmreiBvj/crawlers/Supermaster_FIN_current_season_meetings/execute?token=#{token}"
    run_apifier_crawler( api_run_endpoint )
  end
  #-- -------------------------------------------------------------------------
  #++


  private
  require 'net/http'


  # Executes the crawler defined at the specified API endpoint, retrieves the links
  # and stores the contents on file.
  #
  def run_apifier_crawler( api_run_endpoint )
    output_path = ENV.include?("output_path") ? ENV["output_path"] : LOCALCOPY_DIR
    puts "output_path:  #{output_path}"
                                                    # Create the base output path, if missing:
    FileUtils.mkdir_p( output_path ) if !File.directory?( output_path )
    puts "\r\n"
    puts "Launching crawler..."                     # Call API to execute the crawler:
    web_response = post_raw_ssl_web_request( api_run_endpoint, true )
# DEBUG
#    puts "\r\nResult #{ web_response.inspect }."

    # [Steve, 20151121] For some reason, each response body has 3 invalid chars
    # at the begining. So we skip them.
    web_response = web_response.body[3..-1]
    json_result = JSON.parse( web_response )
    status      = json_result['status']
    status_msg  = nil
    # Possible status codes:
    # RUNNING, SUCCEEDED, STOPPED, TIMEOUT or FAILED
    api_status_endpoint = json_result['detailsUrl']
    api_result_endpoint = json_result['resultsUrl']

    while status == 'RUNNING'                       # Wait for the API crawler to succeed (or fail)
      sleep(2)
      putc "."
      web_response = get_raw_ssl_web_response( api_status_endpoint )
      # [Steve, 20151121] For some reason, each response body has 3 invalid chars
      # at the begining. So we skip them.
      web_response = web_response.body[3..-1]
      json_result = JSON.parse( web_response )
      status     = json_result['status']
      status_msg = json_result['statusMessage']
    end
    puts "\r\n"

    if status != 'SUCCEEDED'
      puts "Crawler API failed with result status '#{status}': #{status_msg}."
      puts "Aborting."
      exit
    end

    puts "Crawler API SUCCEEDED."
    puts "Retrieving results..."
    web_response = get_raw_ssl_web_response( api_result_endpoint, true )
    # [Steve, 20151121] For some reason, each response body has 3 invalid chars
    # at the begining. So we skip them.
    web_response = web_response.body[3..-1]
    json_result = JSON.parse( web_response )
    meetings_found = []
# DEBUG
#    puts "json_result is an #{ json_result.class }"
#    puts "json_result.first is a #{ json_result.first.class }\r\n"

    # pageFunctionResult is an array of Hash:
    result_list = json_result.each do |calendar_hash|
      label = calendar_hash['label']
      current_url = calendar_hash['url']
      puts "\r\n\r\nProcessing results for season #{ label }"
      puts "(#{ current_url }) => #{ calendar_hash['pageFunctionResult'].size } tot. links"
      puts " "
                                                    # Create the output sub-path, if missing:
      full_output_path = File.join(output_path, label)
      FileUtils.mkdir_p( full_output_path ) if !File.directory?( full_output_path )

      # For each calendar URL, we have several row result Hash instances:
      calendar_hash['pageFunctionResult'].each_with_index do |row_hash, index|
        year = row_hash['year']
        month = row_hash['month']
        days = row_hash['days']
        city = row_hash['city']
        description = row_hash['description']
        link = "http://www.federnuoto.it#{ row_hash['link'] }"

        # Extract base file name:
        iso_date = get_iso_date( year, month, days )
        base_filename = get_output_filename_from( iso_date, description, city )
        coded_suffix  = suffix = get_suffix_from_title_and_city( description, city )
        puts "Processing #{ coded_suffix } => #{base_filename} (#{ index + 1 }/#{ calendar_hash['pageFunctionResult'].size })..."
                                                    # For each meeting, get & store the result and the manifest page:
        if description =~ /risultati|start.list/i  # *** MEETING RESULTS / START-LIST ***
          store_web_results( link, File.join(full_output_path, base_filename), city, "#{days} #{month} #{year}", true )
        else                                        # *** MEETING INVITATION ***
          # For each Meeting invitation found, store its definition:
          meetings_found << {
            season_id: label,
            code_name: coded_suffix,
            year: year,
            month: month,
            days: days,
            city: city,
            description: description
          }
          store_web_manifest( link, File.join(full_output_path, base_filename), true )
        end
      end
    end

    store_meetings_found( File.join(output_path, "meetings_found"), meetings_found ) if meetings_found.size > 0
    puts "Done."
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns a normalized country or city name
  #
  def get_normalized_name( name )
    name.gsub(/[\s\-_'`\\\/\:\.\,\;]/,'')
            .gsub(/à/i,'a')
            .gsub(/[èé]/i,'e')
            .gsub(/ì/i,'i')
            .gsub(/ò/i,'o')
            .gsub(/ù/i,'u')
            .downcase
  end


  # Returns a standardized suffix for the output filename.
  # Note that for result files, the actual suffix must be extracted while
  # parsing the contents, to retrieve the actual meeting title.
  #
  # === Params:
  #
  # - meeting_title, the description or the title of the Meeting
  #
  # - city_name, the city name for the Meeting
  #
  def get_suffix_from_title_and_city( meeting_title, city_name )
    if meeting_title =~ /distanze\sspeciali/i
      region = get_normalized_name( meeting_title.split(/speciali\s/i).last )
      "spec#{ region }"
    elsif meeting_title =~ /regionali\s/i
      region = get_normalized_name( meeting_title.split(/regionali\s/i).last )
      "reg#{ region }"
    else
      get_normalized_name( city_name )
    end
  end


  # Builds up the output filename for a crawled page to be stored, according
  # to the parameters.
  #
  # === Params:
  #
  # - iso_date, the date of the meeting in ISO format
  #
  # - description, the description or the title of the Meeting;
  #                if the description is 'risultati' no suffix will be appended
  #
  # - city_name, the city name for the Meeting
  #
  def get_output_filename_from( iso_date, description, city_name )
    if description =~ /risultati/i
      "ris#{ iso_date }"

    elsif description =~ /start.list/i
      "sta#{ iso_date }"

    elsif description =~ /distanze\sspeciali|regionali\s|/i
      suffix = get_suffix_from_title_and_city( description, city_name )
      "man#{ iso_date }#{ suffix }"

    else
      "man#{ iso_date }#{ get_normalized_name( city_name ) }"
    end
  end


  # POST HTTPS for API endpoint.
  # Returns the web response for a specified URI using Net::HTTP.
  # Note that this method may halt the program in case of errors.
  #
  # This method DOES NOT USE RestClient.
  #
  # @param page_link, link to the API endpoint to be called
  #
  def post_raw_ssl_web_request( page_link, verbose = false )
    puts "POST '#{page_link}'..." if verbose

    uri = URI.parse( page_link )
    http = Net::HTTP.new( uri.host, uri.port )
    http.use_ssl = true
    request = Net::HTTP::Post.new( uri.request_uri )
                                                    # Make the actual request:
    response = http.request(request)
    if response.nil?                                # Bail out in case of errors
      puts "No response!\r\nAborting."
      exit
    end
    response
  end


  # GET HTTPS for API endpoint.
  # Returns the web response for a specified URI using Net::HTTP.
  # Note that this method may halt the program in case of errors.
  #
  # This method DOES NOT USE RestClient.
  #
  # @param page_link, link to the API endpoint to be called
  # @param verbose, true to display an output line showing the request link.
  #
  def get_raw_ssl_web_response( page_link, verbose = false )
    get_raw_web_response( page_link, verbose, true )
  end


  # GET HTTPS for API endpoint.
  # Returns the web response for a specified URI using Net::HTTP.
  # Note that this method may halt the program in case of errors.
  #
  # This method DOES NOT USE RestClient.
  #
  # @param page_link, link to the API endpoint to be called
  # @param verbose, true to display an output line showing the request link.
  # @param use_ssl, true to use SSL (for HTTPS connections)
  #
  def get_raw_web_response( page_link, verbose = false, use_ssl = false )
    puts "GET '#{page_link}'..." if verbose

    uri = URI.parse( page_link )
    http = Net::HTTP.new( uri.host, uri.port )
    http.use_ssl = use_ssl
    request = Net::HTTP::Get.new( uri.path )
                                                    # Make the actual request:
    response = http.request(request)
    if response.nil?                                # Bail out in case of errors
      puts "No response!\r\nAborting."
      exit
    end
    response
  end


  # Serializes on a simple CSV file all Meeting definitions found so far.
  #
  # Assumes each item of the meetings_array is an Hash having the structure:
  #
  #    {
  #      season_id: label,
  #      code_name: coded_suffix,
  #      year: year,
  #      month: verbose month name,
  #      days: days in string (eventually separated by comma),
  #      city: full city name,
  #      description: description
  #    }
  #
  def store_meetings_found( output_filename, meetings_array )
    File.open( "#{output_filename}.csv", 'w' ) do |f|
      f.puts meetings_array.first.keys.join(',')
      meetings_array.each do |meeting_hash|
        f.puts(
          [
            meeting_hash[:season_id],
            "\"#{ meeting_hash[:code_name] }\"",
            meeting_hash[:year],
            "\"#{ meeting_hash[:month] }\"",
            "\"#{ meeting_hash[:days] }\"",
            "\"#{ meeting_hash[:city] }\"",
            "\"#{ meeting_hash[:description] }\""
          ].join(",")
        )
      end
    end
  end
end
# =============================================================================
