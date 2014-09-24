# encoding: utf-8

require 'test_helper'
require 'data_import/strategies/fin_result_parser_tools'


class FinResultParserToolsTest < ActiveSupport::TestCase
  
  # Internal class used for testing
  class NameContainer
    attr_accessor :name
    def initialize(name)
      self.name = name
    end
  end


  test "respond to main class methods" do
    [
      'parse_filename_fields', 'parse_meeting_date',
      'parse_out_of_race_from_result_time',
      'parse_disqualified_from_result_time',
      'parse_disqualification_code_type_id_from_result_time',
      'parse_mins_secs_hds_from_result_time',
      'guess_city_from_team_name',
      'seems_to_be_the_same_city',
      'find_best_fuzzy_match'
    ].each do |method_name|
      assert( FinResultParserTools.respond_to?(method_name), "doesn't respond to '#{method_name}'!" )
    end
  end
  # ---------------------------------------------------------------------------


  test "seems_to_be_the_same_city" do
    is_the_same = FinResultParserTools.seems_to_be_the_same_city(
      # new:     /   existing:
      "Reggio nell'Emilia", "REGGIO EMILIA",
      'Reggio Emilia', "REGGIO EMILIA",
      'ITA', 'ITA'
    )
    assert( is_the_same )

    is_the_same = FinResultParserTools.seems_to_be_the_same_city(
      # new:     /   existing:
      "Reggio Calabria", "REGGIO EMILIA",
      'Reggio Calabria', "REGGIO EMILIA",
      'ITA', 'ITA'
    )
    assert( !is_the_same )
  end
  # ---------------------------------------------------------------------------


  test "find_best_fuzzy_match" do
    row = FinResultParserTools.find_best_fuzzy_match(
      'Reggio Emilia',
      [
        NameContainer.new("PARMA"),
        NameContainer.new("REGGIO NELL'EMILIA"),
        NameContainer.new("MODENA"),
        NameContainer.new("REGGIO CALABRIA"),
        NameContainer.new("BOLOGNA")
      ], :name
    )
    assert_equal( "REGGIO NELL'EMILIA", row.name )

    row = FinResultParserTools.find_best_fuzzy_match(
      'CSI NUOTO OBER FERR',
      [
        NameContainer.new("CSI Nuoto Ober Ferrari ASD"),
        NameContainer.new("CSI NUOTO CORREGGIO"),
        NameContainer.new("CSI NUOTO MASTER IMOLA"),
        NameContainer.new("FERRARI NUOTO MODENA"),
        NameContainer.new("NUOTO MASTER CSI LUGO")
      ], :name
    )
    assert_equal( "CSI Nuoto Ober Ferrari ASD", row.name )

    row = FinResultParserTools.find_best_fuzzy_match(
      'CSInuoto OberFerrari',
      [
        NameContainer.new("CSI Nuoto Ober Ferrari ASD"),
        NameContainer.new("CSI NUOTO CORREGGIO"),
        NameContainer.new("CSI NUOTO MASTER IMOLA"),
        NameContainer.new("FERRARI NUOTO MODENA"),
        NameContainer.new("NUOTO MASTER CSI LUGO")
      ], :name
    )
    assert_equal( "CSI Nuoto Ober Ferrari ASD", row.name )
  end
  # ---------------------------------------------------------------------------


  test "find minimum bias score for a single match" do
    perform_seek_minimum_bias_score_for( "CSI Nuoto Ober Ferrari ASD" )
    perform_seek_minimum_bias_score_for( "CSINuoto Ober Ferrari" )
    perform_seek_minimum_bias_score_for( "CSI Nuoto Master Ober Ferrari" )
    perform_seek_minimum_bias_score_for( "Nuotatori" )
    perform_seek_minimum_bias_score_for( "Acquatime" )
    perform_seek_minimum_bias_score_for( "Acqua Time" )
    perform_seek_minimum_bias_score_for( "Acquambiente" )
    perform_seek_minimum_bias_score_for( "Sport Management" )
    perform_seek_minimum_bias_score_for( "Albatros" )
    perform_seek_minimum_bias_score_for( "Albatros ASD" )
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  test "analyze_team_name_best_matches" do
    sql_text_log = "--\r\n-- *** Test SQL output: ***\r\n--\r\n\r\n"
    output_text_log = "\r\n\r\n\t*****************************\r\n\t  Test Team Analysis Report\r\n\t*****************************\r\n"
    result = FinResultParserTools.analyze_team_name_best_matches( "CSINuoto Ober Ferrari ASD", 101, output_text_log, sql_text_log )
    output_text_log = result.analysis_log_text
    sql_text_log    = result.sql_text

    result = FinResultParserTools.analyze_team_name_best_matches( "NC Azzurra", 101, output_text_log, sql_text_log )
    output_text_log = result.analysis_log_text
    sql_text_log    = result.sql_text

    result = FinResultParserTools.analyze_team_name_best_matches( "Acquatime", 101, output_text_log, sql_text_log )
    output_text_log = result.analysis_log_text
    sql_text_log    = result.sql_text

    result = FinResultParserTools.analyze_team_name_best_matches( "Acqua Time", 101, output_text_log, sql_text_log )
    output_text_log = result.analysis_log_text
    sql_text_log    = result.sql_text

    result = FinResultParserTools.analyze_team_name_best_matches( "Acquambiente", 101, output_text_log, sql_text_log )
    output_text_log = result.analysis_log_text
    sql_text_log    = result.sql_text

    result = FinResultParserTools.analyze_team_name_best_matches( "Sport Management", 101, output_text_log, sql_text_log )
    output_text_log = result.analysis_log_text
    sql_text_log    = result.sql_text

    result = FinResultParserTools.analyze_team_name_best_matches( "NuovoNuoto ASD", 101, output_text_log, sql_text_log )
    output_text_log = result.analysis_log_text
    sql_text_log    = result.sql_text

    puts output_text_log
    puts "\r\n\t\t-- * --\r\n"
    puts sql_text_log
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  test "collect matches using edited names" do
    check_for_multiple_matches( "CSI Nuoto Ober Ferrari ASD", 0.97, true, false )
    check_for_multiple_matches( "CSI Nuoto Master Ober Ferrari", 0.8, true, false )
    check_for_multiple_matches( "Nuotatori", 0.8, true, false )

    check_for_multiple_matches( "Acquatime", 0.97, true, false )
    check_for_multiple_matches( "Acquambiente", 0.97, true, false )
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  test "collect best matches report with bias 08" do
    report_multiple_matches( 0.8, false )
  end

  test "collect best matches report with bias 09" do
    report_multiple_matches( 0.9, false )
  end

  test "collect best matches report with bias 092" do
    report_multiple_matches( 0.92, false )
  end

  test "collect best matches report with bias 093" do
    report_multiple_matches( 0.93, false )
  end

  test "collect best matches report with bias 095" do
    report_multiple_matches( 0.95, false )
  end

  test "collect best matches report with bias 096" do
    report_multiple_matches( 0.96 )
  end

  test "collect best matches report with bias 097" do
    report_multiple_matches( 0.97 )
  end

  test "collect best matches report with bias 098" do
    report_multiple_matches( 0.98 )
  end

  test "collect best matches report with bias 099" do
    report_multiple_matches( 0.99 )
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  private


  def report_multiple_matches( bias_score, show_report = true )
    puts "\r\n\r\n--- Best matches with bias #{bias_score} ---"
    team_names = get_some_team_names()
    comparable_names = team_names.collect{ |e| NameContainer.new(e) }
    total_multiple_matches = 0

    300.times { |i|
      rnd_name = team_names[ rand(team_names.size) ]
      total_multiple_matches += collect_multiple_matches( rnd_name, comparable_names, bias_score, show_report )
    }
    puts "#{ show_report ? '' : "\r\n" }Total multiple matches: #{total_multiple_matches}."
  end
  # ---------------------------------------------------------------------------


  def check_for_multiple_matches( checked_name, bias_score, show_report = true,
                                  do_exact_match_test = true )
    puts "\r\n\r\n--- Searching for '#{checked_name}', bias #{bias_score} ---"
    team_names = get_some_team_names()
    comparable_names = team_names.collect{ |e| NameContainer.new(e) }
    total_multiple_matches = collect_multiple_matches(
        checked_name, comparable_names,
        bias_score, show_report, do_exact_match_test, true )
    puts "#{ show_report ? '' : "\r\n" }#{total_multiple_matches > 0 ? 'MULTIPLE MATCHES FOUND !' : '(no multiple matches)'}"
  end
  # ---------------------------------------------------------------------------


  def perform_seek_minimum_bias_score_for( checked_name, starting_bias_score = 0.99, show_report = true )
    puts "\r\n=== Collecting best matches for '#{checked_name}', bias: #{starting_bias_score} ==="
    result_bias = seek_minimum_bias_score_for( checked_name, starting_bias_score, show_report )
    puts "============================================\r\n>>> MIN. bias = #{result_bias} <<<\r\n"
                                                    # Test the lower search limit for the bias score
    assert( result_bias > 0.8 )                     # (below this value it is assumed that most of the matches may be actually false positives)
  end


  def seek_minimum_bias_score_for( checked_name, starting_bias_score, show_report = true )
    puts "- bias: #{starting_bias_score}..."
    team_names = get_some_team_names()
    comparable_names = team_names.collect{ |e| NameContainer.new(e) }
    total_matches = collect_multiple_matches(
        checked_name, comparable_names,
        starting_bias_score,
        show_report,
        false,                                      # do_exact_match_test
        true,                                       # show_even_1_result
        true                                        # return_actual_number_of_matches
    )
    puts "#{ show_report ? '' : "\r\n" }#{total_matches > 1 ? 'MULTIPLE MATCHES FOUND !' : '(single match)'}" if total_matches > 0
    if ( total_matches < 1 )                        # Search deeper using a more relaxed bias:
      starting_bias_score = seek_minimum_bias_score_for( checked_name, starting_bias_score - 0.01, show_report )
    end
    starting_bias_score
  end
  # ---------------------------------------------------------------------------


  def collect_multiple_matches( checked_name, comparable_names, bias_score,
                                show_report = true, do_exact_match_test = true,
                                show_even_1_result = false,
                                return_actual_number_of_matches = false )
    result_list = FinResultParserTools.collect_best_fuzzy_matches( checked_name, comparable_names, :name, bias_score )
    exact_match = nil                               # Skip reporting if only an exact match was found:
    puts("Best-matches for '#{checked_name}': (total #{result_list.size})") if show_even_1_result || (show_report && result_list.size > 1)

    result_list.each { |result|
      if show_even_1_result || (result_list.size > 1)
        if show_report
          puts "- '#{result[:row].name}'\t=> score: #{result[:score] }"
        else
          putc "."
        end
      end
      exact_match = result[:row] if ( result[:score] > 0.9999 )
    }
    if do_exact_match_test
      assert_not_nil( exact_match )
      assert_equal( checked_name, exact_match.name )
    end
    if return_actual_number_of_matches
      result_list.size
    else
      result_list.size > 1 ? 1 : 0
    end
  end
  # ---------------------------------------------------------------------------


  def get_some_team_names
    [
      "ABANO NUOTO", "ACQUADREAM FRANCIAC", "ACQUAMBIENTE", "ACQUAMBIENTE SSD -", "ACQUARIA SRL SSD",
      "ACQUASPORT BY T.D.", "ACQUA TIME SSD", "ACQUAVIVA 2001 SRL", "ADRIAKOS NM SENIGAL", "ADRIA NUOTO SSD  AR",
      "AICS PAVIA N", "AIRONCLUB BIO-SPORT", "ALBATROS", "ALBATROS A.S.DILETT.", "AMATORI NUOTO LIB",
      "AMICI DEL NUOTO FIR", "ANDREA DORIA", "ANTARES N CASTELFRA", "APD GEMINI SR", "AP PADANA",
      "AQUAFIT CASALE ASD", "AQUARIUM SSD ARL", "AQUATICA SRL", "AQUATICA TORINO SSD", "AQUATIC FORUM",
      "AQUATIC TEAM RAVENN", "AQVASPORT KRATOS", "A.R.C.A. SSD. RL", "AREZZO NUOTO ASD", "ARVALIA SWIMMING FI",
      "ASA  CINISELLO", "AS ACQUAZZURRA ATR", "AS AURELIA NUOTO", "ASD 24 SPORT VILLAG", "ASD ARCA CASTELMASS",
      "ASD CLUB L`AQUILA N", "AS DELFINO 93", "ASD SANTA CLARA - G", "ASD S. FRANCESCO HISTONIUM",
      "A.S.D. TEAM MARCHE MASTER", "AS GIS PORDENUOTO", "ASGORIZIA NUOTO", "AS LARUS NUOTO",
      "AS L. NUOTO GIUNONE", "AS MERANO", "AS MOLINELLA NUOTO", "AS NUOTO VIGONZA", "ASOLA N", "AS PESARO NUOTO",
      "ASS.NE AMICI DEL NU", "AS SOGEIS", "ASS.SPORTIVA DINAMI", "ATLANTIDE NUOTO ASD", "AVANTGARDA DESENZAN",
      "AZZURRA RACE TEAM", "BARZANÒ ACQUACLUB S", "BERGAMO N", "BERGAMO NUOTO ASD", "BERGAMO SWIM TEAM",
      "BOLZANO NUOTO", "BONDENO NUOTO 2012", "BRINDISI NUOTO ASD", "BUSTO NUOTO AS", "CAN ANIENE", "CAN BALDESIO",
      "CAN LECCO", "CAN MINCIO", "CANOTTIERI ARNO", "CANOTTIERI GARDA SA", "CAN VITTORINO", "CARONNO P N",
      "C.C.JONICA SPORT -C", "CENTRO NUOTO BASTIA", "CENTRO NUOTO COPPAR", "CENTRO NUOTO CORTON",
      "CENTRO NUOTO FLAMIN", "CENTRO NUOTO JESOLO", "CHIARI NUOTO", "CIRCOLO CAN NAPOLI", "CIRCOLO NUOTO LUCCA",
      "CITTÀ SPORT VICENZA", "CIVATURS DE AKKER", "CLOROLESI TREVIGLIO", "C.N. MONTECATINI", "CN UISP BOLOGNA",
      "CO.GE.SE. S.BENEDET", "CONERO WELLNESS SSD", "CONSELVE NUOTO SSD", "CONSORZIO LE CUPOLE", "COOPERNUOTO",
      "COOP IL CIGNO", "CORSICO NUOTO MASTE", "COSMOS CATANIA ASD", "CREMA N ASD", "CSI NUOTO OBER FERR",
      "CSN MONFALCONE ASD", "CS OLIMPIC VILLONGO", "C.S. PALLADIO SPA V", "CSS VERONA", "C.S. TEAM PADOVA",
      "C.U.S. BOLOGNA", "CUS BRESCIA", "DDS", "DERTHONA NUOTO", "D.L.F. LIVORNO", "D.N. PONTEDERA", "DUEMILA SSD A RL",
      "DUE PONTI Srl", "DYNAMIC SPORT ASD", "EQUIPE ITALIA ASD", "ESCHILO FITNESS S.S", "ESSECI NUOTO",
      "ESTENSE NUOTO CSI", "EUROPA S.A.", "EUROPA SC", "FANATIK TEAM FORLI", "FANFULLA N PN", "FANUM FORTUNAE ASD", 
      "FERRARANUOTO ASD", "FERRATELLA SPORT SR", "FIORENTINA NUOTO", "FIRENZE NUOTA MASTE",
      "FIRENZE NUOTA MASTER A.S.D.", "FLAMINIO SPORTING C", "FORUM SSD", "FUMANE NUOTO ASD", "FUTURA TIRANO",
      "G.A.M. TEAM", "GEAS", "GESTIONI NUOTO SSD", "GESTISPORT COOP", "GIS-GEST. IMPIANTI", "GIS SRL",
      "G.P. NUOTO MIRA SSD", "GRUPPO IN FORMA AS", "GRUPPO PESCE", "GS ARAGNO", "G.S.L.", "G.S. SAMB 87 A.S.D.",
      "G.S.VIGILI FUOCO RAV", "GS VIGILI FUOCO RAV", "G - UDINE", "GULLIVER DERTHONA", "GYMNASIUM SPILIMBER",
      "HIDRON SPORT SSD", "ICE CLUB COMO", "I DELFINI 88", "IL GABBIANO NAPOLI", "IL GRILLO", "INSUBRIKA ASD",
      "ISPRA SWIM PLANET", "JESOLO NUOTO  ASD", "JESOLONUOTO ASD", "KGO KLAB GEST.OPERA", "L`ACQUA DI PIANETA",
      "LA WELLNESS", "LEAENA SSD", "LECCOLIMPICA NUOTO", "LEOSPORT S.C. A R.L", "LERICI NUOTO MASTER",
      "LIB CINISELLO", "LIBERTAS N. KARALIS", "LIB MERATE DUE", "MACERATA SPORTING C", "MALASPINA SC", "MANTOVA N",
      "MARCONI 93 APD", "MASTER AICS BRESCIA", "MASTER MELZO N", "MASTERNUOTOFIDENZA", "MEDITERRANEA N GROT",
      "MILANO NUOTO MASTER", "MILLENNIUM ASD", "MODENA NUOTO", "MONTENUOTO S.S.D RL", "NANTES OSTIENSIS AS", 
      "NATATORIUM TREVISO", "NC 91 PARMA", "NC AZZURRA 91", "NC MILANO", "NC SEREGNO", "NC VALLE AOSTA ASD", 
      "NC VIGEVANO", "NEPTUN CLUB MOSCOW  (RUS)", "NERVIANESE N", "N MILANESI", "N MODENESI", "NOCETTA SSD",
      "NORD PADANIA N", "NUOTATORI CANAVESAN", "NUOTATORI MILANESI", "NUOTATORI PADOVANI", "NUOTATORI PISTOIESI",
      "NUOTATORI RAVENNATI", "NUOTATORI VENEZIANI", "NUOTO AICS BOLOGNA", "NUOTO CENTER FORLI`", "NUOTO CLUB 2000",
      "NUOTO CLUB CASTIGLI", "NUOTO CLUB FIRENZE", "NUOTO CLUB LUGO", "NUOTO LIB ROSIGNANO", "NUOTO LIVORNO SSD",
      "NUOTO MASTER CREMA", "NUOTO MASTER VERONA", "NUOTO MONTEFELTRO", "NUOTO OTELLO PUTINA", "NUOTO PERGINE",
      "NUOTOPIÙ ACADEMY AS", "NUOTO SCANDICCI 198", "NUOTO VICENZA LIB A", "NUOVO NUOTO", "OASI BOSCHETTO",
      "OLD STARS FIRENZE", "OLIMPIC SWIM PRO", "ONDABLU S.C. A RL", "OSTIGLIA NUOTO ASD", "PADOVANUOTO S.R.L.",
      "PARK CLUB - ALATRI", "PENTOTARY ACS D", "PERGINE NUOTO ASD", "PIANETA ACQUA", "PIANETA SPORT ACQUA",
      "PIAVE NUOTO AS", "PISCINE DI STRA E V", "POL. AMATORI PRATO", "POL. COM. RICCIONE", "POL COMUNALE RICCIO", 
      "POLISPORTIVA GARDEN", "POLISPORT SRL", "POLISP. SC NOALE AS", "POL. R.N. TRENTO", "POL S.GIULIANO",
      "POL.WATERPOLO MONTE", "POL. WATERPOLO PALE", "POOL N SAMBENEDETTE", "PRATOGRANDE SPORT", "PRESIDENT BOLOGNA",
      "PROGETTO ACQUA PESC", "PROGETTO NUOTO THIE", "QUANTA SPORT VILLAG", "RAPALLO N.", "RARI NANTES ALA ASD",
      "RARI NANTES APRILIA", "RARI NANTES CAGLIAR", "RARI NANTES GERBIDO", "RARI NANTES U.O.E.I", "RARI NANTES VENEZIA",
      "RED TIDE NEW YORK  (USA)", "REGGIANA NUOTO", "REZZATO N", "REZZATO N SSD", "RHODIGIUM NUOTO 200",
      "RINASCITA TEAM ROMA", "RIVIERA NUOTO VENET", "RN FRIULIA", "RN LEGNANO", "RN SARONNO", "SAFA 2000 SSD SRL",
      "SAN MARINO MASTER", "SAN MARINO MASTER  (SMR)", "SAN VITO NUOTO", "S.A.T. FINY TAORMIN", "SAVENA NUOTO TEAM A",
      "SCHIO NUOTO SSD", "SCM MONDADORI", "SC TUSCOLANO", "SEA SUB MODENA", "SENIGALLIA NUOTO A.",
      "SERENISSIMA NUOTO", "SETTEFRATI LIBERTAS", "SEVEN MASTER NUOTO", "SIMPLY SPORT", "SIS NUOTO VERONA AS",
      "SISPORT FIAT S.P.A.", "SOC. 2001 SRL - PAD", "SPAZIO SPORT ONE AR", "SPORTING CLUB ARBIZ",
      "SPORTING CLUB VERON", "SPORTING N LIB CAGL", "SPORTIVA NUOTO GROS", "SPORT MANAGEMENT", "SPORT MANAGEMENT SR",
      "SPORT PALACE ROMA", "S.S.D. PISCINE QUIN", "SS METANOPOLI", "S.S. ROVIGO NUOTO", "STILELIBERO SRL SSD",
      "STRADIVARI NUOTO AS", "SWIMMING CLUB ALESS", "TABYSIM CLUB  (SWE)", "TEAM EUGANEO", "TEAM INSUBRIKA ASD",
      "TEAM MARCHE MASTER", "TEAM NUOTO LOMBARDI", "TEAM OSIMO NUOTO AS", "TENNIS CLUB MATCH B", "TIBIDABO SSD",
      "TNT CREMONA", "TORINO NUOTO", "TRICOLORE MASTER AS", "TRIESTINA NUOTO", "TWV BRIXLEGG  (AUT)",
      "UISP NUOTO CORDENON", "UNIONE NUOTO FRIULI", "US VIS NOVA", "VALDAGNO LIBERTAS A", "VELA NUOTO ANCONA",
      "VEROLANUOTO", "VERSILIANUOTO", "VILLA BONELLI NUOTO", "VILLAGGIO FANCIULLO", "VILLAGGIO SPORT. ES",
      "VIMERCATE N", "VIRTUS BUONCONVENTO", "VIVISPORT POL.UISP", "WET LIFE VILLA GUAR"
    ]
  end
  # ---------------------------------------------------------------------------
end
