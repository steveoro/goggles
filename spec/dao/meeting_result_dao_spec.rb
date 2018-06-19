# encoding: utf-8

require 'rails_helper'
require 'common/format'


describe MeetingResultDAO, type: :model do
  #let(:meeting)         { create(:meeting_with_sessions) }
  #let(:meeting_session) { meeting.meeting_sessions.first }

  let(:mir) do
    MeetingIndividualResult.where("meeting_program_id IS NOT NULL")
      .last(100).sample
  end
  let(:meeting)         { mir.meeting }
  let(:meeting_event)   { mir.meeting_event }
  let(:meeting_program) { mir.meeting_program }
  let(:passage)         { Passage.all.sample }

  let(:mir_with_pass)   { passage.meeting_individual_result }


  context "MeetingResultEventDAO subclass," do

    subject { MeetingResultDAO::MeetingResultEventDAO.new( meeting_event ) }

    it_behaves_like( "(the existance of a method)", [
      :code, :programs, :has_start_list, :populate_programs
    ] )

    describe "#has_start_list" do
      it "is a boolean" do
        expect( subject.has_start_list ).to eq( true ).or( eq( false ))
      end
      it "is the given parameter" do
        mrp1 = MeetingResultDAO::MeetingResultProgramDAO.new( meeting_program, true )
        expect( mrp1.has_start_list ).to eq( true )
        mrp2 = MeetingResultDAO::MeetingResultProgramDAO.new( meeting_program, false )
        expect( mrp2.has_start_list ).to eq( false )
      end
      it "is false if parameter not given" do
        expect( subject.has_start_list ).to eq( false )
      end
    end

    describe "#programs" do
      it "is a kind of array" do
        expect( subject.programs ).to be_a_kind_of( Array )
      end
    end

    describe "#populate_programs" do
      it "returns a number" do
        expect( subject.populate_programs ).to be >= 0
      end
      it "populates programs array only if event has programs" do
        expect( subject.programs.size ).to eq( 0 )
        programs_number = subject.populate_programs
        expect( subject.programs.size ).to eq( programs_number )
      end
      it "populates events with MeetingResultProgramDAO objects" do
        subject.populate_programs
        expect( subject.programs ).to all(be_an_instance_of( MeetingResultDAO::MeetingResultProgramDAO ))
      end
    end

    describe "#with populate parameter" do
      it "populates automatically programs and results" do
        mrep = MeetingResultDAO::MeetingResultEventDAO.new( meeting_event, false, true )
        expect( mrep.programs.size ).to be > 0
        expect( mrep.programs[0].rank.size ).to be > 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "MeetingResultProgramDAO subclass," do

    subject { MeetingResultDAO::MeetingResultProgramDAO.new( meeting_program ) }

    it_behaves_like( "(the existance of a method)", [
      :event_name, :category_name, :gender_name, :has_start_list, :rank, :has_results?, :populate_ranking
    ] )

    describe "#has_start_list" do
      it "is a boolean" do
        expect( subject.has_start_list ).to eq( true ).or( eq( false ))
      end
      it "is the given parameter" do
        mrp1 = MeetingResultDAO::MeetingResultProgramDAO.new( meeting_program, true )
        expect( mrp1.has_start_list ).to eq( true )
        mrp2 = MeetingResultDAO::MeetingResultProgramDAO.new( meeting_program, false )
        expect( mrp2.has_start_list ).to eq( false )
      end
      it "is false if parameter not given" do
        expect( subject.has_start_list ).to eq( false )
      end
    end

    describe "#rank" do
      it "is a kind of array" do
        expect( subject.rank ).to be_a_kind_of( Array )
      end
    end

    describe "#has_results?" do
      it "is a boolean" do
        expect( subject.has_results? ).to eq( true ).or( eq( false ))
      end
    end

    describe "#populate_ranking" do
      it "returns a number" do
        expect( subject.populate_ranking ).to be >= 0
      end
      it "populates rank array only if program has results" do
        expect( subject.rank.size ).to eq( 0 )
        results_number = subject.populate_ranking
        expect( subject.rank.size ).to eq( results_number )
      end
      it "populates rank with MeetingResultIndividualDAO objects" do
        subject.populate_ranking
        expect( subject.rank ).to all(be_an_instance_of( MeetingResultDAO::MeetingResultIndividualDAO ))
      end
    end

    describe "#with populate parameter" do
      it "populates automatically rank" do
        mrpp = MeetingResultDAO::MeetingResultProgramDAO.new( meeting_program, false, true )
        expect( mrpp.rank.size ).to be > 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "MeetingResultIndividualDAO subclass," do

    subject { MeetingResultDAO::MeetingResultIndividualDAO.new( mir ) }

    it_behaves_like( "(the existance of a method)", [
      :rank, :complete_name, :year_of_birth, :timing, :standard_score, :meeting_score, :google_cup_score, :team_name, :passages, :has_passages?, :populate_passages
    ] )

    describe "#passages" do
      it "is a kind of array" do
        expect( subject.passages ).to be_a_kind_of( Array )
      end
    end

    describe "#has_passages?" do
      it "is a boolean" do
        expect( subject.has_passages? ).to eq( true ).or( eq( false ))
      end
    end

    describe "#populate_passages" do
      it "returns a number" do
        expect( subject.populate_passages(mir) ).to be >= 0
      end
      it "populates rank array only if result has passages" do
        expect( subject.passages.size ).to eq( 0 )
        results_number = subject.populate_passages(mir)
        expect( subject.passages.size ).to eq( results_number )
      end
      it "populates passages if any" do
        mri = MeetingResultDAO::MeetingResultIndividualDAO.new( mir_with_pass )
        expect( mri.has_passages? ).to eq( false )
        mri.populate_passages
        expect( mri.has_passages? ).to eq( true )
        expect( mri.passages.size ).to be > 0
      end
      it "populates passages with MeetingResultPAssageDAO objects" do
        mri = MeetingResultDAO::MeetingResultIndividualDAO.new( mir_with_pass )
        mri.populate_passages
        expect( mri.passages ).to all(be_an_instance_of( MeetingResultDAO::MeetingResultPassageDAO ))
      end
    end

    describe "#with populate parameter" do
      it "populates automatically passages" do
        mrip = MeetingResultDAO::MeetingResultIndividualDAO.new( mir_with_pass, true )
        expect( mrip.passages.size ).to be > 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "MeetingResultPassageDAO subclass," do

    subject { MeetingResultDAO::MeetingResultPassageDAO.new( passage ) }

    it_behaves_like( "(the existance of a method)", [
      :timing
    ] )

  end
  #-- -------------------------------------------------------------------------
  #++


  context "MeetingResultDAO," do

    subject { MeetingResultDAO.new( meeting ) }

    it_behaves_like( "(the existance of a method)", [
      :events, :has_start_list
    ] )

    describe "#has_start_list" do
      it "is a boolean" do
        expect( subject.has_start_list ).to eq( true ).or( eq( false ))
      end
    end

    describe "#events" do
      it "is a kind of array" do
        expect( subject.events ).to be_a_kind_of( Array )
      end
    end

    describe "#populate_events" do
      it "returns a number" do
        expect( subject.populate_events(meeting) ).to be >= 0
      end
      it "populates event array only if meeting has events" do
        expect( subject.events.size ).to eq( 0 )
        events_number = subject.populate_events
        expect( subject.events.size ).to eq( events_number )
      end
      it "populates events with MeetingResukltEventDAO objects" do
        subject.populate_events
        expect( subject.events ).to all(be_an_instance_of( MeetingResultDAO::MeetingResultEventDAO ))
      end
    end

    describe "#with populate parameter" do
      it "populates automatically events and programs" do
        mrp = MeetingResultDAO.new( meeting, true )
        expect( mrp.events.size ).to be > 0
        expect( mrp.events[0].programs.size ).to be > 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

end

