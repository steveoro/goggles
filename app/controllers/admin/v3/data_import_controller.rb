# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'


=begin

= Admin::V3::DataImportController

  - version:  4.00.809
  - author:   Steve A.

  Third incarnation of the Admin-interface/Data-import controller.

=end
class Admin::V3::DataImportController < ApplicationController

  layout 'admin_v3_data_import'


  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_admin!
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  def index
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  # === Params:
  # - TODO
  #
  def parse_file
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def team_analysis
    # TODO
  end


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def team_confirm
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def swimmer_analysis
    # TODO
  end


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def swimmer_confirm
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def edit
    # TODO
  end


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def commit
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  # === Params:
  # - ':session_id':    the Data-Import session ID to be processed
  #
  def destroy
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++
end
