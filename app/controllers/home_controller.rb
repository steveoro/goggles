# encoding: utf-8
require 'common/format'


class HomeController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!, only: [:associate]
  before_filter :authenticate_entity!, only: [:associate] # Devise HTTP log-in strategy
  # ---------------------------------------------------------------------------


  def index
    @articles = Article.find(
      :all,
      :order => "is_sticky DESC, updated_at DESC",
      :limit => AppParameter.get_default_pagination_rows_for( :articles )
    )
  end
  # ----------------------------------------------------------------------------


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


  # Associate action for a logged-in user. Handles both GET + POST
  def associate
    if request.post?                                # === POST: ===
      # TODO Save associated swimmer_id & update swimmer.associated_user_id (both ways)
      # TODO Set a flash message or a news_feed update
      redirect_to( root_path() ) and return
                                                    # === GET: ===
    else
      first_name_part  = '%' + current_user.description.upcase.split(' ')[0] + '%'
      second_name_part = '%' + current_user.description.upcase.split(' ')[1] + '%'
      first_list  = Swimmer.where( ["complete_name LIKE ?", first_name_part] )
      second_list = Swimmer.where( ["complete_name LIKE ?", second_name_part] )
                                                    # Choose only the list with less results:
      @possible_swimmers = first_list.size < second_list.size ? first_list : second_list
    end
  end


  # "Work In Progress"/"Routing error" action rendering
  def wip
  end
  # ----------------------------------------------------------------------------
  #++
end
