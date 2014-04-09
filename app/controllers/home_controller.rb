class HomeController < ApplicationController

  require 'common/format'


  def index
    @articles = Article.find(
      :all,
      :order => "is_sticky DESC, updated_at DESC",
      :limit => AppParameter.get_default_pagination_rows_for( :articles )
    )
  end
  # ----------------------------------------------------------------------------
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


  # Action used to allow the current user to edit its profile 
#  def edit_current_user
#  end


  # "Who's online" command
  #
#  def whos_online
#    @online_users = Info::UsersInfo.retrieve_online_users( true ) # (retrieve also full description)
#  end


  # "Work In Progress" indicator
  def wip
  end
  # ----------------------------------------------------------------------------
  #++
end
