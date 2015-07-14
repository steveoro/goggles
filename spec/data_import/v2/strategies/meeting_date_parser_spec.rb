# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/strategies/meeting_date_parser'


describe V2::MeetingDateParser, type: :strategy do

  context "as a valid instance," do
    let(:day_1)        { ((rand * 100) % 28).to_i+1 }
    let(:day_2)        { ((rand * 100) % 28).to_i+1 }
    let(:day_3)        { ((rand * 100) % 28).to_i+1 }
    let(:months)      { ['gen','feb','mar','apr','mag','giu','lug','ago','set','ott','nov','dic'] }
    let(:month_num)   { ((rand * 100) % 12).to_i }
    let(:month)       { months.at( month_num ) }
    let(:year)        { "#{ ((rand * 100) % 10).to_i + 2007 }" }

    let(:valid_single_date)   { "#{day_1} #{month} #{year}" }
    let(:valid_double_date)   { "#{day_1},#{day_2} #{month} #{year}" }
    let(:valid_3_dates)       { "#{day_1}-#{day_2},#{day_3} #{month} #{year}" }
    let(:invalid_single_date) { "#{31 + day_1} #{month} #{year}" }

    subject { V2::MeetingDateParser.new() }

    it_behaves_like( "(the existance of a method)", [ :parse ] )


    describe "#parse" do
      context "when parsing a single valid date," do
        it "returns an array containing a single Date instance" do
          result = subject.parse( valid_single_date )
          expect( result ).to be_an_instance_of( Array )
          expect( result.size ).to eq(1)
          expect( result.first ).to be_an_instance_of( Date )
        end
        it "returns a list with the expected single Date" do
          result = subject.parse( valid_single_date )
          expect( result.size ).to eq(1)
          expect( result.first.year  ).to eq( year.to_i )
          expect( result.first.month ).to eq( month_num.to_i + 1 )
          expect( result.first.day   ).to eq( day_1.to_i )
        end
      end

      context "when parsing a double valid date," do
        it "returns an array containing two Date instances" do
          result = subject.parse( valid_double_date )
          expect( result ).to be_an_instance_of( Array )
          expect( result.size ).to eq(2)
          expect( result ).to all( be_an_instance_of( Date ) )
        end
        it "returns a list with the expected couple of dates" do
          result = subject.parse( valid_double_date )
          expect( result.size ).to eq(2)
          expect( result.first.year  ).to eq( year.to_i )
          expect( result.first.month ).to eq( month_num.to_i + 1 )
          expect( result.first.day   ).to eq( day_1.to_i )
          expect( result.last.year   ).to eq( year.to_i )
          expect( result.last.month  ).to eq( month_num.to_i + 1 )
          expect( result.last.day    ).to eq( day_2.to_i )
        end
      end

      context "when parsing a triple valid date," do
        it "returns an array containing 3 Date instances" do
          result = subject.parse( valid_3_dates )
          expect( result ).to be_an_instance_of( Array )
          expect( result.size ).to eq(3)
          expect( result ).to all( be_an_instance_of( Date ) )
        end
        it "returns a list with the expected couple of dates" do
          result = subject.parse( valid_3_dates )
          expect( result.size ).to eq(3)
          expect( result[0].year  ).to eq( year.to_i )
          expect( result[0].month ).to eq( month_num.to_i + 1 )
          expect( result[0].day   ).to eq( day_1.to_i )
          expect( result[1].year   ).to eq( year.to_i )
          expect( result[1].month  ).to eq( month_num.to_i + 1 )
          expect( result[1].day    ).to eq( day_2.to_i )
          expect( result[2].year   ).to eq( year.to_i )
          expect( result[2].month  ).to eq( month_num.to_i + 1 )
          expect( result[2].day    ).to eq( day_3.to_i )
        end
      end

      it "returns nil for a non-valid text_token" do
        expect( subject.parse( invalid_single_date ) ).to be nil
      end
      it "returns nil for an empty text_token" do
        expect( subject.parse('') ).to be nil
      end
      it "returns nil for a nil text_token" do
        expect( subject.parse(nil) ).to be nil
      end

      context "when parsing different formats," do
        let(:fixtures) do
          [
            "18 gen 2005",
            "9 set 2009",
            "15/06/2010",
            "14/15 Gennaio 2012",
            "11 novembre 2012",
            "3/4 Dicembre 2011",
            "20-21 aprile 2013",
            "1,2,3,4 Marzo 2011"
          ]
        end
        let(:expectations) do
          [
            [ Date.parse("2005-01-18") ],
            [ Date.parse("2009-09-09") ],
            [ Date.parse("2010-06-15") ],
            [ Date.parse("2012-01-14"), Date.parse("2012-01-15") ],
            [ Date.parse("2012-11-11") ],
            [ Date.parse("2011-12-03"), Date.parse("2011-12-04") ],
            [ Date.parse("2013-04-20"), Date.parse("2013-04-21") ],
            [ Date.parse("2011-03-01"), Date.parse("2011-03-02"), Date.parse("2011-03-03"), Date.parse("2011-03-04") ]
          ]
        end

        it "returns a valid Date instance with the correct value" do
          fixtures.each_with_index do |fixture_text, index|
            expect( subject.parse( fixture_text ) ).to be_an_instance_of( Array )
            expect( subject.parse( fixture_text ) ).to eq( expectations[index] )
          end
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
