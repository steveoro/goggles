# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'


=begin

= Admin::V3::HomeController

  - version:  4.00.809
  - author:   Steve A.

  Third incarnation of the Admin-interface controller.

=end
class Admin::V3::HomeController < ApplicationController

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
end
