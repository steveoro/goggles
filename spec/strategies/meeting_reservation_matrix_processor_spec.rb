# encoding: utf-8
require 'rails_helper'
require 'meeting_reservation_matrix_processor'


describe MeetingReservationMatrixProcessor, type: :strategy do

  it_behaves_like "MeetingReservationMatrixProcessor (not checking results after #call)", MeetingReservationMatrixProcessor
  #-- -------------------------------------------------------------------------
  #++
end
