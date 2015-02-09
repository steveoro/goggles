# encoding: utf-8
require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_meeting_entry_builder'

require_relative '../../../lib/data_import/services/data_import_team_builder'
require_relative '../../../lib/data_import/services/data_import_swimmer_builder'
require_relative '../../../lib/data_import/services/data_import_badge_builder'


describe DataImportMeetingEntryBuilder, type: :integration do

  # *** PSEUDO RANDOM OR MISSING Fixture params ***
  # Context variables for existing categories & meeting programs, but non-existing
  # MeetingEntries or DataImporMeetingEntries:
  let(:rand_meeting)          { Meeting.where( are_results_acquired: true ).sort{ rand - 0.5 }[0] }
  let(:rand_meeting_csi)      { Meeting.joins(:season_type).where( are_results_acquired: true, 'season_types.id' => 2 ).sort{ rand - 0.5 }[0] }

  let(:season)                { rand_meeting.season }
  let(:season_csi)            { rand_meeting_csi.season }

  let(:meeting_program)       { rand_meeting.meeting_programs.sort{ rand - 0.5 }[0] }
  let(:meeting_program_csi)   { rand_meeting_csi.meeting_programs.sort{ rand - 0.5 }[0] }

  let(:gender_type)           { meeting_program.gender_type }
  let(:gender_type_csi)       { meeting_program_csi.gender_type }

  let(:badge) do
    random_season_category = season.category_types.is_valid.are_not_relays.sort{ rand - 0.5 }[0]
# DEBUG
#    puts "\r\n- random_season_category: " << random_season_category.inspect
    create(
      :badge,
      team_affiliation: create(:team_affiliation, season: season),
      category_type: random_season_category
    )
  end
  let(:badge_csi) do
    random_season_category_csi = season_csi.category_types.is_valid.are_not_relays.sort{ rand - 0.5 }[0]
# DEBUG
#    puts "\r\n- random_season_category_csi: " << random_season_category_csi.inspect
    create(
      :badge,
      team_affiliation: create(:team_affiliation, season: season_csi),
      category_type: random_season_category_csi
    )
  end


  let(:data_import_session)   { create( :data_import_session, season: season ) }
  let(:di_meeting_program) do
    create(
      :data_import_meeting_program_individual,
      data_import_session: data_import_session
    )
  end

  let(:detail_row_idx)        { (rand * 50).to_i }  # Used to compute the esteemed heat begin time
  let(:detail_rows_size)      { (rand * 40).to_i }  # Used to compute the esteemed heat number

  # NOTE:
  # detail_row[:fields] => [
  #    :entry_order, :swimmer_name, :category_group, :team_name, entry_time
  # ]
  let(:detail_row) do
    {
      import_text: Faker::Lorem.paragraph[0..250],
      fields: {
        entry_order:    build( :meeting_entry ).start_list_number,
        swimmer_name:   badge.swimmer.complete_name,
        category_group: badge.category_type.code,
        team_name:      badge.team.name,
        entry_time:     "0'#{((rand * 60) % 60).to_i}\"#{((rand * 100) % 100).to_i}"
      }
    }
  end
  let(:detail_row_csi) do
    CsiResultDAO.new(
      badge.swimmer.complete_name,
      badge.swimmer.year_of_birth,
      badge.team.name,
      '', # result_timing
      ("%02d" % ((rand * 60) % 60).to_i) + ("%02d" % ((rand * 100) % 100).to_i),
      '', # rank
      nil, # badge number
      1, # total_events
      CsiResultDAO.get_combo_category_code(
        meeting_program_csi.event_type.length_in_meters,
        meeting_program_csi.stroke_type.code,
        badge_csi.category_type.code
      ),
#      CsiResultDAO::CATEGORY_TYPE_CODES.keys.sort{ rand - 0.5 }[0],
      nil, # combined_key
      build( :meeting_entry ).start_list_number
    )
  end


  # *** FULLY EXISTING or matching entities: ***
  let(:mentry) do
    create(
      :meeting_entry,
      meeting_program: meeting_program,
      badge: badge
    )
  end
  let(:mentry_detail_row) do
    {
      import_text: Faker::Lorem.paragraph[0..250],
      fields: {
        entry_order:    mentry.start_list_number,
        swimmer_name:   mentry.badge.swimmer.complete_name,
        category_group: mentry.badge.category_type.code,
        team_name:      mentry.badge.team.name,
        entry_time:     "#{mentry.minutes}'#{mentry.seconds}\"#{mentry.hundreds}"
      }
    }
  end
  let(:mentry_detail_row_csi) do
    CsiResultDAO.new(
      mentry.swimmer.complete_name,
      mentry.swimmer.year_of_birth,
      mentry.team.name,
      '', # result_timing
      ("%02d" % (mentry.minutes)) + ("%02d" % (mentry.seconds)) + ("%02d" % (mentry.hundreds)),
      '', # rank
      badge_csi.number,
      1, # total_events
      CsiResultDAO.get_combo_category_code(
        meeting_program_csi.event_type.length_in_meters,
        meeting_program_csi.stroke_type.code,
        badge_csi.category_type.code
      ),
      nil, # combined_key
      mentry.start_list_number
    )
  end

  let(:di_mentry) do
    create(
      :data_import_meeting_entry,
      data_import_session: data_import_session,
      meeting_program: meeting_program,
      badge: badge
    )
  end
  let(:di_mentry_detail_row) do
    {
      import_text: Faker::Lorem.paragraph[0..250],
      fields: {
        entry_order:    di_mentry.start_list_number,
        swimmer_name:   di_mentry.swimmer.complete_name,
        category_group: di_mentry.badge.category_type.code,
        team_name:      di_mentry.team.name,
        entry_time:     "#{di_mentry.minutes}'#{di_mentry.seconds}\"#{di_mentry.hundreds}",
      }
    }
  end
  let(:di_mentry_detail_row_csi) do
    CsiResultDAO.new(
      di_mentry.swimmer.complete_name,
      di_mentry.swimmer.year_of_birth,
      di_mentry.team.name,
      '', # result_timing
      ("%02d" % (di_mentry.minutes)) + ("%02d" % (di_mentry.seconds)) + ("%02d" % (di_mentry.hundreds)),
      '', # rank
      badge_csi.number,
      1, # total_events
      CsiResultDAO.get_combo_category_code(
        meeting_program_csi.event_type.length_in_meters,
        meeting_program_csi.stroke_type.code,
        badge_csi.category_type.code
      ),
      nil, # combined_key
      di_mentry.start_list_number
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "[NO matching MeetingEntry (but existing MeetingProgram)]" do
    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportMeetingEntry.count }.by(1)
    end
    it "doesn't create any primary entity row" do
      expect{ subject }.not_to change{ MeetingEntry.count }
    end
    it "doesn't create any additional MeetingProgram row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingProgram.count }.by(1)
    end
    it "doesn't create any DataImportMeetingProgram row" do
      expect{ subject }.not_to change{ DataImportMeetingProgram.count }
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingEntry )
      end
    end
    describe "#result_id" do
      it "returns a positive ID since the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end


  context "after a self.build() with NO matching primary entity (but existing MeetingProgram)," do
    context "with a FIN startlist," do
      subject do
        DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season,
          meeting_program,
          detail_row, detail_row_idx, detail_rows_size,
          gender_type,
          true # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[NO matching MeetingEntry (but existing MeetingProgram)]"
    end

    context "with a CSI startlist," do
      subject do
        DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season_csi,
          meeting_program_csi,
          detail_row_csi, detail_row_idx, detail_rows_size,
          gender_type_csi,
          true # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[NO matching MeetingEntry (but existing MeetingProgram)]"
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with NO matching primary entity (but existing DataImportMeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching primary entity (and its MeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching secondary entity (w/ DataImportMeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++
end