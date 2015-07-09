# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/dao/csi_result_dao'


describe CsiResultDAO, type: :model do

  describe "self.get_combo_category_code()" do
    [
      [ 100, 'FA', 'M35', true,   '1513' ],
      [ 100, 'FA', 'M35', false,   '513' ],
      [  50, 'DO', 'M25', false,   '322' ],
      [  50, 'DO', 'M25', true,   '1322' ],
      [  50, 'RA', 'M45', false,   '732' ],
      [  50, 'RA', 'M45', true,   '1732' ],
      [ 200, 'SL', 'M50', false,   '844' ],
      [ 200, 'SL', 'M50', true,   '1844' ],
      [ 100, 'MI', 'SEN', true,   '1153' ],
      [ 100, 'MI', 'SEN', false,   '153' ]
    ].each do |fixture_length, fixture_stroke, fixture_category, is_male, expected_result|
      it "returns the expected code" do
        expect(
          CsiResultDAO.get_combo_category_code( fixture_length, fixture_stroke, fixture_category, is_male )
        ).to eq(expected_result)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  [
    "ALLORO STEFANO;1969;CSInuoto OberFerrari;999997;10750;4;AT04205036;2;1743;ALLORO STEFANO                M69CSInuoto OberFerrari;65;0;0;0;0;0;0;0;0;0;0;  0",

    "INCERTI TELANI JOHNATAN;1982;Calypso;999999;3400;0;AT4226921;2;1112;INCERTI TELANI JOHNATAN       M82Calypso;17;0;0;0;0;0;0;0;0;0;0;",
    "TARABINI RICCARDO;1972;ScuolaNuoto CsiCarpi;999999;3280;0;;2;1112;TARABINI RICCARDO             M72ScuolaNuoto CsiCarpi;51;0;0;0;0;0;0;0;0;0;0;",
    "CARAMASCHI FABRIZIO;1992;ScuolaNuoto CsiCarpi;999999;24440;0;;2;1154;CARAMASCHI FABRIZIO           M92ScuolaNuoto CsiCarpi;65;0;0;0;0;0;0;0;0;0;0;",
    "DI PASQUALE MARCO;1979;ScuolaNuoto CsiCarpi;999999;30500;0;;2;1154;DI PASQUALE MARCO             M79ScuolaNuoto CsiCarpi;66;0;0;0;0;0;0;0;0;0;0;",
    "FORNETTI DAVIDE;1981;ScuolaNuoto CsiCarpi;999999;30910;0;;2;1154;FORNETTI DAVIDE               M81ScuolaNuoto CsiCarpi;67;0;0;0;0;0;0;0;0;0;0;",
    "GATTI LUCA;1979;ScuolaNuoto CsiCarpi;999999;3870;0;;2;1132;GATTI LUCA                    M79ScuolaNuoto CsiCarpi;68;0;0;0;0;0;0;0;0;0;0;",
    "GUIDETTI FRANCESCO;1982;ScuolaNuoto CsiCarpi;999999;4400;0;;2;1132;GUIDETTI FRANCESCO            M82ScuolaNuoto CsiCarpi;69;0;0;0;0;0;0;0;0;0;0;",
    "LEONI ALESSANDRO;1989;ScuolaNuoto CsiCarpi;999999;24440;0;;2;1154;LEONI ALESSANDRO              M89ScuolaNuoto CsiCarpi;70;0;0;0;0;0;0;0;0;0;0;",

    "ATTOLINI FEDERICO;1962;CSInuoto OberFerrari;11440;999998;2;AT04205055;2;1843;ATTOLINI FEDERICO             M62CSInuoto OberFerrari;66;0;0;0;0;0;0;0;0;0;0;  0",
    "BERTOZZI ORLANDO;1968;CSInuoto OberFerrari;10390;10420;2;AT04227916;2;1743;BERTOZZI ORLANDO              M68CSInuoto OberFerrari;67;0;0;0;0;0;0;0;0;0;0;  0",
    "BIANCHI ELENA;1967;CSInuoto OberFerrari;13080;12980;4;AT04205106;1;743;BIANCHI ELENA                 F67CSInuoto OberFerrari;68;0;0;0;0;0;0;0;0;0;0;  0",
    "BONACINI MONICA;1969;CSInuoto OberFerrari;25420;25300;1;AT04205127;2;744;BONACINI MONICA               F69CSInuoto OberFerrari;69;0;0;0;0;0;0;0;0;0;0;  0",
    "BUDASSI VALENTINA;1990;CSInuoto OberFerrari;11740;11838;5;AT04205174;2;343;BUDASSI VALENTINA             F90CSInuoto OberFerrari;71;0;0;0;0;0;0;0;0;0;0;  0",
    "FORMENTINI DAVIDE;1988;CSInuoto OberFerrari;999999;4180;4;AT04205413;2;1322;FORMENTINI DAVIDE             M88CSInuoto OberFerrari;74;0;0;0;0;0;0;0;0;0;0;  0",
    "FRANCESCHINI STEFANO;1973;CSInuoto OberFerrari;25340;24982;7;AT04202946;2;1644;FRANCESCHINI STEFANO          M73CSInuoto OberFerrari;75;0;0;0;0;0;0;0;0;0;0;  0",
    "GANGAROSSA DAVIDE;1966;CSInuoto OberFerrari;12130;11940;11;AT04205436;1;1743;GANGAROSSA DAVIDE             M66CSInuoto OberFerrari;76;0;0;0;0;0;0;0;0;0;0;  0",
    "LEONARDI ELISA;1975;CSInuoto OberFerrari;31580;30250;3;AT04205537;2;644;LEONARDI ELISA                F75CSInuoto OberFerrari;77;0;0;0;0;0;0;0;0;0;0;  0",
    "LIGABUE MARCO;1971;CSInuoto OberFerrari;3190;3241;2;AT04227648;2;1612;LIGABUE MARCO                 M71CSInuoto OberFerrari;79;0;0;0;0;0;0;0;0;0;0;  0",
    "MARTIGNANI ALBERTO;1961;CSInuoto OberFerrari;4020;4030;1;AT04227918;2;1822;MARTIGNANI ALBERTO            M61CSInuoto OberFerrari;80;0;0;0;0;0;0;0;0;0;0;  0",
    "NASI NICOLE;1994;CSInuoto OberFerrari;10280;10100;1;AT04218743;1;243;NASI NICOLE                   F94CSInuoto OberFerrari;81;0;0;0;0;0;0;0;0;0;0;  0",
    "PESARE REBECCA;1995;CSInuoto OberFerrari;999999;10500;2;AT04205708;2;243;PESARE REBECCA                F95CSInuoto OberFerrari;82;0;0;0;0;0;0;0;0;0;0;  0",
    "PEZZI STEFANIA;1981;CSInuoto OberFerrari;24320;24890;2;AT04205712;2;444;PEZZI STEFANIA                F81CSInuoto OberFerrari;83;0;0;0;0;0;0;0;0;0;0;  0",
    "ROSCA IOAN STELIAN;1974;CSInuoto OberFerrari;21770;22000;1;AT04231262;2;1644;ROSCA IOAN STELIAN            M74CSInuoto OberFerrari;84;0;0;0;0;0;0;0;0;0;0;  0",
    "SARAVO CRISTIAN;1977;CSInuoto OberFerrari;999999;3800;2;AT04216859;2;1522;SARAVO CRISTIAN               M77CSInuoto OberFerrari;85;0;0;0;0;0;0;0;0;0;0;  0",
    "SESENA BARBARA;1971;CSInuoto OberFerrari;30510;25600;1;AT04206799;2;644;SESENA BARBARA                F71CSInuoto OberFerrari;86;0;0;0;0;0;0;0;0;0;0;  0",
    "STROZZI PIERANTONIO;1963;CSInuoto OberFerrari;31190;30140;3;AT04227650;2;1844;STROZZI PIERANTONIO           M63CSInuoto OberFerrari;87;0;0;0;0;0;0;0;0;0;0;  0",
    "VEZZANI GIORGIA;1995;CSInuoto OberFerrari;4290;4000;6;AT04211437;2;222;VEZZANI GIORGIA               F95CSInuoto OberFerrari;89;0;0;0;0;0;0;0;0;0;0;  0",
    "ZACCHI FRANCESCO;1966;CSInuoto OberFerrari;999996;3550;3;AT04227649;2;1722;ZACCHI FRANCESCO              M66CSInuoto OberFerrari;90;0;0;0;0;0;0;0;0;0;0;  0",
    "ZULIANI MATTEO;1992;CSInuoto OberFerrari;3100;3112;2;AT04206923;2;1222;ZULIANI MATTEO                M92CSInuoto OberFerrari;91;0;0;0;0;0;0;0;0;0;0;  0",
  ].each do |fixture_row|

    context "as a valid instance," do
      subject do
        @complete_name, @year_of_birth, @team_name, @result_timing, @entry_timing,
        @rank, @badge_code, @total_events, @category_code, @combined_key,
        @entry_order = fixture_row.split(';')
        CsiResultDAO.new(
          @complete_name, @year_of_birth, @team_name, @result_timing, @entry_timing,
          @rank, @badge_code, @total_events, @category_code, @combined_key,
          @entry_order
        )
      end

      it_behaves_like( "(the existance of a method)", [
        :complete_name, :year_of_birth, :team_name, :result_timing, :entry_timing,
        :rank, :badge_code, :total_events, :category_code, :combined_key,
        :entry_order,
        :is_disqualified, :is_retired, :is_entry_no_time, :is_result_missing,
        :length_in_metres, :stroke_type_code, :category_type_code, :gender_type_id,
        :event_types_code, :decorated_result_time, :decorated_entry_time,
        :to_s
      ] )


      describe "#to_s" do
        it "is a non empty string" do
          expect( subject.to_s.size ).to be > 0
# DEBUG
#          puts "\r\n" << subject.to_s
        end
      end

      describe "#decorated_result_time" do
        it "contains a double quote when non-zero (else: empty string)" do
# DEBUG
          puts "\r\ndecorated_result_time: " << subject.decorated_result_time <<
               (subject.is_disqualified ? ' DSQ' : '') <<
               (subject.is_retired ? ' RET' : '') <<
               (subject.is_result_missing ? ' ---' : '')
          unless subject.is_disqualified || subject.is_retired || subject.is_result_missing
            expect( subject.decorated_result_time ).to include('"')
          else
            expect( subject.decorated_result_time ).to eq('')
          end
        end
        it "contains always a single quote when non-zero (else: empty string)" do
          unless subject.is_disqualified || subject.is_retired || subject.is_result_missing
            expect( subject.decorated_result_time ).to include("'")
          else
            expect( subject.decorated_result_time ).to eq('')
          end
        end
      end
      describe "#decorated_entry_time" do
        it "contains a double quote when non-zero (else: empty string)" do
# DEBUG
          puts "\r\ndecorated_entry_time: " << subject.decorated_entry_time <<
               (subject.is_entry_no_time ? ' ---' : '')
          unless subject.is_entry_no_time
            expect( subject.decorated_entry_time ).to include('"')
          else
            expect( subject.decorated_entry_time ).to eq('')
          end
        end
        it "contains always a single quote when non-zero (else: empty string)" do
# DEBUG
#          puts "\r\n" << subject.decorated_entry_time
          unless subject.is_entry_no_time
            expect( subject.decorated_entry_time ).to include("'")
          else
            expect( subject.decorated_entry_time ).to eq('')
          end
        end
      end

      describe "#gender_type_id" do
        it "is #{GenderType::MALE_ID} if the #category_code is longer than 3 (else: #{GenderType::FEMALE_ID})" do
          if ( subject.category_code.size > 3 )
            expect( subject.gender_type_id ).to eq( GenderType::MALE_ID )
          else
            expect( subject.gender_type_id ).to eq( GenderType::FEMALE_ID )
          end
        end
      end

      describe "#is_disqualified, when true," do
        it "has a result_timing of '0'" do
          if subject.is_disqualified
            expect( subject.result_timing ).to eq('0')
          end
        end
      end
      # false: it depends

      describe "#is_retired, when true," do
        it "has a result_timing of '0'" do
          if subject.is_retired
            expect( subject.result_timing ).to eq('0')
          end
        end
      end
      # false: it depends

      describe "#is_entry_no_time, when true," do
        it "has an entry_timing of '0'" do
          if subject.is_entry_no_time
            expect( subject.entry_timing ).to eq('0')
          end
        end
      end
      describe "#is_entry_no_time, when false," do
        it "has an entry_timing different from '0'" do
          unless subject.is_entry_no_time
            expect( subject.entry_timing ).not_to eq('0')
          end
        end
      end

      describe "#complete_name" do
        it "is extracted from the fixture" do
          expect( fixture_row ).to include( subject.complete_name )
        end
        it "is the complete name of the swimmer" do
          expect( subject.complete_name ).to include( @complete_name )
        end
      end
      describe "#year_of_birth" do
        it "is extracted from the fixture" do
          expect( fixture_row ).to include( subject.year_of_birth )
        end
        it "is the year_of_birth of the swimmer" do
          expect( subject.year_of_birth ).to include( @year_of_birth )
        end
      end
      describe "#team_name" do
        it "is extracted from the fixture" do
          expect( fixture_row ).to include( subject.team_name )
        end
        it "is the team name for the swimmer" do
          expect( subject.team_name ).to include( @team_name )
        end
      end

      describe "#result_timing" do
        it "is extracted from the fixture (when not disqualified or retired)" do
          expect( fixture_row ).to include( subject.result_timing ) unless subject.is_disqualified || subject.is_retired || subject.is_result_missing
        end
        it "is the result_timing of the swimmer (when not disqualified or retired)" do
          expect( subject.result_timing ).to include( @result_timing ) unless subject.is_disqualified || subject.is_retired || subject.is_result_missing
        end
      end
      describe "#entry_timing" do
        it "is extracted from the fixture (when it has an entry time)" do
          expect( fixture_row ).to include( subject.entry_timing ) unless subject.is_entry_no_time
        end
        it "is the entry_timing of the swimmer (when it has an entry time)" do
          expect( subject.entry_timing ).to include( @entry_timing ) unless subject.is_entry_no_time
        end
      end
      describe "#rank" do
        it "is extracted from the fixture (when not disqualified or retired)" do
          expect( fixture_row ).to include( subject.rank ) unless subject.is_disqualified || subject.is_retired || subject.is_result_missing
        end
        it "is the rank of the swimmer (when not disqualified or retired)" do
          expect( subject.rank ).to include( @rank ) unless subject.is_disqualified || subject.is_retired || subject.is_result_missing
        end
      end

      describe "#badge_code" do
        it "is extracted from the fixture" do
          expect( fixture_row ).to include( subject.badge_code )
        end
        it "is the badge_code of the swimmer" do
          expect( subject.badge_code ).to include( @badge_code )
        end
      end
      describe "#total_events" do
        it "is extracted from the fixture" do
          expect( fixture_row ).to include( subject.total_events )
        end
        it "is the total_events count subscribed by the swimmer" do
          expect( subject.total_events ).to include( @total_events )
        end
      end
      describe "#category_code" do
        it "is extracted from the fixture" do
          expect( fixture_row ).to include( subject.category_code )
        end
        it "is the composite category_code of the swimmer" do
          expect( subject.category_code ).to include( @category_code )
        end
      end
      describe "#combined_key" do
        it "is extracted from the fixture" do
          expect( fixture_row ).to include( subject.combined_key )
        end
        it "is the combined_key for the swimmer" do
          expect( subject.combined_key ).to include( @combined_key )
        end
      end
      describe "#entry_order" do
        it "is extracted from the fixture" do
          expect( fixture_row ).to include( subject.entry_order )
        end
        it "is the entry_order for the swimmer" do
          expect( subject.entry_order ).to include( @entry_order )
        end
      end
    end

  end
  #-- -------------------------------------------------------------------------
  #++
end

