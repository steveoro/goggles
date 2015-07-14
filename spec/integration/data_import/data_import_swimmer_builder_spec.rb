require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_swimmer_builder'


shared_examples_for "DataImportSwimmerBuilder with NO matching entity rows" do
  it "returns a V2::DataImportEntityBuilder instance" do
    expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
  end
  describe "#data_import_session" do
    it "is the DataImportSession specified for the build" do
      expect( subject.data_import_session ).to eq( data_import_session )
    end
  end

  it "creates a new secondary entity row" do
    expect{ subject }.to change{ DataImportSwimmer.count }.by(1)
  end
  it "does not create a new primary entity row" do
    expect{ subject }.not_to change{ Swimmer.count }
  end

  describe "#result_row" do
    it "returns a secondary entity instance when the process is successful" do
      expect( subject.result_row ).to be_an_instance_of( DataImportSwimmer )
    end
  end
  describe "#result_id" do
    it "returns a positive ID (the searches fail but the creation is successful)" do
      expect( subject.result_id ).to be > 0
      expect( subject.result_row.id ).to be > 0
    end
    it "is the ID of the resulting row (with a minus sign)" do
      expect( subject.result_row ).to be_an_instance_of( DataImportSwimmer )
      expect( subject.result_row.id ).to eq( subject.result_id )
    end
  end
end


shared_examples_for "DataImportSwimmerBuilder with a matching primary entity row" do
  it "returns a V2::DataImportEntityBuilder instance" do
    expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
  end
  describe "#data_import_session" do
    it "is the DataImportSession specified for the build" do
      expect( subject.data_import_session ).to eq( data_import_session )
    end
  end

  it "does not create any additional primary entity row" do
    # (+1 only from the factory creation in the subject)
    expect{ subject }.to change{ Swimmer.count }.by(1)
  end
  it "does not create a new secondary entity row" do
    expect{ subject }.not_to change{ DataImportSwimmer.count }
  end

  describe "#result_row" do
    it "returns a primary entity instance when the process is successful" do
      expect( subject.result_row ).to be_an_instance_of( Swimmer )
    end
  end
  describe "#result_id" do
    it "returns a negative ID (the primary search is successful)" do
      expect( subject.result_id ).to be < 0
      expect( subject.result_row.id ).to be > 0
    end
    it "is the ID of the resulting row (with a minus sign)" do
      expect( subject.result_row ).to be_an_instance_of( Swimmer )
      expect( subject.result_row.id ).to eq( -(subject.result_id) )
    end
  end
end


shared_examples_for "DataImportSwimmerBuilder with a matching secondary entity row" do
  it "returns a V2::DataImportEntityBuilder instance" do
    expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
  end
  describe "#data_import_session" do
    it "is the DataImportSession specified for the build" do
      expect( subject.data_import_session ).to eq( data_import_session )
    end
  end

  it "does not create a new primary entity row" do
    expect{ subject }.not_to change{ Swimmer.count }
  end
  it "does not create any additional secondary entity row" do
    # (+1 only from the factory creation in the subject)
    expect{ subject }.to change{ DataImportSwimmer.count }.by(1)
  end

  describe "#result_row" do
    it "returns a secondary entity instance when the process is successful" do
      expect( subject.result_row ).to be_an_instance_of( DataImportSwimmer )
    end
  end
  describe "#result_id" do
    it "returns a positive ID (the secondary search is successful)" do
      expect( subject.result_id ).to be > 0
      expect( subject.result_row.id ).to be > 0
    end
    it "is the ID of the resulting row" do
      expect( subject.result_row ).to be_an_instance_of( DataImportSwimmer )
      expect( subject.result_row.id ).to eq( subject.result_id )
    end
  end
end
#-- ---------------------------------------------------------------------------
#++


describe V2::DataImportSwimmerBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Existing or matching fixture params:
  let(:swimmer)               { create( :swimmer ) }
  let(:data_import_swimmer)   { create( :data_import_swimmer, data_import_session: data_import_session ) }
  let(:category_type)         { create( :category_type ) }

  # Non-existing (totally random) fixture params:
  let(:swimmer_name)          { "#{ FFaker::Name.first_name } #{ FFaker::Name.last_name }" }
  let(:swimmer_year)          { 18.year.ago.year - ((rand * 100) % 60).to_i }
  let(:gender_type)           { GenderType.where( code: ['M','F']).sort{ rand - 0.5 }[0] }
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with invalid parameters," do
    subject do
      V2::DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        nil,
        swimmer_year,
        gender_type,
        nil,
        true # force_team_or_swimmer_creation
      )
    end

    it "returns nil" do
      expect( subject ).to be nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with NO matching entity rows," do
    subject do
      V2::DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        swimmer_name,
        swimmer_year,
        gender_type,
        nil,
        true # force_team_or_swimmer_creation
      )
    end
    it_behaves_like "DataImportSwimmerBuilder with NO matching entity rows"
  end


  # Existing or matching fixture params:
  let(:mir)                   { create( :meeting_individual_result ) }

  context "after a self.build(birthyear: nil, category: given) with NO matching entity rows," do
    subject do
# DEBUG
#      puts "\r\n- swimmer:      #{mir.swimmer.inspect}"
#      puts "- badge/season: #{mir.badge.season.inspect}"
#      puts "- MIR/PRG:      #{mir.meeting_program.inspect}"
      V2::DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        swimmer_name,
        nil,
        gender_type,
        category_type,
        true # force_team_or_swimmer_creation
      )
    end
    it_behaves_like "DataImportSwimmerBuilder with NO matching entity rows"
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching primary entity row," do
    subject do
      V2::DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        swimmer.complete_name,
        swimmer.year_of_birth,
        swimmer.gender_type,
        nil,
        false # force_team_or_swimmer_creation
      )
    end
    it_behaves_like "DataImportSwimmerBuilder with a matching primary entity row"
  end


  context "after a self.build() with a matching secondary entity row," do
    subject do
      V2::DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        data_import_swimmer.complete_name,
        data_import_swimmer.year_of_birth,
        data_import_swimmer.gender_type,
        nil,
        false # force_team_or_swimmer_creation
      )
    end
    it_behaves_like "DataImportSwimmerBuilder with a matching secondary entity row"
  end
  #-- -------------------------------------------------------------------------
  #++


  # Existing or matching fixture params:
  let(:mir)                   { create( :meeting_individual_result ) }

  context "after a self.build(birthyear: nil, category: given) with a matching primary entity row," do
    subject do
# DEBUG
#      puts "\r\n- swimmer:      #{mir.swimmer.inspect}"
#      puts "- badge/season: #{mir.badge.season.inspect}"
#      puts "- MIR/PRG:      #{mir.meeting_program.inspect}"
      V2::DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        mir.swimmer.complete_name,
        nil,
        mir.swimmer.gender_type,
        mir.badge.category_type,
        false # force_team_or_swimmer_creation
      )
    end
    it_behaves_like "DataImportSwimmerBuilder with a matching primary entity row"
  end
  #-- -------------------------------------------------------------------------
  #++


  # Existing or matching fixture params:
  let(:di_swimmer) do
    swimmer_year = category_type.season.begin_date.year - category_type.age_end
    create(
      :data_import_swimmer,
      data_import_session: data_import_session,
      year_of_birth: swimmer_year
    )
  end

  context "after a self.build(birthyear: nil, category: given) with a matching secondary entity row," do
    subject do
# DEBUG
#      puts "\r\n- di_swimmer:    #{di_swimmer.inspect}"
#      puts "- category_type: #{category_type.inspect}"
      V2::DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        di_swimmer.complete_name,
        nil,
        di_swimmer.gender_type,
        category_type,
        false # force_team_or_swimmer_creation
      )
    end
    it_behaves_like "DataImportSwimmerBuilder with a matching secondary entity row"
  end
  #-- -------------------------------------------------------------------------
  #++


  # This will create another fixture swimmer, with same name and slightly different year:
  let(:swimmer_2) do
    create( :swimmer,
      complete_name: mir.swimmer.complete_name,
      year_of_birth: mir.swimmer.year_of_birth + 1, # (must result in same category!)
      gender_type: mir.swimmer.gender_type
    )
  end

  context "after a self.build(birthyear: nil, category: given) with MORE than 1 matching primary entity row," do
    subject do
# DEBUG
#      puts "\r\n- swimmer:   #{mir.swimmer.inspect}"
#      puts "- swimmer_2: #{swimmer_2.inspect}"
      V2::DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        swimmer_2.complete_name,
        nil,
        swimmer_2.gender_type,
        mir.badge.category_type,
        false # force_team_or_swimmer_creation
      )
    end

    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "does not create any additional primary entity row" do
      # (+2 only from the factory creation in the subject)
      expect{ subject }.to change{ Swimmer.count }.by(2)
    end
    it "does not create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportSwimmer.count }
    end

    describe "#result_row" do
      it "returns the first primary entity row found when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( Swimmer )
      end
      it "is the first complying row found" do
        expect( subject.result_id ).to eq( -mir.swimmer_id )
      end
    end
    describe "#result_id" do
      it "returns a negative ID (the primary search is successful)" do
        expect( subject.result_id ).to be < 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_row ).to be_an_instance_of( Swimmer )
        expect( subject.result_row.id ).to eq( -(subject.result_id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
