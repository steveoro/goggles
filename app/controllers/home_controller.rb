# encoding: utf-8
require 'common/format'


=begin

= HomeController

  - version:  4.00.491
  - author:   Steve A.

=end
class HomeController < ApplicationController

  def index
    @articles = Article.find(
      :all,
      order: "is_sticky DESC, updated_at DESC",
      :limit => AppParameter.get_default_pagination_rows_for( :articles )
    )
    @news_feed = user_signed_in? ? NewsFeed.unread.where( user: current_user ) : []
  end
  #-- -------------------------------------------------------------------------
  #++

  def about
    @versioning = AppParameter.find_by_code( AppParameter::PARAM_VERSIONING_CODE )
                                                    # Retrieve, cleanse and pre-format gem info:
    @gem_info = []
    %x{gem list -l --no-details}.split("\n").each{ |row|
      @gem_info << row if row =~ / \([0-9]/
    }
  end

  def contact_us
  end
  #-- -------------------------------------------------------------------------
  #++


  # "Maintenance mode" action rendering
  def maintenance
    versioning = AppParameter.find_by_code( AppParameter::PARAM_VERSIONING_CODE )
    @presumed_downtime_end = Format.a_short_datetime( versioning.a_date )
  end

  # "Work In Progress"/"Routing error" action rendering
  def wip
  end
  #-- -------------------------------------------------------------------------
  #++
end
