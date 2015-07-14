# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/strategies/result_time_parser'


describe V2::ResultTimeParser, type: :strategy do

  context "as a valid instance," do
    let(:mins)    { ((rand * 59) % 59).to_i }
    let(:secs)    { ((rand * 59) % 59).to_i }
    let(:hds)     { ((rand * 59) % 59).to_i }
    let(:int9a)   { ((rand * 10) % 10).to_i }
    let(:int9b)   { ((rand * 10) % 10).to_i }
    let(:rank)    { (rand * 99).to_i + 1 }

    let(:valid_result_time)   { "#{mins}'" + ("%02d" % secs.to_s) + ("\"%02d" % hds.to_s) }
    let(:valid2_result_time)  { "#{mins}'#{int9a}\"#{int9b}" }

    let(:valid_disqualify)    { "Squalif." }
    let(:valid_withdrawal)    { "Ritir." }
    let(:valid_out_of_race)   { ["fg", "F.G.", "Fuori gara"].at(rand * 10 % 2) }
    let(:invalid_result)      { FFaker::Lorem.paragraph[0..99] }
    #-- -----------------------------------------------------------------------
    #++

    context "before any parsing," do
      subject { V2::ResultTimeParser.new( rank, valid_result_time ) }

      it_behaves_like( "(the existance of a method)", [
        :disqualification_code_type_id, :mins_secs_hds_array,
        :is_out_of_race?, :is_disqualified?, :parse
      ] )

      describe "#disqualification_code_type_id" do
        it "returns nil" do
          expect( subject.disqualification_code_type_id ).to be nil
        end
      end
      describe "#mins_secs_hds_array," do
        it "returns nil" do
          expect( subject.mins_secs_hds_array ).to be nil
        end
      end
      describe "#is_out_of_race?" do
        it "returns false" do
          expect( subject.is_out_of_race? ).to be false
        end
      end
      describe "#is_disqualified?" do
        it "returns false" do
          expect( subject.is_disqualified? ).to be false
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    shared_examples_for "sucessful parsing of a valid timing string" do
      it "returns an instance of V2::ResultTimeParser" do
        expect( subject ).to be_an_instance_of( V2::ResultTimeParser )
      end
      describe "#disqualification_code_type_id" do
        it "returns nil" do
          expect( subject.disqualification_code_type_id ).to be nil
        end
      end
      describe "#is_out_of_race?" do
        it "returns false" do
          expect( subject.is_out_of_race? ).to be false
        end
      end
      describe "#is_disqualified?" do
        it "returns false" do
          expect( subject.is_disqualified? ).to be false
        end
      end
    end


    context "after the parsing of a valid timing (FIN1, fixture 1)," do
      subject { V2::ResultTimeParser.new( rank, valid_result_time ).parse }

      it_behaves_like "sucessful parsing of a valid timing string"

      describe "#mins_secs_hds_array," do
        it "returns an instance of Array with 3 elements" do
# DEBUG
#          puts "\r\n=>#{valid_result_time}<="
          expect( subject.mins_secs_hds_array ).to be_an_instance_of( Array )
          expect( subject.mins_secs_hds_array.size ).to eq(3)
        end
        it "has all the timing values in the token" do
# DEBUG
#          puts "\r\n=>#{valid_result_time}<="
          expect( subject.mins_secs_hds_array ).to contain_exactly( mins, secs, hds )
        end
      end
    end

    context "after the parsing of a valid timing (FIN1, fixture 2)," do
      subject { V2::ResultTimeParser.new( rank, valid2_result_time ).parse }

      it_behaves_like "sucessful parsing of a valid timing string"

      describe "#mins_secs_hds_array," do
        it "returns an instance of Array with 3 elements" do
# DEBUG
#          puts "\r\n=>#{valid2_result_time}<="
          expect( subject.mins_secs_hds_array ).to be_an_instance_of( Array )
          expect( subject.mins_secs_hds_array.size ).to eq(3)
        end
        it "has all the timing values in the token" do
# DEBUG
#          puts "\r\n=>#{valid2_result_time}<="
          expect( subject.mins_secs_hds_array ).to contain_exactly( mins, int9a, int9b )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    let(:valid_fin2_result_time)   { "#{mins} " + ("%02d" % secs.to_s) + (" %02d" % hds.to_s) }
    let(:valid2_fin2_result_time)  { "#{mins} #{int9a} #{int9b}" }


    context "after the parsing of a valid timing (FIN2, fixture 1)," do
      subject { V2::ResultTimeParser.new( rank, valid_fin2_result_time ).parse }

      it_behaves_like "sucessful parsing of a valid timing string"

      describe "#mins_secs_hds_array," do
        it "returns an instance of Array with 3 elements" do
# DEBUG
#          puts "\r\n=>#{valid_fin2_result_time}<="
          expect( subject.mins_secs_hds_array ).to be_an_instance_of( Array )
          expect( subject.mins_secs_hds_array.size ).to eq(3)
        end
        it "has all the timing values in the token" do
# DEBUG
#          puts "\r\n=>#{valid_fin2_result_time}<="
          expect( subject.mins_secs_hds_array ).to contain_exactly( mins, secs, hds )
        end
      end
    end

    context "after the parsing of a valid timing (FIN2, fixture 2)," do
      subject { V2::ResultTimeParser.new( rank, valid2_fin2_result_time ).parse }

      it_behaves_like "sucessful parsing of a valid timing string"

      describe "#mins_secs_hds_array," do
        it "returns an instance of Array with 3 elements" do
# DEBUG
#          puts "\r\n=>#{valid2_fin2_result_time}<="
          expect( subject.mins_secs_hds_array ).to be_an_instance_of( Array )
          expect( subject.mins_secs_hds_array.size ).to eq(3)
        end
        it "has all the timing values in the token" do
# DEBUG
#          puts "\r\n=>#{valid2_fin2_result_time}<="
          expect( subject.mins_secs_hds_array ).to contain_exactly( mins, int9a, int9b )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    context "after the parsing of a valid disqualify," do
      subject { V2::ResultTimeParser.new( rank, valid_disqualify ) }
      before(:each) do
        expect( subject.parse ).to be_an_instance_of( V2::ResultTimeParser )
      end

      describe "#disqualification_code_type_id" do
        it "returns DSQ_FALSE_START_ID" do
          expect( subject.disqualification_code_type_id ).to eq(
            DisqualificationCodeType::DSQ_FALSE_START_ID
          )
        end
      end
      describe "#mins_secs_hds_array," do
        it "returns an instance of Array with 3 elements" do
          expect( subject.mins_secs_hds_array ).to be_an_instance_of( Array )
          expect( subject.mins_secs_hds_array.size ).to eq(3)
        end
        it "has the timing values as 0" do
          expect( subject.mins_secs_hds_array ).to all( eq(0) )
        end
      end
      describe "#is_out_of_race?" do
        it "returns false" do
          expect( subject.is_out_of_race? ).to be false
        end
      end
      describe "#is_disqualified?" do
        it "returns false" do
          expect( subject.is_disqualified? ).to be true
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "after the parsing of a valid out-of-race," do
      subject { V2::ResultTimeParser.new( valid_out_of_race, valid_result_time ) }
      before(:each) do
        expect( subject.parse ).to be_an_instance_of( V2::ResultTimeParser )
      end

      describe "#disqualification_code_type_id" do
        it "returns nil" do
          expect( subject.disqualification_code_type_id ).to be nil
        end
      end
      describe "#mins_secs_hds_array," do
        it "returns an instance of Array with 3 elements" do
          expect( subject.mins_secs_hds_array ).to be_an_instance_of( Array )
          expect( subject.mins_secs_hds_array.size ).to eq(3)
        end
        it "has all the timing values in the token" do
          expect( subject.mins_secs_hds_array ).to contain_exactly( mins, secs, hds )
        end
      end
      describe "#is_out_of_race?" do
        it "returns true" do
          expect( subject.is_out_of_race? ).to be true
        end
      end
      describe "#is_disqualified?" do
        it "returns false" do
          expect( subject.is_disqualified? ).to be false
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "after the parsing of a valid withdrawal," do
      subject { V2::ResultTimeParser.new( rank, valid_withdrawal ) }
      before(:each) do
        expect( subject.parse ).to be_an_instance_of( V2::ResultTimeParser )
      end

      describe "#disqualification_code_type_id" do
        it "returns DSQ_RETIRED_ID" do
          expect( subject.disqualification_code_type_id ).to eq(
            DisqualificationCodeType::DSQ_RETIRED_ID
          )
        end
      end
      describe "#mins_secs_hds_array," do
        it "returns an instance of Array with 3 elements" do
          expect( subject.mins_secs_hds_array ).to be_an_instance_of( Array )
          expect( subject.mins_secs_hds_array.size ).to eq(3)
        end
        it "has the timing values as 0" do
          expect( subject.mins_secs_hds_array ).to all( eq(0) )
        end
      end
      describe "#is_out_of_race?" do
        it "returns false" do
          expect( subject.is_out_of_race? ).to be false
        end
      end
      describe "#is_disqualified?" do
        it "returns true" do
          expect( subject.is_disqualified? ).to be true
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
