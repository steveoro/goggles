# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_meeting_program_builder'


describe V2::DataImportMeetingProgramBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (random, NOT-RELAY) fixture params. Rebuild a plausible event & program
  # starting from the meeting session:
  let(:meeting_session)       { create( :meeting_session ) }
  let(:season)                { meeting_session.meeting.season }
  #-- -------------------------------------------------------------------------
  #++


  # Returns an Hash having the same structure as the one returned by the Parser for
  # the context named ":relay_header":
  #
  #   {
  #     :import_text # => The original text parsed by the parsing service,
  #     :fields      # => An Hash with the keys:
  #                  #   [ :type, :distance, :style, :gender, :category_group, :base_time ]
  #   }
  #
  # Be aware that :import_text and :base_time are totally random.
  #
  # This is used, in turn, by each subject below to take additional decisions on what has
  # to be built with the main #build_from_parameters method.
  #
  def compose_header_row( type_text, distance_text, stroke_text, gender_text, category_text )
    {
      import_text: FFaker::Lorem.paragraph[0..99],
      fields: {
        type:           type_text,
        distance:       distance_text,
        style:          stroke_text,
        gender:         gender_text,
        category_group: category_text,
        base_time:      "%2d'%02d\"%02d" % [time_standard.minutes, time_standard.seconds, time_standard.hundreds]
      }
    }
  end
  #-- -------------------------------------------------------------------------
  #++


  let(:event_type) do
    EventsByPoolType.only_for_meetings.not_relays
    .for_pool_type_code(
      meeting_session.swimming_pool.pool_type.code
    ){ rand - 0.5 }[0].event_type
  end
  let(:category_type) do
    CategoryType.is_valid.are_not_relays.sort{ rand - 0.5 }[0]
  end
  let(:stroke_type)           { event_type.stroke_type }
  let(:length_in_meters)      { event_type.length_in_meters }
  let(:gender_type) do
    event_type.is_mixed_gender ? GenderType::MIXED_OR_ANY_ID : GenderType.find( 1 + (rand * 3).to_i % 2 )
  end
  let(:time_standard) do
    create(
      :time_standard,
      gender_type_id:   gender_type.id,
      pool_type_id:     meeting_session.swimming_pool.pool_type_id,
      category_type_id: category_type.id,
      event_type_id:    event_type.id
    )
  end
  let(:header_row) do
    compose_header_row(
      "#{ length_in_meters } #{ stroke_type.i18n_description.downcase }  #{ gender_type.i18n_description.downcase }",
      length_in_meters.to_s,
      stroke_type.code,
      gender_type.code,
      category_type.code
    )
  end
  let(:scheduled_date)        { meeting_session.scheduled_date }
  # This is just used to compute the esteemed heat begin time:
  let(:header_index)          { (rand * 50).to_i }
  # This is just used to compute the esteemed heat number:
  let(:detail_rows_size)      { (rand * 40).to_i }
  #-- -------------------------------------------------------------------------
  #++

  # Non-existing (random, RELAY-ONLY) fixture params. Rebuild a plausible event & program
  # starting from the meeting session:
  let(:event_type_relay) do
    EventsByPoolType.only_for_meetings.are_relays
    .for_pool_type_code(
      meeting_session.swimming_pool.pool_type.code
    ){ rand - 0.5 }[0].event_type
  end
  let(:category_type_relay)         { CategoryType.is_valid.only_relays.sort{ rand - 0.5 }[0] }
  let(:stroke_type_relay)           { event_type_relay.stroke_type }
  let(:length_in_meters_relay)      { event_type_relay.length_in_meters }
  let(:gender_type_relay) do
    event_type_relay.is_mixed_gender ? GenderType::MIXED_OR_ANY_ID : GenderType.find( 1 + (rand * 3).to_i % 2 )
  end
  let(:time_standard_relay) do
    create(
      :time_standard,
      gender_type_id:   gender_type_relay.id,
      pool_type_id:     meeting_session.swimming_pool.pool_type_id,
      category_type_id: category_type_relay.id,
      event_type_id:    event_type_relay.id
    )
  end
  let(:header_row_relay) do
    compose_header_row(
      "#{ event_type_relay.phases }x" <<
      "#{ event_type_relay.phase_length_in_meters } " <<
      "#{ stroke_type_relay.i18n_description.downcase }  " <<
      "#{ gender_type_relay.i18n_description.downcase }",
      length_in_meters_relay.to_s,
      stroke_type_relay.code,
      gender_type_relay.code,
      category_type_relay.code
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "building with NO matching MeetingProgram and NO MeetingEvent" do
    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportMeetingProgram.count }.by(1)
    end
    it "does not create a new primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.not_to change{ MeetingProgram.count }
    end
    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingProgram )
      end
    end
    describe "#result_id" do
      it "returns a positive ID when the resulting row is a data-import entity" do
# DEBUG
#        puts "\r\n- subject.result_id: #{subject.result_id.inspect}"
#        puts "- subject.result_row: #{subject.result_row.inspect}"
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
# DEBUG
#        puts "\r\n- subject.result_id: #{subject.result_id.inspect}"
#        puts "- subject.result_row: #{subject.result_row.inspect}"
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end


  context "after a self.build() with NO matching MeetingProgram (and NO MeetingEvent - Random RELAY event)," do
    subject do
      V2::DataImportMeetingProgramBuilder.build_from_parameters(
        data_import_session,
        season, meeting_session,
        header_row_relay, header_index,
        gender_type_relay, category_type_relay, stroke_type_relay,
        length_in_meters_relay, scheduled_date,
        detail_rows_size
      )
    end

    it_behaves_like( "building with NO matching MeetingProgram and NO MeetingEvent" )
  end


  context "after a self.build() with NO matching MeetingProgram (and NO MeetingEvent - Random NON-RELAY event)," do
    subject do
      V2::DataImportMeetingProgramBuilder.build_from_parameters(
        data_import_session,
        season, meeting_session,
        header_row, header_index,
        gender_type, category_type, stroke_type,
        length_in_meters, scheduled_date,
        detail_rows_size
      )
    end

    it_behaves_like( "building with NO matching MeetingProgram and NO MeetingEvent" )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Execute on actual real data: (ID 14216: FIN Parma 2014-12-14)
  Meeting.find( 14216 ).meeting_programs.each_with_index do |meeting_program, index|
    subject do
      V2::DataImportMeetingProgramBuilder.build_from_parameters(
        data_import_session,
        meeting_program.season,
        meeting_program.meeting_session,
        # base_time is the only one parsed inside the method:
        { fields: { base_time: meeting_program.time_standard ? meeting_program.time_standard.get_timing : '' } },
        header_index,   # rand
        meeting_program.gender_type,
        meeting_program.category_type,
        meeting_program.stroke_type,
        meeting_program.event_type.length_in_meters,
        meeting_program.meeting_session.scheduled_date,
        detail_rows_size # rand
      )
    end

    context "after a self.build() with existing MeetingProgram data (#{meeting_program.meeting.get_full_name}, #{meeting_program.get_full_name})," do
# DEBUG
#      before(:all) do
#        puts "\r\n\r\n----------------------8<-----------------------[#{index}]"
#        puts "*** #{meeting_program.event_type.i18n_short} ***"
#      end
      it "returns a V2::DataImportEntityBuilder instance" do
        expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
      end
      describe "#data_import_session" do
        it "is the DataImportSession specified for the build" do
          expect( subject.data_import_session ).to eq( data_import_session )
        end
      end
      it "doesn't create any primary entity row" do
        expect{ subject }.not_to change{ MeetingProgram.count }
      end
      it "doesn't create a new secondary entity row" do
        expect{ subject }.not_to change{ DataImportMeetingProgram.count }
      end
      it "doesn't create any MeetingEvent row" do
        expect{ subject }.not_to change{ MeetingEvent.count }
      end
      describe "#result_row" do
        it "returns a primary entity instance when the process is successful" do
          expect( subject.result_row ).to be_an_instance_of( MeetingProgram )
        end
      end
      describe "#result_id" do
        it "returns a negative ID when the resulting row is a primary entity" do
          expect( subject.result_id ).to be < 0
        end
        it "is the ID of the resulting row (with a minus sign)" do
          expect( subject.result_id ).to eq( -subject.result_row.id )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
