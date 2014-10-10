# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_meeting_program_builder'


describe DataImportMeetingProgramBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params:
  let(:meeting_session)       { create( :meeting_session ) }
  let(:season)                { meeting_session.meeting.season }
  let(:gender_type)           { GenderType.all.sort{ rand - 0.5 }[0] }
  let(:category_type)         { CategoryType.all.sort{ rand - 0.5 }[0] }
  let(:stroke_type)           { StrokeType.all.sort{ rand - 0.5 }[0] }
  let(:event_type)            { EventType.all.sort{ rand - 0.5 }[0] }
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
  # NOTE:
  # header_row[:fields] => [ :distance, :style, :gender, :category_group, :base_time ]
  let(:header_row) do
    {
      import_text: "#{Faker::Lorem.word} meeting - organized by #{Faker::Lorem.word} team",
      fields: {
        distance: length_in_meters.to_s,
        style: stroke_type.code,
        gender: gender_type.code,
        category_group: category_type.code,
        base_time: "%2d'%02d\"%02d" % [time_standard.minutes, time_standard.seconds, time_standard.hundreds]
      }
    }
  end
  let(:scheduled_date)        { meeting_session.scheduled_date }
  # This is just used to compute the esteemed heat begin time:
  let(:header_index)          { (rand * 50).to_i }
  # This is just used to compute the esteemed heat number:
  let(:detail_rows_size)      { (rand * 40).to_i }

  # Existing or matching fixture params:
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching MeetingProgram (but existing MeetingEvent)," do
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

    xit "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      xit "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    xit "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportMeetingProgram.count }.by(1)
    end
    describe "#result_row" do
      xit "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingProgram )
      end
    end
    describe "#result_id" do
      xit "returns a positive ID when the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
      end
      xit "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
