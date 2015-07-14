# encoding: utf-8

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../strategies/entity_row_dup_collector'


=begin

= V2::SwimmerMergeChecker

  - Goggles framework vers.:  4.00.733
  - author: Steve A.

  Service class delegated to check the feasibility of merge operation between two
  Swimmer instances: a source/slave row into a destination/master one.

  If the analysis reports that the merge is indeed feasable, the merge itself can
  be carried out by the specific V2::SwimmerMerger class.

  ==== The merge operation MUST NOT BE done (and the analysis will fail) if:
  SAME SEASON, DIFFERENT AFFILIATION:
  - two swimmers belong to different teams in the same season;
    => merge the two teams first, if they need to be merged.

  SAME AFFILIATION, DIFFERENT OVERLAPPING DETAILS
  - two swimmers belong to the same team but have different detail results linked
    to the same day/event/meeting (the detail data can overlap) and be considered
    a "deletable duplicate" only if equal in almost every column, except for the
    swimmer_id.

  ==== The merge operation CAN BE done (and the analysis will succeed) if:
  DIFFERENT SEASON (DIFFERENT AFFILIATION)
  - two swimmers are completely different and have no overlapping details;

  SAME TEAM, COMPATIBLE DETAILS
  - two swimmers belong ultimately to the same team but do not have detail data
    linked to them that may conflict with each other (e.g. every result belongs
    to a different program when compared to the destination details, or when there
    are overlapping rows, these are indeed equalities, thus deletable duplicates).

=end
class V2::SwimmerMergeChecker

  # Creates a new instance
  #
  def initialize( slave_swimmer, master_swimmer )
    @slave_swimmer = slave_swimmer
    @master_swimmer = master_swimmer
    @row_collectors = {}
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the analyis text log for this instance.
  # It is never +nil+, empty at first.
  #
  def analysis_text_log
    @analysis_text_log ||= "\t*****************************\r\n\t   Swimmer-Merge Report\r\n\t*****************************\r\n"
  end
  # ----------------------------------------------------------------------------
  #++


  # Launches the analysis process for the merge feasibility of the source/slave
  # versus destination/master instances specified during construction.
  # This process does not alter the database.
  #
  # Returns +true+ if no problems are found and the merge operation seems feasable,
  # +false+ otherwise.
  # Check the #analysis_text_log member for a detailed outcome.
  #
  def analyze()
    raise ArgumentError.new( "@slave_swimmer must be an instance of Swimmer!" ) unless @slave_swimmer.instance_of?( Swimmer )
    raise ArgumentError.new( "@master_swimmer must be an instance of Swimmer!" ) unless @master_swimmer.instance_of?( Swimmer )
    analysis_text_log << "\r\nAnalyzing '#{@slave_swimmer.complete_name}' (id: #{@slave_swimmer.id}) => '#{@master_swimmer.complete_name}' (id: #{@master_swimmer.id})...\r\n\r\n"
                                                    # Skip process when the rows are the same:
    if @slave_swimmer.id == @master_swimmer.id
      analysis_text_log << "The two rows are already the same! Nothing to be done."
      return false
    end

=begin TODO
 - check for SAME SEASON, DIFFERENT AFFILIATION => fail

 - check for SAME AFFILIATION, DIFFERENT OVERLAPPING DETAILS => fail
  - MIR
  - Passage

=end

    true
  end
  #-- -------------------------------------------------------------------------
  #++
end
