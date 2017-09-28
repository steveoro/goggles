require 'json'


class Api::V1::NewsFeedsController < Api::BaseController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :ensure_format
  #-- -------------------------------------------------------------------------
  #++


  # Returns the unread news feed for a specific user.
  #
  # === Params:
  # - id: the User.id
  #
  def for_user
    news_feed = NewsFeed.unread.where( user_id: params[:id] )
    render json: news_feed
  end
  #-- -------------------------------------------------------------------------
  #++

  # Toggles as read a specific news-feed row.
  # (JSON format) PUT-only action.
  #
  # === Params:
  # - id: the NewsFeed.id to be deleted.
  #
  def read
    news_feed = NewsFeed.find_by_id( params[:id] )
    if news_feed
      news_feed.is_read = true
      if news_feed.save
        render( status: :ok, json: { success: true } ) and return
      end
    end
    render( status: 422, json: { success: false } )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Deletes a specific news-feed row.
  # (JSON format) DELETE-only action.
  #
  # === Params:
  # - id: the NewsFeed.id to be deleted.
  #
  def destroy
    row = NewsFeed.find_by_id( params[:id] )
    # Keep in mind that destroy will return the destroyed row if it successful:
    is_ok = ( row && row.destroy ? true : false )
    render( status: (is_ok ? :ok : 422), json: { success: is_ok } )
  end
  #-- -------------------------------------------------------------------------
  #++
end
