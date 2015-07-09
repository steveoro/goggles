# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/strategies/csi_result_parser'


describe "CsiResultParser parsing fixture ris20150201csiprova2.csv,", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @csi_importer = CsiResultParser.new(
      File.join(Rails.root, 'test/fixtures/samples/ris20150201csiprova2.csv'),
    )
# DEBUG
#    puts "\r\n" << @csi_importer.process_text_log
  end

  it "returns an instance of CsiResultParser" do
    expect( @csi_importer ).to be_an_instance_of( CsiResultParser )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#dao_list," do
    subject { @csi_importer.dao_list }

    it "is a list" do
      expect( subject.respond_to?(:size) ).to be true
      expect( subject.respond_to?(:each) ).to be true
    end
    it "has 361 items" do
      # Line #0 is the header:
      expect( subject.size ).to eq( 361 )
    end
    it "contains only CsiResultDAO instances" do
      expect( subject ).to all be_instance_of( CsiResultDAO )
    end

    it "has 9 unique categories" do
      categories = subject.map { |dao| dao.category_type_code }.uniq.sort
# DEBUG
#      puts "\r\n" << categories.inspect
      expect( categories.size ).to eq( 9 )
    end
    it "has 4 unique event_types_codes" do
      events = subject.map { |dao| dao.event_types_code }.uniq.sort
# DEBUG
#      puts "\r\n" << events.inspect
      expect( events.size ).to eq( 4 )
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "[event 50FA]" do
      let( :selected_daos ) { subject.select{ |dao| dao.event_types_code == '50FA' } }

      it "has total of 88 enlisted athletes" do
        expect( selected_daos.size ).to eq( 88 )
      end

      it "has total of 59 male athletes" do
        male_daos = selected_daos.select{ |dao| dao.gender_type_id == GenderType::MALE_ID }
# DEBUG
#        puts "\r\n#{ male_daos.size }"
        expect( male_daos.size ).to eq( 59 )
      end
      it "has total of 29 female athletes" do
        female_daos = selected_daos.select{ |dao| dao.gender_type_id == GenderType::FEMALE_ID }
        expect( female_daos.size ).to eq( 29 )
      end
      it "has 9 unique categories" do
        categories = selected_daos.map { |dao| dao.category_type_code }.uniq.sort
        expect( categories.size ).to eq( 9 )
      end
    end


    describe "[event 50DO]" do
      let( :selected_daos ) { subject.select{ |dao| dao.event_types_code == '50DO' } }

      it "has total of 77 enlisted athletes" do
        expect( selected_daos.size ).to eq( 77 )
      end

      it "has total of 41 male athletes" do
        male_daos = selected_daos.select{ |dao| dao.gender_type_id == GenderType::MALE_ID }
# DEBUG
#        puts "\r\n#{ male_daos.size }"
        expect( male_daos.size ).to eq( 41 )
      end
      it "has total of 36 female athletes" do
        female_daos = selected_daos.select{ |dao| dao.gender_type_id == GenderType::FEMALE_ID }
        expect( female_daos.size ).to eq( 36 )
      end
      it "has 9 unique categories" do
        categories = selected_daos.map { |dao| dao.category_type_code }.uniq.sort
        expect( categories.size ).to eq( 9 )
      end
    end


    describe "[event 100SL]" do
      let( :selected_daos ) { subject.select{ |dao| dao.event_types_code == '100SL' } }

      it "has total of 116 enlisted athletes" do
        expect( selected_daos.size ).to eq( 116 )
      end

      it "has total of 77 male athletes" do
        male_daos = selected_daos.select{ |dao| dao.gender_type_id == GenderType::MALE_ID }
# DEBUG
#        puts "\r\n#{ male_daos.size }"
        expect( male_daos.size ).to eq( 77 )
      end
      it "has total of 39 female athletes" do
        female_daos = selected_daos.select{ |dao| dao.gender_type_id == GenderType::FEMALE_ID }
        expect( female_daos.size ).to eq( 39 )
      end
      it "has 9 unique categories" do
        categories = selected_daos.map { |dao| dao.category_type_code }.uniq.sort
        expect( categories.size ).to eq( 9 )
      end
    end


    describe "[event 200SL]" do
      let( :selected_daos ) { subject.select{ |dao| dao.event_types_code == '200SL' } }

      it "has total of 80 enlisted athletes" do
        expect( selected_daos.size ).to eq( 80 )
      end

      it "has total of 50 male athletes" do
        male_daos = selected_daos.select{ |dao| dao.gender_type_id == GenderType::MALE_ID }
# DEBUG
#        puts "\r\n#{ male_daos.size }"
        expect( male_daos.size ).to eq( 50 )
      end
      it "has total of 30 female athletes" do
        female_daos = selected_daos.select{ |dao| dao.gender_type_id == GenderType::FEMALE_ID }
        expect( female_daos.size ).to eq( 30 )
      end
      it "has 9 unique categories" do
        categories = selected_daos.map { |dao| dao.category_type_code }.uniq.sort
        expect( categories.size ).to eq( 9 )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
