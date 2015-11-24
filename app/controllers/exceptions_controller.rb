# encoding: utf-8


=begin

= ExceptionsController

  - version:  4.00.839
  - author:   Steve A.

  Exceptions controller.
=end
class ExceptionsController < ApplicationController
  layout 'application'


  # Catches & renders a generic application error
  def render_error
    @exception = env["action_dispatch.exception"]
    @status_code = ActionDispatch::ExceptionWrapper.new( env, @exception ).status_code
    log_error( @exception, true ) if @exception
    render :error_page, status: @status_code, layout: true
  end
end
