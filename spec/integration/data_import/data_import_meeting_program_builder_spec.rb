# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_meeting_program_builder'


describe DataImportMeetingProgramBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Existing or matching fixture params:
  let(:meeting_program)       { create( :meeting_program ) }

  # Non-existing (totally random) fixture params. Rebuild a plausible event & program
  # starting from the meeting session:
  let(:meeting_session)       { create( :meeting_session ) }
  let(:season)                { meeting_session.meeting.season }
  let(:gender_type)           { GenderType.find( 1 + (rand * 10).to_i % 2 ) }
  let(:event_type) do
    EventsByPoolType.only_for_meetings
    .for_pool_type_code(
      meeting_session.swimming_pool.pool_type.code
    ){ rand - 0.5 }[0].event_type
  end
  let(:category_type) do
    event_type.is_a_relay ?
    CategoryType.is_valid.only_relays.sort{ rand - 0.5 }[0] :
    CategoryType.is_valid.are_not_relays.sort{ rand - 0.5 }[0]
  end
  let(:stroke_type)           { event_type.stroke_type }
  let(:length_in_meters)      { event_type.length_in_meters }
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
    {
      import_text: Faker::Lorem.paragraph[0..99],
      fields: {
        distance:       length_in_meters.to_s,
        style:          stroke_type.code,
        gender:         gender_type.code,
        category_group: category_type.code,
        base_time:      "%2d'%02d\"%02d" % [time_standard.minutes, time_standard.seconds, time_standard.hundreds]
      }
    }
  end
  let(:scheduled_date)        { meeting_session.scheduled_date }
  # This is just used to compute the esteemed heat begin time:
  let(:header_index)          { (rand * 50).to_i }
  # This is just used to compute the esteemed heat number:
  let(:detail_rows_size)      { (rand * 40).to_i }
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with NO matching MeetingProgram (and NO MeetingEvent)," do
    subject do
      DataImportMeetingProgramBuilder.build_from_parameters(
        data_import_session,
        season, meeting_session,
        header_row, header_index,
        gender_type, category_type, stroke_type,
        length_in_meters, scheduled_date,
        detail_rows_size
      )
    end

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
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
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with a matching MeetingProgram (and its MeetingEvent)," do
    subject do
      DataImportMeetingProgramBuilder.build_from_parameters(
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

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "doesn't create any additional primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingProgram.count }.by(1)
    end
    it "doesn't create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportMeetingProgram.count }
    end
    it "doesn't create any additional MeetingEvent row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingEvent.count }.by(1)
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
  #-- -------------------------------------------------------------------------
  #++
end
