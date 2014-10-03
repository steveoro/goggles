require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/services/data_import_entity_builder'


describe DataImportEntityBuilder, type: :service do

  let(:data_import_session) { create( :data_import_session ) }


  # Prepares the result subject for the specs.
  def season_build_process( fixture_date )
    DataImportEntityBuilder.build( data_import_session ) do
      entity            Season

      set_up do                                   # Set the fields:
        header_date     = Date.parse( fixture_date )
        @description    = I18n.t( 'admin_import.missing_data_warning' )
        @header_date    = header_date.kind_of?( Date ) ? header_date : Date.today
        year            = @header_date.month < 10 ? @header_date.year - 1 : @header_date.year
        # FIXME This is an approximation, it should include most of the seasons:
        @begin_date     = "#{year}-09-01" # Date.parse( "#{year}-09-01" )
        @end_date       = "#{year + 1}-09-30" # Date.parse( "#{year + 1}-08-30" )
        @header_year    = "#{year}/#{year+1}" # "#{@begin_date.year}/#{@end_date.year}",
        # FIXME ASSERT: season type is always "MASFIN"
        @season_type_id = SeasonType.first.id
        # FIXME This is plain wrong:
        @edition        = 0
      end
                                                  # Search phase:
      search do
        primary    [
          "(season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
          @season_type_id, @begin_date, @end_date
        ]
        secondary  [
          "(data_import_session_id = ?) AND (season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
          @data_import_session.id, @season_type_id, @begin_date, @end_date
        ]
        default_search
      end

      attributes_for_creation(
        data_import_session_id: @data_import_session.id,
        import_text:            @header_date,
        description:            @description,
        begin_date:             @begin_date,
        end_date:               @end_date,
        season_type_id:         @season_type_id,
        header_year:            @header_year,
        edition:                @edition
      )

      if_not_found do
# DEBUG
#        puts "\r\nCreating a new DataImportSeason..."
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with a matching Season row," do
    subject { season_build_process( "2001-11-01" ) }

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end
    describe "#result_row" do
      it "returns the entity instance found when the primary search is successful" do
        expect( subject.result_row ).to be_an_instance_of( Season )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the primary search is successful" do
        expect( subject.result_id ).to be < 0
      end
      it "is the ID of the resulting row, with a minus sign" do
        expect( subject.result_id ).to eq( -(subject.result_row.id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() without any matching rows (both in Season & DataImportSeason)," do
    subject { season_build_process( "1971-11-01" ) }

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end
    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportSeason )
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
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with a matching DataImportSeason existing row," do
    subject do
      create(
        :data_import_season,
        edition_type_id:  1,
        begin_date:       Date.parse("1999-10-01"),
        end_date:         Date.parse("2000-06-15")
      )
      season_build_process( "1999-12-01" )
    end

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end
    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportSeason )
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
  #-- -------------------------------------------------------------------------
  #++


  # # Prepares the result subject for the specs.
  def time_standard_build_process( season_id, event_type_id, category_type_id,
                                   gender_type_id, pool_type_id, mins, secs, hds )
    DataImportEntityBuilder.build( data_import_session ) do
      entity              TimeStandard
                                                  # Search condition:
      search do
        primary(
          event_type_id:    event_type_id,
          category_type_id: category_type_id,
          gender_type_id:   gender_type_id,
          pool_type_id:     pool_type_id,
          minutes:          mins,
          seconds:          secs,
          hundreds:         hds
        )
        default_search
      end

      # This will override what is the default secondary entity ('DataImportTimeStandard', which does not exist):
      entity_for_creation TimeStandard

      attributes_for_creation(
        season_id:        season_id,
        event_type_id:    event_type_id,
        category_type_id: category_type_id,
        gender_type_id:   gender_type_id,
        pool_type_id:     pool_type_id,
        minutes:          mins,
        seconds:          secs,
        hundreds:         hds
      )

      if_not_found        { add_new }
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with a matching TimeStandard row," do
    subject do
      # Randomize this with existing rows from seeded TimeStandard:
      ts = TimeStandard.find( (rand * (TimeStandard.count-1)).to_i + 1 )
      time_standard_build_process(
        ts.season_id,
        ts.event_type_id,
        ts.category_type_id,
        ts.gender_type_id,
        ts.pool_type_id,
        ts.minutes,
        ts.seconds,
        ts.hundreds
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
    describe "#result_row" do
      it "returns the entity instance found when the primary search is successful" do
        expect( subject.result_row ).to be_an_instance_of( TimeStandard )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the primary search is successful" do
        expect( subject.result_id ).to be < 0
      end
      it "is the ID of the resulting row, with a minus sign" do
        expect( subject.result_id ).to eq( -(subject.result_row.id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() without any matching TimeStandard row," do
    subject do
      ts = build( :time_standard )                  # Build (without saving) a totally fake time standard
      time_standard_build_process(
        1, # season_id
        ts.event_type_id,
        ts.category_type_id,
        ts.gender_type_id,
        ts.pool_type_id,
        ts.minutes,
        ts.seconds,
        ts.hundreds
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
    describe "#result_row" do
      it "returns the newly created entity instance" do
        expect( subject.result_row ).to be_an_instance_of( TimeStandard )
      end
    end
    describe "#result_id" do
      it "returns an always positive ID" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row (always positive)" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
