require 'json'


class Api::V1::NewsFeedsController < ApplicationController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!
  before_filter :authenticate_entity!                # Devise "standard" HTTP log-in strategy
  before_filter :ensure_format
  # ---------------------------------------------------------------------------


  # Returns the unread news feed for a specific user.
  #
  # === Params:
  # - id: the User.id
  #
  def for_user
    news_feed = NewsFeed.unread.where( user_id: params[:id] )
    render :json => news_feed
  end
  # ---------------------------------------------------------------------------


  # Creates a news-feed row for a specific user.
  # (JSON format) POST-only action.
  #
  # === Params:
  # - :news_feed => the news_feed attributes for the row to be created.
  #
  def create
    begin
      news_feed_attrs = params[:news_feed] ? JSON.parse(params[:news_feed]) : nil
    rescue
      news_feed_attrs = nil
    end
    render :json => NewsFeed.create(news_feed_attrs).to_json
  end
  # ---------------------------------------------------------------------------


  # Deletes a specific news-feed row.
  # (JSON format) DELETE-only action.
  #
  # === Params:
  # - id: the NewsFeed.id to be deleted.
  #
  def destroy
    news_feed = NewsFeed.find_by_id( params[:id] )
    if news_feed && news_feed.destroy
      render( status: :ok, json: { success: true } )
    else
      render( status: 422, json: { success: false } )
    end
  end
  # ---------------------------------------------------------------------------


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
  # ---------------------------------------------------------------------------


  protected


  # Makes sure that the format for the request is an accepted one.
  def ensure_format
    unless request.xhr? || request.format.json?
      render( status: 406, json: {success: false, message: I18n.t(:api_request_must_be_json) } )
      return
    end
  end
end
