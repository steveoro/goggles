# encoding: utf-8
require 'common/format'


=begin

= HomeController

  - version:  4.00.659
  - author:   Steve A.

=end
class HomeController < ApplicationController

  def index
    @articles    = []
    @news_feed   = []
    @teams       = []
    @seasons     = []
    @invitations = []
    @start_lists = []
    @results     = []
    @goggle_cups = []
    badges       = []
    if user_signed_in?
      if current_user.has_associated_swimmer?
        badges = current_user.swimmer.get_badges_array_for_year if current_user.has_associated_swimmer?
        @teams = badges.map do |badge|
          badge.team
        end.uniq
        @seasons = badges.map do |badge|
          badge.season
        end.uniq
        @seasons.each do |season|
          @invitations << season.meetings.has_only_invitation.sort_by_date.first if season.meetings.has_only_invitation.count > 0
          @start_lists << season.meetings.has_only_start_list.sort_by_date.first if season.meetings.has_only_start_list.count > 0
          @results     << season.meetings.has_results.sort_by_date.last if season.meetings.has_results.count > 0
        end
        @teams.each do |team|
          @goggle_cups << team.get_current_goggle_cup_at if team.has_goggle_cup_at?
        end
      end
      @articles  = Article.find(
        :all,
        order: "is_sticky DESC, updated_at DESC",
        :limit => AppParameter.get_default_pagination_rows_for( :articles )
      )
      @news_feed = NewsFeed.unread.where( user: current_user )
    end
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
