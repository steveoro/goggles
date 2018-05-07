# encoding: utf-8

require 'common/validation_error_tools'

=begin

= MeetingResultDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the structure for meeting results rendering.

=end
class MeetingResultDAO

  # Single event representation
  # It's the meeting event container
  class MeetingResultEventDAO
    # These must be initialized on creation:
    attr_reader :id

    # These can be edited later on:
    attr_accessor :code, :programs, :has_start_list
    
    #
    def initialize( meeting_event, has_start_list = false  )
      
      @code           = meeting_event.event_type.i18n_description
      @has_start_list = has_start_list
      @programs       = []
      @categories     = {}
      
    end
    
    # Populates the meeting events
    #
    def populate_programs( meeting_event, has_start_list = @has_start_list )
      added = 0
      meeting_event.meeting_programs.each do |meeting_program|
        @programs << MeetingResultProgramDAO.new( meeting_program, has_start_list )
        added += 1
        gender = meeting_program.gender_type.i18n_short
        category = meeting_program.get_category_type_name
        if !@categories[gender]
          @categories[gender] = []
        end
        @categories[gender] << category
      end
      added
    end
    
  end
  #-- -------------------------------------------------------------------------
  #++

  # Single event-gender-category rank
  # It's the meeting program rank rapresentation
  class MeetingResultProgramDAO
    # These must be initialized on creation:
    attr_reader :id

    # These can be edited later on:
    attr_accessor :event_name, :category_name, :gender_name, :has_start_list, :rank
    
    #
    def initialize( meeting_program, has_start_list = false )

      @id             = meeting_program.id
      @event_name     = meeting_program.get_complete_event_name
      @category_name  = meeting_program.get_category_type_name
      @gender_name    = meeting_program.gender_type.i18n_short
      @has_start_list = has_start_list
      @rank           = []
    end
    
    # Populates the meeting program ranking
    #
    def populate_ranking( meeting_program )
      added = 0
      meeting_program.meeting_individual_results.sort_by_timing.each do |mir|
        @rank << MeetingResultIndividualDAO.new( mir )
        added += 1
      end
      added
    end
    
    # Check if results are present for the program
    #
    def has_results?
      @rank.size > 0
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Single result data
  # It's the single result row
  class MeetingResultIndividualDAO
    # These must be initialized on creation:
    attr_reader :id

    # These can be edited later on:
    attr_accessor :rank, :complete_name, :year_of_birth, :timing, :standard_score, :meeting_score, :google_cup_score, :team_name, :passages
    
    #
    def initialize( meeting_individual_result )

      @id             = meeting_individual_result.id
      @swimmer        = meeting_individual_result.swimmer
      @team           = meeting_individual_result.team
      @passages       = []
      
      mird = meeting_individual_result.decorate
      @rank           = mird.get_rank_description
      @complete_name  = mird.get_swimmer_name
      @year_of_birth  = mird.get_year_of_birth
      @timing         = mird.get_timing
      @standard_score = mird.get_formatted_standard_points
      @meeting_score  = mird.get_formatted_individual_points
      @team_name      = mird.get_team_name
      
    end
    
    # Populates the meeting individual result passages, if any
    #
    def populate_passages( meeting_individual_result )
      added = 0
      meeting_individual_result.passages.each do |passage|
        @passages << MeetingResultPassageDAO.new( passage )
        added += 1
      end
      added
    end
    
    # Check if results are present for the program
    #
    def has_passages?
      @passages.size > 0
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Single result data
  # It's the single result row
  class MeetingResultPassageDAO
    # These must be initialized on creation:
    attr_reader :id

    # These can be edited later on:
    attr_accessor :timing
    
    #
    def initialize( passage )

      @id             = passage.id

      @timing         = passage.get_timing
      
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # These can be edited later on:
  attr_accessor :id, :events, :has_start_list
  
  #
  def initialize( meeting )

    @id             = meeting.id
    @events         = []
    
    @has_start_list = meeting.meeting_entries.exists?

  end

end
