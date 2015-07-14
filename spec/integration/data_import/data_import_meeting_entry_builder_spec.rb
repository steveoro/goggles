# encoding: utf-8
require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_meeting_entry_builder'

require_relative '../../../app/data_import/v2/services/data_import_team_builder'
require_relative '../../../app/data_import/v2/services/data_import_swimmer_builder'
require_relative '../../../app/data_import/v2/services/data_import_badge_builder'


describe V2::DataImportMeetingEntryBuilder, type: :integration do

  shared_examples_for "[NO matching MeetingEntry (but existing MeetingProgram)]" do
    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
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


  # *** PSEUDO RANDOM OR 'MISSING' Fixtures data *** [Nothing found, but w/ existing MeetingProgram]
  # ================================================
  # Context variables for defining a case with existing categories & meeting programs,
  # but without any existing MeetingEntries or DataImporMeetingEntries
  #
  let(:rand_meeting)          { Meeting.where( are_results_acquired: true ).sort{ rand - 0.5 }[0] }
  let(:rand_meeting_csi)      { Meeting.joins(:season_type).where( are_results_acquired: true, 'season_types.id' => 2 ).sort{ rand - 0.5 }[0] }

  let(:season)                { rand_meeting.season }
  let(:season_csi)            { rand_meeting_csi.season }

  let(:meeting_program)       { rand_meeting.meeting_programs.are_not_relays.sort{ rand - 0.5 }[0] }
  let(:meeting_program_csi)   { rand_meeting_csi.meeting_programs.are_not_relays.sort{ rand - 0.5 }[0] }

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
  let(:detail_row_idx)        { (rand * 50).to_i }  # Used to compute the esteemed heat begin time
  let(:detail_rows_size)      { (rand * 40).to_i }  # Used to compute the esteemed heat number

  # NOTE:
  # detail_row[:fields] => [
  #    :entry_order, :swimmer_name, :category_group, :team_name, entry_time
  # ]
  let(:detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
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
      badge_csi.swimmer.complete_name,
      badge_csi.swimmer.year_of_birth,
      badge_csi.team.name,
      '', # result_timing
      ("%02d" % ((rand * 60) % 60).to_i) + ("%02d" % ((rand * 100) % 100).to_i),
      '', # rank
      nil, # badge number
      1, # total_events
      CsiResultDAO.get_combo_category_code(
        meeting_program_csi.event_type.length_in_meters,
        meeting_program_csi.stroke_type.code,
        badge_csi.category_type.code,
        badge_csi.swimmer.is_male
      ),
      nil, # combined_key
      build( :meeting_entry ).start_list_number
    )
  end


  context "after a self.build() with NO matching primary entity (but existing MeetingProgram)," do
    context "with a FIN startlist," do
      subject do
        V2::DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season,
          meeting_program,
          detail_row, detail_row_idx, detail_rows_size,
          gender_type, badge.category_type,
          true # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[NO matching MeetingEntry (but existing MeetingProgram)]"
    end

    context "with a CSI startlist," do
      subject do
        V2::DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season_csi,
          meeting_program_csi,
          detail_row_csi, detail_row_idx, detail_rows_size,
          gender_type_csi, badge_csi.category_type,
          true # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[NO matching MeetingEntry (but existing MeetingProgram)]"
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "[NO matching MeetingEntry (but existing DataImportMeetingProgram)]" do
    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
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
    it "doesn't create any additional DataImportMeetingProgram row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportMeetingProgram.count }.by(1)
    end
    it "doesn't create any additional MeetingProgram row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingProgram.count }.by(1)
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingEntry )
      end
    end
    describe "#result_id" do
      it "returns a positive ID when the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end


  # *** PSEUDO RANDOM OR 'MISSING' Fixtures data *** [Nothing found, but w/ existing DataImportMeetingProgram]
  # ================================================
  let(:di_meeting_program) do
    create(
      :data_import_meeting_program_individual,
      data_import_session: data_import_session,
      meeting_session:     meeting_program.meeting_session,
      category_type:       season.category_types.is_valid.are_not_relays.sort{ rand - 0.5 }[0]
    )
  end
  let(:di_meeting_program_csi) do
    create(
      :data_import_meeting_program_individual,
      data_import_session: data_import_session,
      meeting_session:     meeting_program_csi.meeting_session,
      category_type:       season_csi.category_types.is_valid.are_not_relays.sort{ rand - 0.5 }[0]
    )
  end

  let(:di_gender_type)        { di_meeting_program.gender_type }
  let(:di_gender_type_csi)    { di_meeting_program_csi.gender_type }

  let(:di_detail_row_csi) do
    CsiResultDAO.new(
      badge_csi.swimmer.complete_name,
      badge_csi.swimmer.year_of_birth,
      badge_csi.team.name,
      '', # result_timing
      ("%02d" % ((rand * 60) % 60).to_i) + ("%02d" % ((rand * 100) % 100).to_i),
      '', # rank
      nil, # badge number
      1, # total_events
      CsiResultDAO.get_combo_category_code(
        di_meeting_program_csi.event_type.length_in_meters,
        di_meeting_program_csi.stroke_type.code,
        badge_csi.category_type.code,
        badge_csi.swimmer.is_male
      ),
      nil, # combined_key
      build( :meeting_entry ).start_list_number
    )
  end


  context "after a self.build() with NO matching primary entity (but existing DataImportMeetingProgram)," do
    context "with a FIN startlist," do
      subject do
        V2::DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season,
          di_meeting_program,
          detail_row, detail_row_idx, detail_rows_size,
          di_gender_type, badge.category_type,
          true # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[NO matching MeetingEntry (but existing DataImportMeetingProgram)]"
    end

    context "with a CSI startlist," do
      subject do
        V2::DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season_csi,
          di_meeting_program_csi,
          di_detail_row_csi, detail_row_idx, detail_rows_size,
          di_gender_type_csi, badge_csi.category_type,
          true # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[NO matching MeetingEntry (but existing DataImportMeetingProgram)]"
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "[matching MeetingEntry (and its MeetingProgram)]" do
    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "doesn't create any additional primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingEntry.count }.by(1)
    end
    it "doesn't create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportMeetingEntry.count }
    end
    it "doesn't create any MeetingProgram row" do
      expect{ subject }.not_to change{ MeetingProgram.count }
    end
    it "doesn't create any DataImportMeetingProgram row" do
      expect{ subject }.not_to change{ DataImportMeetingProgram.count }
    end

    describe "#result_row" do
      it "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( MeetingEntry )
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


  # *** FULLY EXISTING or matching entities: *** [Primary found & existing MeetingProgram]
  # ============================================
  let(:mentry) do
    create(
      :meeting_entry,
      meeting_program: meeting_program,
      badge:           badge
    )
  end
  let(:mentry_detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        entry_order:    mentry.start_list_number,
        swimmer_name:   mentry.badge.swimmer.complete_name,
        category_group: mentry.badge.category_type.code,
        team_name:      mentry.badge.team.name,
        entry_time:     "#{mentry.minutes}'#{mentry.seconds}\"#{mentry.hundreds}"
      }
    }
  end
  let(:mentry_csi) do
    create(
      :meeting_entry,
      meeting_program: meeting_program_csi,
      badge:           badge_csi
    )
  end
  let(:mentry_detail_row_csi) do
    CsiResultDAO.new(
      mentry_csi.swimmer.complete_name,
      mentry_csi.swimmer.year_of_birth,
      mentry_csi.team.name,
      '', # result_timing
      ("%02d" % (mentry_csi.minutes)) + ("%02d" % (mentry_csi.seconds)) + ("%02d" % (mentry_csi.hundreds)),
      '', # rank
      badge_csi.number,
      1, # total_events
      CsiResultDAO.get_combo_category_code(
        meeting_program_csi.event_type.length_in_meters,
        meeting_program_csi.stroke_type.code,
        badge_csi.category_type.code,
        badge_csi.swimmer.is_male
      ),
      nil, # combined_key
      mentry_csi.start_list_number
    )
  end


  context "after a self.build() with a matching primary entity (and its MeetingProgram)," do
    context "with a FIN startlist," do
      subject do
# DEBUG
#        puts "\r\n\r\n========================================================================================================================="
#        puts " --- Subject MENTRY...: " << mentry.inspect
#        puts " --- Subject swimmer..: " << mentry.swimmer.inspect
#        puts " --- Subject MPRG.....: " << mentry.meeting_program.inspect
#        possible_swimmers = Swimmer.where( "complete_name LIKE \"%#{mentry.swimmer.last_name}%\"" ).reload
#        possible_swimmers.each{ |row| puts " --- id: #{row.id}, #{row.complete_name}, gender: #{row.gender_type_id}, #{row.year_of_birth}"}
        V2::DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season,
          mentry.meeting_program,
          mentry_detail_row, detail_row_idx, detail_rows_size,
          mentry.swimmer.gender_type,
          mentry.badge.category_type,
          false # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[matching MeetingEntry (and its MeetingProgram)]"

      it "has a #result_id with the ID of the fixture row (with a minus sign)" do
        expect( subject.result_id ).to eq( -mentry.id )
      end
    end

    context "with a CSI startlist," do
      subject do
# DEBUG
#        puts "\r\n\r\n========================================================================================================================="
#        puts " --- Subject MENTRY...: " << mentry_csi.inspect
#        puts " --- Subject swimmer..: " << mentry_csi.swimmer.inspect
#        puts " --- Subject MPRG.....: " << mentry_csi.meeting_program.inspect
#        possible_swimmers = Swimmer.where( "complete_name LIKE \"%#{mentry_csi.swimmer.last_name}%\"" ).reload
#        possible_swimmers.each{ |row| puts " --- id: #{row.id}, #{row.complete_name}, gender: #{row.gender_type_id}, #{row.year_of_birth}"}
        V2::DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season_csi,
          mentry_csi.meeting_program,
          mentry_detail_row_csi, detail_row_idx, detail_rows_size,
          mentry_csi.swimmer.gender_type,
          badge_csi.category_type,
          false # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[matching MeetingEntry (and its MeetingProgram)]"

      it "has a #result_id with the ID of the fixture row (with a minus sign)" do
        expect( subject.result_id ).to eq( -mentry_csi.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "[matching DataImportMeetingEntry (and its DataImportMeetingProgram)]" do
    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "doesn't create any additional secondary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportMeetingEntry.count }.by(1)
    end
    it "doesn't create a new primary entity row" do
      expect{ subject }.not_to change{ MeetingEntry.count }
    end
    it "doesn't create any additional DataImportMeetingProgram row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportMeetingProgram.count }.by(1)
    end
    it "doesn't create any MeetingProgram row" do
      expect{ subject }.not_to change{ MeetingProgram.count }
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


  # *** FULLY EXISTING or matching entities: *** [Secondary found & existing DataImportMeetingProgram]
  # ============================================
  let(:di_mentry) do
    create(
      :data_import_meeting_entry,
      data_import_session:          data_import_session,
      data_import_meeting_program:  di_meeting_program,
      badge:                        badge
    )
  end
  let(:di_mentry_detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        entry_order:    di_mentry.start_list_number,
        swimmer_name:   di_mentry.swimmer.complete_name,
        category_group: di_mentry.badge.category_type.code,
        team_name:      di_mentry.team.name,
        entry_time:     "#{di_mentry.minutes}'#{di_mentry.seconds}\"#{di_mentry.hundreds}",
      }
    }
  end
  let(:di_mentry_csi) do
    create(
      :data_import_meeting_entry,
      data_import_session:          data_import_session,
      data_import_meeting_program:  di_meeting_program_csi,
      badge:                        badge_csi
    )
  end
  let(:di_mentry_detail_row_csi) do
    CsiResultDAO.new(
      di_mentry_csi.swimmer.complete_name,
      di_mentry_csi.swimmer.year_of_birth,
      di_mentry_csi.team.name,
      '', # result_timing
      ("%02d" % (di_mentry_csi.minutes)) + ("%02d" % (di_mentry_csi.seconds)) + ("%02d" % (di_mentry_csi.hundreds)),
      '', # rank
      badge_csi.number,
      1, # total_events
      CsiResultDAO.get_combo_category_code(
        di_meeting_program_csi.event_type.length_in_meters,
        di_meeting_program_csi.stroke_type.code,
        badge_csi.category_type.code,
        badge_csi.swimmer.is_male
      ),
      nil, # combined_key
      di_mentry_csi.start_list_number
    )
  end


  context "after a self.build() with a matching secondary entity (w/ DataImportMeetingProgram)," do
    context "with a FIN startlist," do
      subject do
# DEBUG
#        puts "\r\n\r\n========================================================================================================================="
#        puts " --- Subject MENTRY...: " << di_mentry.inspect
#        puts " --- Subject swimmer..: " << di_mentry.swimmer.inspect
#        puts " --- Subject MPRG.....: " << di_mentry.data_import_meeting_program.inspect
#        possible_swimmers = Swimmer.where( "complete_name LIKE \"%#{di_mentry.swimmer.last_name}%\"" ).reload
#        possible_swimmers.each{ |row| puts " --- id: #{row.id}, #{row.complete_name}, gender: #{row.gender_type_id}, #{row.year_of_birth}"}
        V2::DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season,
          di_mentry.data_import_meeting_program,
          di_mentry_detail_row, detail_row_idx, detail_rows_size,
          di_mentry.swimmer.gender_type,
          di_mentry.badge.category_type,
          false # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[matching DataImportMeetingEntry (and its DataImportMeetingProgram)]"

      it "has a #result_id with the ID of the fixture row" do
        expect( subject.result_id ).to eq( di_mentry.id )
      end
    end

    context "with a CSI startlist," do
      subject do
# DEBUG
#        puts "\r\n\r\n========================================================================================================================="
#        puts " --- Subject MENTRY...: " << di_mentry_csi.inspect
#        puts " --- Subject swimmer..: " << di_mentry_csi.swimmer.inspect
#        puts " --- Subject MPRG.....: " << di_mentry_csi.data_import_meeting_program.inspect
#        possible_swimmers = Swimmer.where( "complete_name LIKE \"%#{di_mentry_csi.swimmer.last_name}%\"" ).reload
#        possible_swimmers.each{ |row| puts " --- id: #{row.id}, #{row.complete_name}, gender: #{row.gender_type_id}, #{row.year_of_birth}"}
        V2::DataImportMeetingEntryBuilder.build_from_parameters(
          data_import_session,
          season_csi,
          di_mentry_csi.data_import_meeting_program,
          di_mentry_detail_row_csi, detail_row_idx, detail_rows_size,
          di_mentry_csi.swimmer.gender_type,
          badge_csi.category_type,
          false # force_team_or_swimmer_creation
        )
      end
      it_behaves_like "[matching DataImportMeetingEntry (and its DataImportMeetingProgram)]"

      it "has a #result_id with the ID of the fixture row" do
        expect( subject.result_id ).to eq( di_mentry_csi.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end