# encoding: utf-8
require 'date'
require 'rubygems'
require 'fileutils'
require 'mechanize'
require 'rest_client'

require 'framework/console_logger'


=begin

= Web-Crawling Helper tasks

  - Goggles framework vers.:  4.00.463
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end

LOCALCOPY_DIR = File.join("#{Dir.pwd}.docs", 'meeting_data')
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


# == Task FUTUREDEV ideas:
# TODO - store link results as text files for editing
# TODO - crawl task: accept text files containing 1 url per row for batch-crawling of each url
# TODO - parse task: dump css selectors or fields found in page (dump forms evolved)
# TODO - select task: extract specific css selectors from page
# TODO - combine site|search + crawl|parse tasks

# Current:
# http://www.federnuoto.it/discipline/master/circuito-supermaster.html

# History:
# http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2013-2014.html
# http://www.federnuoto.it/discipline/master/circuito-supermaster/stagione-2012-2013.html


  desc <<-DESC
  Crawls the web to retrieve either swimmer result pages or meeting entries.
  Resulting log files are stored into '#{LOG_DIR}'.

  Options: [output_path=#{LOCALCOPY_DIR}]
           [log_dir=#{LOG_DIR}]

  - 'output_path' the path where the found files will be stored.
  - 'log_dir'   allows to override the default log dir destination.

  DESC
  task :get_results do |t|
    puts "\r\n*** Crawler:::get_results ***"
    output_path     = ENV.include?("output_path") ? ENV["output_path"] : LOCALCOPY_DIR
    log_dir         = ENV.include?("log_dir") ? ENV["log_dir"] : LOG_DIR
    puts "output_path:  #{output_path}"
    puts "log_dir:      #{log_dir}"
    puts "\r\n"

# FIN_result_single_page:
#########################
#    response = RestClient.get 'https://www.kimonolabs.com/api/7mryftbu?apikey=e1e82989ef91e6287ae417ede85f9ed2'
    # &kimpath4=newvalue (stagione-2012-2013.html)
    # &view=newvalue  (risultati|startlist)
    # &codice=newvalue (D26A)
    # &anno=newvalue (2013)

    if File.directory?( output_path )
      response = JSON.parse(
        RestClient.get(
          # API FIN_supermasters_meetings:
          'https://www.kimonolabs.com/api/247amgrm?apikey=e1e82989ef91e6287ae417ede85f9ed2'
        )
      )
      total_rows = response['results']['collection2'].size

      response['results']['collection2'].each_with_index do |row_hash, index|
        city = row_hash['city']
        days = row_hash['days']
        row_title      = row_hash['manifest']['text']
        manifest_link  = row_hash['manifest']['href']
        results_link   = row_hash['results']
        startlist_link = results_link.gsub('risultati','startlist') if results_link
                                                    # Retrieve meeting_dates from the manifest URL:
        manifest_page_name = manifest_link.instance_of?(String) ? manifest_link.split('circuito-supermaster/').last.to_s.split('?').first : nil
        puts "\r\n- (#{index+1}/#{total_rows}) #{row_title}, #{days}, manifest_page_name: #{manifest_page_name}"

        title, meeting_dates = retrieve_title_and_manifest_dates( manifest_page_name ) if manifest_page_name
        iso_date = get_iso_date_from_meeting_dates( meeting_dates )
        base_filename = "#{ iso_date }#{ city.gsub(/[\s']/,'').downcase }.txt"
        puts "  #{meeting_dates}, #{title}, #{city} => (ris/man) #{base_filename}"
        puts "  results_link: #{results_link}"
                                                    # For each meeting, get the result and the manifest page:
        store_web_manifest( manifest_link,  File.join(output_path, "man#{base_filename}") )
        store_web_results(  results_link,   File.join(output_path, "ris#{base_filename}") )
        store_web_results(  startlist_link, File.join(output_path, "sta#{base_filename}") )
# TODO
        exit
      end
    else
      puts "'#{output_path}' not found: aborting..."
    end
    puts "Done."
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the manifest title string and the text representing the dates, assuming
  # the specified manifest_page_name is the name of a manifest page linked to FIN results
  # of any type.
  #
  def retrieve_title_and_manifest_dates( manifest_page_name )
    response = JSON.parse(
      RestClient.get(
        # API FIN_manifest_dates:
        "https://www.kimonolabs.com/api/dcofgezg?apikey=e1e82989ef91e6287ae417ede85f9ed2&kimpath4=#{manifest_page_name}"
      )
    )
    result_hash = response['results']['collection1'].first
    puts "  response: #{result_hash.inspect}"
    [ result_hash['title'], result_hash['meeting_dates'] ]
  end


  # Returns the ISO-formatted string date from the text representing the meeting dates.
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
    "%04d%02d%02d" % [ year, month, day ]
  end


  # Retrieves and stores the specified page_link to the destination output_filename.
  #
  def store_web_manifest( page_link, output_filename )
    if page_link
      web_response = RestClient.get( page_link )
      html_doc = Nokogiri::HTML( web_response ).css('#content').wrap("<body></body>")
      File.open( output_filename, 'w' ) { |f| f.puts html_doc.to_html }
    end
  end


  # Retrieves and stores the specified page_link to the destination output_filename.
  #
  def store_web_results( page_link, output_filename )
    if page_link
      web_response = RestClient.get( page_link )
      html_doc = Nokogiri::HTML( web_response ).css('#content')
      # TODO extract h1 class="nome"
      # TODO extract h3 as description
      # TODO extract div class="sommario" for event list
      # TODO extract each <pre> nodes as part of the result list
      File.open( output_filename, 'w' ) { |f| f.puts html_doc.inner_html.to_s }
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
# =============================================================================


