# encoding: utf-8
require 'date'
require 'common/format'
require 'training_printout_layout'


class UserTrainingStoriesController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user!
  # ---------------------------------------------------------------------------


  # Index/Search action.
  #
  def index
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#    logger.debug "PARAMS: #{params.inspect}"
  end
end
