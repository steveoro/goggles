# encoding: utf-8


=begin

= ExceptionsController

  - version:  6.002
  - author:   Steve A.

  Exceptions controller.
=end
class ExceptionsController < ApplicationController
  layout 'application'

  # Catches & renders a generic application error
  def error_page
    @status_code = params[:error]
    log_error( @status_code, true ) if @status_code
    render 'error_page', status: @status_code, layout: true
  end
  #-- -------------------------------------------------------------------------
  #++
end
