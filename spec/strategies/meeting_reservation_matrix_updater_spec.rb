# encoding: utf-8
require 'rails_helper'
require 'meeting_reservation_matrix_updater'


describe MeetingReservationMatrixUpdater, type: :strategy do
  # [Steve] We don't need to save the random user instance created, since we
  # won't use any of its associations, nor its ID, so "build" is enough.
  subject { MeetingReservationMatrixUpdater.new( {}, current_user: FactoryGirl.build(:user) ) }

  it_behaves_like( "(the existance of a method)", [
    :reservation_keys,
    :processed_rows, :total_errors,
    :expected_rows_count,
    :call
  ] )
  #-- -------------------------------------------------------------------------
  #++


  context "when created with nil params and current_user," do
    it "throws an Argument error" do
      expect{ MeetingReservationMatrixUpdater.new( nil, nil ) }.to raise_error{ ArgumentError }
    end
  end


  context "when created with nil params and a valid current_user," do
    let(:current_user)  { FactoryGirl.build(:user) }

    it "throws an Argument error" do
      expect{ MeetingReservationMatrixUpdater.new( nil, current_user ) }.to raise_error{ ArgumentError }
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when created with empty params and a valid current_user," do
    let(:params)        { {} }
    let(:current_user)  { FactoryGirl.build(:user) }
    subject { MeetingReservationMatrixUpdater.new( params, current_user ) }

    it "is a valid instance" do
      expect( subject ).to be_a( MeetingReservationMatrixUpdater )
    end
    it "has an empty #reservation_keys" do
      expect( subject.reservation_keys ).to be_empty
    end
    it "has 0 #expected_rows_count" do
      expect( subject.expected_rows_count ).to eq(0)
    end
    it "returns true for #call" do
      expect( subject.call ).to be true
    end
    it "returns 0 #total_errors after #call" do
      expect( subject.call ).to be true
      expect( subject.total_errors ).to eq(0)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "a valid MeetingReservationMatrixUpdater freshly created instance" do
    it "is a valid instance" do
      expect( subject ).to be_a( MeetingReservationMatrixUpdater )
    end
    it "has the expected type and count of keys" do
      expect( subject.reservation_keys ).to eq( params.keys )
    end
    it "has #expected_rows_count == to the number of specified keys" do
      expect( subject.expected_rows_count ).to eq( params.keys.count )
    end
  end


  context "when created with valid params and valid current_user," do
    let(:current_user)  { FactoryGirl.build(:user) }

    context "with some MISSING but edited meeting reservations," do
      let(:missing_res_id) { MeetingReservation.count > 0 ? MeetingReservation.last + 10000 : 100 }
      let(:params) do
        {
          "#{ MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING }#{ missing_res_id }"=>"1",
          "#{ MeetingReservationMatrixProcessor::DOM_PRE_RES_CONFIRMED }#{ missing_res_id }"=>"1"
        }
      end
      subject { MeetingReservationMatrixUpdater.new( params, current_user ) }

      it_behaves_like "a valid MeetingReservationMatrixUpdater freshly created instance"

      it "has 0 processed rows and 2 errors after #call (while being false)" do
        expect( subject.call ).to be false
        expect( subject.processed_rows ).to eq(0)
        expect( subject.total_errors ).to eq(2)
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "with some existing and edited meeting reservations," do
      let(:res_event) { FactoryGirl.create(:meeting_event_reservation) }

      context "when setting a new event timing with values," do
        let(:suggested_minutes)   { 0 }
        let(:suggested_seconds)   { 37 }
        let(:suggested_hundreds)  { 18 }
        let(:params) do
          {
            "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_TIMING }#{ res_event.id }" => "#{ suggested_seconds }\'#{ suggested_hundreds }\"",
          }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }

        it_behaves_like "a valid MeetingReservationMatrixUpdater freshly created instance"

        it "has 1 processed rows and 0 errors (after a successful #call)" do
          expect( subject.call ).to be true
# DEBUG
#          puts "\r\n------------8<------------"
#          puts "#{ subject.sql_diff_text_log }"
#          puts "------------8<------------"
          expect( subject.total_errors ).to eq(0)
          expect( subject.processed_rows ).to eq(1)
        end
        it "returns an SQL log stating that the timing is the expected value (after a successful #call)" do
          expect( subject.call ).to be true
          expect( subject.sql_diff_text_log ).to include(
            "`suggested_minutes`=#{suggested_minutes}, `suggested_seconds`=#{suggested_seconds}, `suggested_hundreds`=#{suggested_hundreds}"
          )
        end
      end


      context "when clearing a new event timing with values," do
        let(:params) do
          {
            "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_TIMING }#{ res_event.id }" => "",
          }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }

        it_behaves_like "a valid MeetingReservationMatrixUpdater freshly created instance"

        it "has 1 processed rows and 0 errors (after a successful #call)" do
          expect( subject.call ).to be true
# DEBUG
          puts "\r\n------------8<------------"
          puts "#{ subject.sql_diff_text_log }"
          puts "------------8<------------"
          expect( subject.total_errors ).to eq(0)
          expect( subject.processed_rows ).to eq(1)
        end
        it "returns an SQL log stating that the timing is zero (after a successful #call)" do
          expect( subject.call ).to be true
          expect( subject.sql_diff_text_log ).to include(
            "`suggested_minutes`=0, `suggested_seconds`=0, `suggested_hundreds`=0"
          )
        end
      end


      context "when checking an event timing," do

      end


      context "when un-checking an event timing," do

      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "with some existing and edited relay reservations," do
      let(:params) do
        {

        }
      end
      subject { MeetingReservationMatrixUpdater.new( params, current_user ) }

      it "is a valid instance" do
        expect( subject ).to be_a( MeetingReservationMatrixUpdater )
      end

      # TODO
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
