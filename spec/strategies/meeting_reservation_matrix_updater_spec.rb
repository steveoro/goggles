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


  context "when created with empty params but a valid current_user," do
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


  # This tests that the checkbox IDs do not get confused as possible fields:
  context "when created with some invalid params but a valid current_user," do
    let(:params) do
      {
        "chk_#{ MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING }1" => "1",
        "chk_#{ MeetingReservationMatrixProcessor::DOM_PRE_RES_CONFIRMED }2" => "1",
        "not-a-key-indeed_1" => "1"
      }
    end
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



    shared_examples_for "toggling ON a single generic reservation" do |field_name|
      it_behaves_like "a valid MeetingReservationMatrixUpdater freshly created instance"
      it "has 1 processed rows and 0 errors (after a successful #call)" do
        expect( subject.call ).to be true
# DEBUG
#        puts "\r\n------------8<------------"
#        puts "#{ subject.sql_diff_text_log }"
#        puts "------------8<------------"
        expect( subject.total_errors ).to eq(0)
        expect( subject.processed_rows ).to eq(1)
      end
      it "returns an SQL UPDATE log with the checked event (after a successful #call)" do
        expect( subject.call ).to be true
        expect( subject.sql_diff_text_log ).to include( "`#{ field_name }`=1" )
      end
    end



    shared_examples_for "toggling OFF an EVENT TIMING" do
      it_behaves_like "a valid MeetingReservationMatrixUpdater freshly created instance"
      it "has 1 processed rows and 0 errors (after a successful #call)" do
        expect( subject.call ).to be true
# DEBUG
#        puts "\r\n------------8<------------"
#        puts "#{ subject.sql_diff_text_log }"
#        puts "------------8<------------"
        expect( subject.total_errors ).to eq(0)
        expect( subject.processed_rows ).to eq(1)
      end
      it "returns an SQL UPDATE log with zero timing and unchecked event (after a successful #call)" do
        expect( subject.call ).to be true
        expect( subject.sql_diff_text_log ).to include(
          "`suggested_minutes`=0, `suggested_seconds`=0, `suggested_hundreds`=0"
        )
        expect( subject.sql_diff_text_log ).to include( "`is_doing_this`=0" )
      end
    end



    shared_examples_for "toggling OFF a single generic reservation" do |field_name|
      it_behaves_like "a valid MeetingReservationMatrixUpdater freshly created instance"
      it "has 1 processed rows and 0 errors (after a successful #call)" do
        expect( subject.call ).to be true
# DEBUG
#        puts "\r\n------------8<------------"
#        puts "#{ subject.sql_diff_text_log }"
#        puts "------------8<------------"
        expect( subject.total_errors ).to eq(0)
        expect( subject.processed_rows ).to eq(1)
      end
      it "returns an SQL UPDATE log with the un-checked event (after a successful #call)" do
        expect( subject.call ).to be true
        expect( subject.sql_diff_text_log ).to include( "`#{ field_name }`=0" )
      end
    end


    # --- INDIVIDUAL EVENT RESERVATION ---
    context "with an existing EVENT reservation," do
      let(:res_event) { FactoryGirl.create(:meeting_event_reservation) }

      context "when editing an EVENT TIMING with values," do
        let(:suggested_seconds)   { 37 }
        let(:suggested_hundreds)  { 18 }
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_TIMING }#{ res_event.id }" => "#{ suggested_seconds }\"#{ suggested_hundreds }" }
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
            "`suggested_minutes`=0, `suggested_seconds`=#{ suggested_seconds }, `suggested_hundreds`=#{ suggested_hundreds }"
          )
        end
      end

      # *** Toggle ON ***
      context "when checking an EVENT TIMING with true (value)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_CHECKED }#{ res_event.id }" => true }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling ON a single generic reservation", 'is_doing_this' )
      end

      context "when checking an EVENT TIMING with 'true' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_CHECKED }#{ res_event.id }" => 'true' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling ON a single generic reservation", 'is_doing_this' )
      end

      context "when checking an EVENT TIMING with 1 (value)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_CHECKED }#{ res_event.id }" => 1 }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling ON a single generic reservation", 'is_doing_this' )
      end

      context "when checking an EVENT TIMING with '1' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_CHECKED }#{ res_event.id }" => '1' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling ON a single generic reservation", 'is_doing_this' )
      end


      # *** Toggle OFF ***
      context "when UN-checking an EVENT TIMING with false (value)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_CHECKED }#{ res_event.id }" => false }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like "toggling OFF an EVENT TIMING"
      end

      context "when UN-checking an EVENT TIMING with 'false' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_CHECKED }#{ res_event.id }" => 'false' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like "toggling OFF an EVENT TIMING"
      end

      context "when UN-checking an EVENT TIMING with 0 (value)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_CHECKED }#{ res_event.id }" => 0 }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like "toggling OFF an EVENT TIMING"
      end

      context "when UN-checking an EVENT TIMING with '0' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_CHECKED }#{ res_event.id }" => '0' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like "toggling OFF an EVENT TIMING"
      end

      context "when UN-checking an EVENT TIMING with '' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_EVENT_CHECKED }#{ res_event.id }" => '' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like "toggling OFF an EVENT TIMING"
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    # --- RELAY (EVENT) RESERVATION ---
    context "with an existing RELAY reservation," do
      let(:res_event) { FactoryGirl.create(:meeting_relay_reservation) }

      context "when editing a RELAY RES with notes," do
        let(:notes)  { FFaker::Lorem.word }
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_NOTES }#{ res_event.id }" => notes }
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
        it "returns an SQL log with the notes (after a successful #call)" do
          expect( subject.call ).to be true
          expect( subject.sql_diff_text_log ).to include( "`notes`='#{ notes }'" )
        end
      end

      # *** Toggle ON ***
      context "when checking a RELAY RES with true (value)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_CHECKED }#{ res_event.id }" => true }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling ON a single generic reservation", 'is_doing_this' )
      end

      context "when checking a RELAY RES with 'true' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_CHECKED }#{ res_event.id }" => 'true' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling ON a single generic reservation", 'is_doing_this' )
      end

      context "when checking a RELAY RES with 1 (value)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_CHECKED }#{ res_event.id }" => 1 }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling ON a single generic reservation", 'is_doing_this' )
      end

      context "when checking a RELAY RES with '1' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_CHECKED }#{ res_event.id }" => '1' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling ON a single generic reservation", 'is_doing_this' )
      end


      # *** Toggle OFF ***
      context "when UN-checking a RELAY RES with false (value)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_CHECKED }#{ res_event.id }" => false }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
         it_behaves_like( "toggling OFF a single generic reservation", 'is_doing_this' )
      end

      context "when UN-checking a RELAY RES with 'false' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_CHECKED }#{ res_event.id }" => 'false' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling OFF a single generic reservation", 'is_doing_this' )
      end

      context "when UN-checking a RELAY RES with 0 (value)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_CHECKED }#{ res_event.id }" => 0 }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling OFF a single generic reservation", 'is_doing_this' )
      end

      context "when UN-checking a RELAY RES with '0' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_CHECKED }#{ res_event.id }" => '0' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling OFF a single generic reservation", 'is_doing_this' )
      end

      context "when UN-checking a RELAY RES with '' (string)," do
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RELAY_CHECKED }#{ res_event.id }" => '' }
        end
        subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
        it_behaves_like( "toggling OFF a single generic reservation", 'is_doing_this' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    # --- MEETING (a.k.a. BADGE/ATHLETE/SWIMMER) RESERVATION ---
    context "with an existing MEETING reservation," do
      let(:res_event) { FactoryGirl.create(:meeting_reservation) }

      context "when editing the notes," do
        let(:notes)  { FFaker::Lorem.word }
        let(:params) do
          { "#{ MeetingReservationMatrixProcessor::DOM_PRE_RES_NOTES }#{ res_event.id }" => notes }
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
        it "returns an SQL log with the notes (after a successful #call)" do
          expect( subject.call ).to be true
          expect( subject.sql_diff_text_log ).to include( "`notes`='#{ notes }'" )
        end
      end

      [
        MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING,
        MeetingReservationMatrixProcessor::DOM_PRE_RES_CONFIRMED
      ].each do |field_prefix|
        # *** Toggle ON ***
        context "when checking field '#{field_prefix}' for the RES with true (value)," do
          let(:params) do
            { "#{ field_prefix }#{ res_event.id }" => true }
          end
          subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
          it_behaves_like(
            "toggling ON a single generic reservation",
            ( field_prefix == MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING ?
              'is_not_coming' : 'has_confirmed' )
          )
        end
        context "when checking field '#{field_prefix}' for the RES with 'true' (string)," do
          let(:params) do
            { "#{ field_prefix }#{ res_event.id }" => 'true' }
          end
          subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
          it_behaves_like(
            "toggling ON a single generic reservation",
            ( field_prefix == MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING ?
              'is_not_coming' : 'has_confirmed' )
          )
        end
        context "when checking field '#{field_prefix}' for the RES with 1 (value)," do
          let(:params) do
            { "#{ field_prefix }#{ res_event.id }" => 1 }
          end
          subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
          it_behaves_like(
            "toggling ON a single generic reservation",
            ( field_prefix == MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING ?
              'is_not_coming' : 'has_confirmed' )
          )
        end
        context "when checking field '#{field_prefix}' for the RES with '1' (string)," do
          let(:params) do
            { "#{ field_prefix }#{ res_event.id }" => '1' }
          end
          subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
          it_behaves_like(
            "toggling ON a single generic reservation",
            ( field_prefix == MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING ?
              'is_not_coming' : 'has_confirmed' )
          )
        end

        # *** Toggle OFF ***
        context "when UN-checking field '#{field_prefix}' for the RES with false (value)," do
          let(:params) { { "#{ field_prefix }#{ res_event.id }" => false } }
          subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
          it_behaves_like(
            "toggling OFF a single generic reservation",
            ( field_prefix == MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING ?
              'is_not_coming' : 'has_confirmed' )
          )
        end
        context "when UN-checking field '#{field_prefix}' for the RES with 'false' (string)," do
          let(:params) { { "#{ field_prefix }#{ res_event.id }" => 'false' } }
          subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
          it_behaves_like(
            "toggling OFF a single generic reservation",
            ( field_prefix == MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING ?
              'is_not_coming' : 'has_confirmed' )
          )
        end
        context "when UN-checking field '#{field_prefix}' for the RES with 0 (value)," do
          let(:params) { { "#{ field_prefix }#{ res_event.id }" => 0 } }
          subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
          it_behaves_like(
            "toggling OFF a single generic reservation",
            ( field_prefix == MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING ?
              'is_not_coming' : 'has_confirmed' )
          )
        end
        context "when UN-checking field '#{field_prefix}' for the RES with '0' (string)," do
          let(:params) { { "#{ field_prefix }#{ res_event.id }" => '0' } }
          subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
          it_behaves_like(
            "toggling OFF a single generic reservation",
            ( field_prefix == MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING ?
              'is_not_coming' : 'has_confirmed' )
          )
        end
        context "when UN-checking field '#{field_prefix}' for the RES with '' (string)," do
          let(:params) { { "#{ field_prefix }#{ res_event.id }" => '' } }
          subject { MeetingReservationMatrixUpdater.new( params, current_user ) }
          it_behaves_like(
            "toggling OFF a single generic reservation",
            ( field_prefix == MeetingReservationMatrixProcessor::DOM_PRE_RES_NOT_COMING ?
              'is_not_coming' : 'has_confirmed' )
          )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
