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

          *** This task uses the API @ kimonolabs.com ***

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

      title, meeting_dates = retrieve_title_and_manifest_dates( season_id, manifest_page_name ) if manifest_page_name
                                                  # Skip file save for cancelled meetings (w/o dates):
      if meeting_dates
        iso_date = get_iso_date_from_meeting_dates( meeting_dates )
        base_filename = "#{ iso_date }#{ city.gsub(/[\s'`\:\.]/,'').downcase }"
        puts "  #{meeting_dates}, #{title}, #{city} => (ris/man) #{base_filename}"
                                                  # For each meeting, get the result and the manifest page:
        store_web_manifest( manifest_link,  File.join(output_path, "man#{base_filename}") )
        store_web_results(  results_link,   File.join(output_path, "ris#{base_filename}"), meeting_dates )
        store_web_results(  startlist_link, File.join(output_path, "sta#{base_filename}"), meeting_dates )
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
  def get_web_response( page_link )
    puts "Retrieving '#{page_link}'..."
    web_response = RestClient.get( page_link ) do |response, request, result, &block|
      case response.code
      when 200
        response
      when 404
        puts " The API returned object not found! (error code: 404)"
        nil
      when 503
        puts " The API got frozen! (Try again later; error code: 503)"
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
  def retrieve_title_and_manifest_dates( season_id, manifest_page_name )
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
    day   = days.split(/[\,\-]/).first
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


  # Retrieves and stores the specified page_link to the destination output_filename.
  #
  # @param page_link, link to the manifest page
  # @param output_filename, the output file name
  #
  def store_web_manifest( page_link, output_filename )
    if page_link.instance_of?(String) && page_link.size > 1
      puts "  Retrieving '#{page_link}'..."
      web_response = get_web_response( page_link )

      html_doc = Nokogiri::HTML( web_response ).css('#content')
      html_doc.css('.stampa-loca').unlink           # Remove non-working external href to PDF print preview
                                                    # Retrieve the Organizer name to be added as a suffix:
      description = html_doc.css('.organizzazione').text
      organizer   = description.to_s =~ /\s+Manifestazione\sorganizzata\sda.\s+/i ?
        description.split(/Manifestazione organizzata da.\s+/i).last
          .split(/\<br\/?\>|\n/i).first.gsub(/[\s'`\:\.]/i, '').downcase :
        "unknown"
      puts "  Organizer code from manifest: #{organizer}"
                                                    # Save to file with a minimal header:
      File.open( output_filename + "_#{organizer}.html", 'w' ) do |f|
        f.puts "<head>"
        f.puts "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
        f.puts "</head>"
        f.puts "<body>"
        f.puts html_doc.to_html
        f.puts "</body>"
      end
    else
      puts "  Manifest link seems to be still undefined. 'Skipping."
    end
  end


  # Retrieves and stores the specified page_link to the destination output_filename.
  #
  # @param page_link, link to the results or start-list page
  # @param output_filename, the output file name
  # @param meeting_dates, the actual dates in which the meeting is held
  #
  def store_web_results( page_link, output_filename, meeting_dates )
    if page_link.instance_of?(String) && page_link.size > 1
      puts "  Retrieving '#{page_link}'..."
      web_response = get_web_response( page_link )

      html_doc = Nokogiri::HTML( web_response ).css('#content')
      title       = html_doc.css( 'h1' ).text
      description = html_doc.css( 'h3' ).text
                                                    # Retrieve the Organizer name to be added as a suffix:
      organizer   = "unknown"
      if description.to_s =~ /manifestazione organizzata da /i
        organizer_token = description.split(/manifestazione organizzata da /i).last
        unless organizer_token.nil?
          organizer = organizer_token.gsub(/[\s'`\:\.]/i, '')
            .gsub('à', 'a')
            .gsub(/[èé]/, 'e')
            .gsub('ì', 'i')
            .gsub('ò', 'o')
            .gsub('ù', 'ù')
            .downcase
        end
      end
      puts "  Organizer code for res./sta.: #{organizer}"
      event_list  = html_doc.css( '.gara h2' ).map { |node| node.text }
      result_list = html_doc.css( '.gara pre' ).map { |node| node.text }
                                                    # Extract the contents on file:
      File.open( output_filename + "_#{organizer}.txt", 'w' ) do |f|
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
         [start_from=0]

  - 'output_path' the path where the files will be stored after the crawling.

  - 'start_from' allows the crawling loop to start from a different offset than 0,
    computed among all the results found from the FIN_supermasters_meetings API.


Apifier API used to retrieve the list of all sub-pages for each year:

    1) Supermaster_FIN_old_season_meetings:
       - Defined at https://www.apifier.com/crawlers/AQm3bFNSvkaWKWXMR
         crawls all calendar pages except the current one, assuming the calendar
         pages have the format:
         http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-20XX-20YY.html

DESC
  task :apifier_get_old_fin_data do |t|
    puts "\r\n*** Crawler::apifier_get_old_fin_data ***"
    output_path = ENV.include?("output_path") ? ENV["output_path"] : LOCALCOPY_DIR
    token       = ENV.include?("token")  ? ENV["token"] : ''
    start_from  = ENV.include?("start_from")  ? ENV["start_from"].to_i : 0
    puts "output_path:  #{output_path}"
                                                    # Create the output path, if missing:
    FileUtils.mkdir_p( output_path ) if !File.directory?( output_path )
    puts "\r\n"

    # [Steve, 20151121] Links used by the APIs below:
    #
    # Previous FIN championships:
    # (1) - http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2014-2015.html
    # (2) - http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2013-2014.html
    # (3) - http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2012-2013.html
    #
    # To change or update the above links, edit directly the crawler at:
    # https://www.apifier.com/crawlers/AQm3bFNSvkaWKWXMR
    #
    api_run_endpoint = "https://www.apifier.com/api/v1/YZw3JnXkocmreiBvj/crawlers/Supermaster_FIN_old_season_meetings/execute?token=#{token}"

                                                    # Call correct API:
    puts "Launching crawler..."
    web_response = post_raw_web_request( api_run_endpoint, true )
# DEBUG
#    puts "\r\nResult #{ web_response.inspect }."
    json_result = JSON.parse( web_response )
    status      = json_result['status']
    status_msg  = nil
    # Possible status codes:
    # RUNNING, SUCCEEDED, STOPPED, TIMEOUT or FAILED
    api_status_endpoint = json_result['detailsUrl']
    api_result_endpoint = json_result['resultsUrl']

    while status == 'RUNNING'
      sleep(2)
      putc "."
      web_response = get_raw_web_response( api_status_endpoint )
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
    web_response = get_raw_web_response( api_result_endpoint, true )
    json_result = JSON.parse( web_response )
# DEBUG
#    puts "json_result is an #{ json_result.class }"
#    puts "json_result.first is a #{ json_result.first.class }\r\n"

    # pageFunctionResult is an array of Hash:
    result_list = json_result.each do |calendar_hash|
      label = calendar_hash['label']
      current_url = calendar_hash['url']
      puts "\r\n\r\nProcessing results for #{ label }"
      puts "(#{ current_url })"
      puts " "

      # For each calendar URL, we have several row result Hash instances:
      calendar_hash['pageFunctionResult'].each_with_index do |row_hash, index|
        year = row_hash['year']
        month = row_hash['month']
        days = row_hash['days']
        city = row_hash['city']
        description = row_hash['description']
        link = row_hash['link']

        # TODO Extract base file name

        # FIXME / WIP
        puts "#{year}-#{month}-#{days}_#{city}: #{description}, #{link}"

        if description == 'Risultati'
          # TODO
        else  # (Meeting invitation)
          # TODO
        end

        # results_link   = row_hash['results'].instance_of?(Hash) ? row_hash['results']['href'] : row_hash['results']
        # startlist_link = results_link.gsub('risultati','startlist') if results_link
                                                    # # Retrieve meeting_dates from the manifest URL:
        # manifest_page_name = manifest_link.instance_of?(String) ? manifest_link.split('/').last.to_s.split('?').first : nil
        # puts "\r\n- (#{ start_from + index + 1 }/#{ total_rows }) #{row_title}, #{days}, manifest_page_name: #{manifest_page_name}"
  #
        # title, meeting_dates = retrieve_title_and_manifest_dates( season_id, manifest_page_name ) if manifest_page_name
                                                    # # Skip file save for cancelled meetings (w/o dates):
        # if meeting_dates
          # iso_date = get_iso_date_from_meeting_dates( meeting_dates )
          # base_filename = "#{ iso_date }#{ city.gsub(/[\s'`\:\.]/,'').downcase }"
          # puts "  #{meeting_dates}, #{title}, #{city} => (ris/man) #{base_filename}"
                                                    # # For each meeting, get the result and the manifest page:
          # store_web_manifest( manifest_link,  File.join(output_path, "man#{base_filename}") )
          # store_web_results(  results_link,   File.join(output_path, "ris#{base_filename}"), meeting_dates )
          # store_web_results(  startlist_link, File.join(output_path, "sta#{base_filename}"), meeting_dates )
        # else
          # puts "  Not found (probably cancelled)."
        # end
      end
    end

    puts "Done."
  end
  #-- -------------------------------------------------------------------------
  #++


  require 'net/http'


  # POST HTTPS for API endpoint.
  # Returns the web response for a specified URI using Net::HTTP.
  # Note that this method may halt the program in case of errors.
  #
  # This method DOES NOT USE RestClient.
  #
  # @param page_link, link to the API endpoint to be called
  #
  def post_raw_web_request( page_link, verbose = false )
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
    # [Steve, 20151121] For some reason, each response body has 3 invalid chars
    # at the begining. So we skip them.
    response.body[3..-1]
  end


  # GET HTTPS for API endpoint.
  # Returns the web response for a specified URI using Net::HTTP.
  # Note that this method may halt the program in case of errors.
  #
  # This method DOES NOT USE RestClient.
  #
  # @param page_link, link to the API endpoint to be called
  #
  def get_raw_web_response( page_link, verbose = false )
    puts "GET '#{page_link}'..." if verbose

    uri = URI.parse( page_link )
    http = Net::HTTP.new( uri.host, uri.port )
    http.use_ssl = true
    request = Net::HTTP::Get.new( uri.request_uri )
                                                    # Make the actual request:
    response = http.request(request)
    if response.nil?                                # Bail out in case of errors
      puts "No response!\r\nAborting."
      exit
    end
    # [Steve, 20151121] For some reason, each response body has 3 invalid chars
    # at the begining. So we skip them.
    response.body[3..-1]
  end
end
# =============================================================================


