# encoding: utf-8

require 'rails_helper'
require 'common/format'
require 'ffaker'

describe MeetingReservationsSummaryDAO, type: :model do

  let(:swimmer)             { Swimmer.first(300).sample }
  let(:swimmer_id)          { swimmer.id }
  let(:swimmer_name)        { swimmer.complete_name }
  let(:gender_code)         { swimmer.gender_type.code }
  let(:category_code)       { CategoryType.where( season_id: [191, 192] ).sample.code }
  let(:event_code)          { EventType.are_not_relays.sample.code }
  let(:minutes)             { (rand * 2).to_i }
  let(:seconds)             { (rand * 59).to_i }
  let(:hundreds)            { (rand * 99).to_i }
  let(:suggested_time)      { Timing.new( hundreds, seconds, minutes ) }
  let(:fraction)            { (rand * 4).to_i + 1 }
  let(:meeting)             { Meeting.last(100).sample }

  context "IndividualEventReservationDAO subelement," do

    subject { MeetingReservationsSummaryDAO::IndividualEventReservationDAO.new( event_code ) }

    it_behaves_like( "(the existance of a method)", [
      :event_code,
      :suggested_time
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values" do
        expect( subject.event_code ).to eq( event_code )
        expect( subject.suggested_time ).to be_nil
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        result = MeetingReservationsSummaryDAO::IndividualEventReservationDAO.new( event_code, suggested_time )
        expect( result.event_code ).to eq( event_code )
        expect( result.suggested_time ).to eq( suggested_time )
      end
    end

    describe "#get_timing" do
      it "returns a '-' string if no suggested_time" do
        expect( subject.suggested_time ).to be_nil
        result = subject.get_timing
        expect( result ).to be_an_instance_of( String )
        expect( result ).to eq( '-' )
      end
      it "returns a string containing hundreds and seconds of suggested_time" do
        result = MeetingReservationsSummaryDAO::IndividualEventReservationDAO.new( event_code, suggested_time )
        expect( result.get_timing ).to be_an_instance_of( String )
        expect( result.get_timing ).to include( suggested_time.hundreds.to_s )
        expect( result.get_timing ).to include( suggested_time.seconds.to_s )
      end
      it "returns a string not containing minutes of suggested_time if zero" do
        result = MeetingReservationsSummaryDAO::IndividualEventReservationDAO.new( event_code, Timing.new( hundreds, seconds ) )
        expect( result.suggested_time.minutes ).to eq( 0 )
        expect( result.get_timing ).to be_an_instance_of( String )
        expect( result.get_timing ).to include( hundreds.to_s )
        expect( result.get_timing ).to include( seconds.to_s )
        expect( result.get_timing.size ).to be <= 5
      end
      it "returns a string containing minutes of suggested_time greater than zero" do
        result = MeetingReservationsSummaryDAO::IndividualEventReservationDAO.new( event_code, Timing.new( hundreds, seconds, minutes + 1 ) )
        expect( result.suggested_time.minutes ).to be > 0
        expect( result.get_timing ).to be_an_instance_of( String )
        expect( result.get_timing ).to include( result.suggested_time.hundreds.to_s )
        expect( result.get_timing ).to include( result.suggested_time.seconds.to_s )
        expect( result.get_timing ).to include( result.suggested_time.minutes.to_s )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "RelayReservationDAO subelement," do

    subject { MeetingReservationsSummaryDAO::RelayReservationDAO.new( event_code ) }

    it_behaves_like( "(the existance of a method)", [
      :event_code,
      :fraction
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values" do
        expect( subject.event_code ).to eq( event_code )
        expect( subject.fraction ).to be_nil
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        result = MeetingReservationsSummaryDAO::RelayReservationDAO.new( event_code, fraction )
        expect( result.event_code ).to eq( event_code )
        expect( result.fraction ).to eq( fraction )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "SwimmerReservationsDAO subelement," do

    subject { MeetingReservationsSummaryDAO::SwimmerReservationsDAO.new( swimmer_id, swimmer_name, gender_code ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer_id, :swimmer_name, :gender_code,
      :category_code
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :individual_reservations, :relay_reservations
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values" do
        expect( subject.swimmer_id ).to eq( swimmer_id )
        expect( subject.swimmer_name ).to eq( swimmer_name )
        expect( subject.gender_code ).to eq( gender_code )
        expect( subject.category_code ).to be_nil
        expect( subject.individual_reservations.size ).to eq( 0 )
        expect( subject.relay_reservations.size ).to eq( 0 )
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        result = MeetingReservationsSummaryDAO::SwimmerReservationsDAO.new( swimmer_id, swimmer_name, gender_code, category_code )
        expect( result.swimmer_id ).to eq( swimmer_id )
        expect( result.swimmer_name ).to eq( swimmer_name )
        expect( result.gender_code ).to eq( gender_code )
        expect( result.category_code ).to eq( category_code )
        expect( result.individual_reservations.size ).to eq( 0 )
        expect( result.relay_reservations.size ).to eq( 0 )
      end
    end

    describe "#add_individual_reservation" do
      it "increases individual event reservations count" do
        prev_count = subject.individual_reservations.size
        count = subject.add_individual_reservation( event_code )
        expect( count ).to eq( prev_count + 1 )
        expect( subject.individual_reservations.size ).to eq( count )
      end

      it "sets the given result key in individual event reservations structure" do
        wrong_eve = '_NOT_' # Event surely not already present
        another_eve = '130FO' # Event surely not already present
        subject.add_individual_reservation( event_code )
        count = subject.add_individual_reservation( another_eve )
        expect( subject.individual_reservations.size ).to eq( count )
        expect( subject.individual_reservations.has_key?( event_code )).to eq( true )
        expect( subject.individual_reservations.has_key?( another_eve )).to eq( true )
        expect( subject.individual_reservations.has_key?( wrong_eve )).to eq( false )
      end

      it "sets the given event code and suggested time in the individual event reservations structure" do
        subject.add_individual_reservation( event_code, suggested_time )
        expect( subject.individual_reservations[event_code].event_code ).to eq( event_code )
        expect( subject.individual_reservations[event_code].suggested_time ).to eq( suggested_time )
      end
    end

    describe "#add_relay_reservation" do
      it "increases relay event reservations count" do
        prev_count = subject.relay_reservations.size
        count = subject.add_relay_reservation( event_code )
        expect( count ).to eq( prev_count + 1 )
        expect( subject.relay_reservations.size ).to eq( count )
      end

      it "sets the given result key in relay event reservations structure" do
        wrong_eve = '_NOT_' # Event surely not already present
        another_eve = '130FO' # Event surely not already present
        subject.add_relay_reservation( event_code )
        count = subject.add_relay_reservation( another_eve )
        expect( subject.relay_reservations.size ).to eq( count )
        expect( subject.relay_reservations.has_key?( event_code )).to eq( true )
        expect( subject.relay_reservations.has_key?( another_eve )).to eq( true )
        expect( subject.relay_reservations.has_key?( wrong_eve )).to eq( false )
      end

      it "sets the given event code and fraction in the relay event reservations structure" do
        subject.add_relay_reservation( event_code, fraction )
        expect( subject.relay_reservations[event_code].event_code ).to eq( event_code )
        expect( subject.relay_reservations[event_code].fraction ).to eq( fraction )
      end
    end

    describe "#get_individual_reservation" do
      it "returns nil if event key doesn't exists" do
        expect( subject.individual_reservations.has_key?( event_code )).to eq( false )
        expect( subject.get_individual_reservation( event_code )).to be_nil
      end
      it "returns a IndividualEventReservationDAO if event key exists" do
        subject.add_individual_reservation( event_code, suggested_time )
        expect( subject.individual_reservations.has_key?( event_code )).to eq( true )
        expect( subject.get_individual_reservation( event_code )).to be_an_instance_of( MeetingReservationsSummaryDAO::IndividualEventReservationDAO )
      end
    end

    describe "#get_relay_reservation" do
      it "returns nil if event key doesn't exists" do
        expect( subject.relay_reservations.has_key?( event_code )).to eq( false )
        expect( subject.get_relay_reservation( event_code )).to be_nil
      end
      it "returns a RelayReservationDAO if event key exists" do
        subject.add_relay_reservation( event_code, fraction )
        expect( subject.relay_reservations.has_key?( event_code )).to eq( true )
        expect( subject.get_relay_reservation( event_code )).to be_an_instance_of( MeetingReservationsSummaryDAO::RelayReservationDAO )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "MeetingReservationsSummaryDAO general element," do

    subject { MeetingReservationsSummaryDAO.new( meeting ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting,
      :updated_at
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :reservations
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values, default values and initialize empty data structures" do
        expect( subject.meeting ).to eq( meeting )
        expect( subject.updated_at ).to eq( 0 )
        expect( subject.reservations.size ).to eq( 0 )
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        updated_at = Date.today() - (rand * 1000).to_i
        result = MeetingReservationsSummaryDAO.new( meeting, updated_at )
        expect( result.meeting ).to eq( meeting )
        expect( result.updated_at ).to eq( updated_at )
        expect( result.reservations.size ).to eq( 0 )
      end
    end

    describe "#get_swimmer_key" do
      it "returns a string" do
        expect( subject.get_swimmer_key( swimmer_id, swimmer_name )).to be_an_instance_of( String )
      end
      it "returns a string containing swimmer's name and id '-' separated" do
        result = subject.get_swimmer_key( swimmer_id, swimmer_name )
        expect( result ).to include( swimmer_name )
        expect( result ).to include( swimmer_id.to_s )
        expect( result ).to include( '-' )
      end
      it "returns a string containing only swimmer name '-' separator and swimmer id" do
        result = subject.get_swimmer_key( swimmer_id, swimmer_name )
        expect( result ).to eq( "#{swimmer_name}-#{swimmer_id}" )
      end
    end

    describe "#create_swimmer_reservations" do
      it "returns a SwimmerReservationsDAO and increase reservations size when called without optional parameters" do
        prev_count = subject.reservations.size
        expect( subject.create_swimmer_reservations( swimmer_id, swimmer_name, gender_code )).to be_an_instance_of( MeetingReservationsSummaryDAO::SwimmerReservationsDAO )
        expect( subject.reservations.size ).to eq( prev_count + 1 )
      end
      it "returns a SwimmerReservationsDAO and increase reservations size when called with optional parameters" do
        prev_count = subject.reservations.size
        expect( subject.create_swimmer_reservations( swimmer_id, swimmer_name, gender_code, category_code )).to be_an_instance_of( MeetingReservationsSummaryDAO::SwimmerReservationsDAO )
        expect( subject.reservations.size ).to eq( prev_count + 1 )
      end
    end

    describe "#get_swimmer_reservations" do
      it "returns nil if swimmer key doesn't exists" do
        expect( subject.reservations.has_key?( subject.get_swimmer_key( swimmer_id, swimmer_name ) )).to eq( false )
        expect( subject.get_swimmer_reservations( swimmer_id, swimmer_name )).to be_nil
      end
      it "returns a SwimmerReservationsDAO if swimmer key exists" do
        subject.create_swimmer_reservations( swimmer_id, swimmer_name, gender_code )
        expect( subject.reservations.has_key?( subject.get_swimmer_key( swimmer_id, swimmer_name ) )).to eq( true )
        expect( subject.get_swimmer_reservations( swimmer_id, swimmer_name )).to be_an_instance_of( MeetingReservationsSummaryDAO::SwimmerReservationsDAO )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- -------------------------------------------------------------------------
#++
