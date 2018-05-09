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
    attr_reader :meeting_event

    # These can be edited later on:
    attr_accessor :code, :programs, :has_start_list
    
    # Automatically populates programs if populate parameters set to true
    #
    def initialize( meeting_event, has_start_list = false, populate = false  )
      
      @meeting_event  = meeting_event
      
      @code           = meeting_event.event_type.i18n_description
      @has_start_list = has_start_list
      @programs       = []
      @categories     = {}
      
      populate_programs( meeting_event, has_start_list, populate ) if populate
    end
    
    # Populates the meeting programs of the event
    #
    def populate_programs( meeting_event = @meeting_event, has_start_list = @has_start_list, populate = false )
      added = 0
      meeting_event.meeting_programs.each do |meeting_program|
        @programs << MeetingResultProgramDAO.new( meeting_program, has_start_list, populate )
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
    attr_reader :meeting_program

    # These can be edited later on:
    attr_accessor :event_name, :category_name, :gender_name, :has_start_list, :rank
    
    # Automatically populates ranking if populate parameters set to true
    #
    def initialize( meeting_program, has_start_list = false, populate = false )

      @meeting_program = meeting_program
      
      @event_name      = meeting_program.get_complete_event_name
      @category_name   = meeting_program.get_category_type_name
      @gender_name     = meeting_program.gender_type.i18n_short
      @has_start_list  = has_start_list
      @rank            = []

      populate_ranking( meeting_program, populate ) if populate
    end
    
    # Populates the meeting program ranking
    #
    def populate_ranking( meeting_program = @meeting_program, populate = false )
      added = 0
      meeting_program.meeting_individual_results.sort_by_timing.each do |mir|
        @rank << MeetingResultIndividualDAO.new( mir, populate )
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
    attr_reader :meeting_individual_result

    # These can be edited later on:
    attr_accessor :rank, :complete_name, :year_of_birth, :timing, :standard_score, :meeting_score, :google_cup_score, :team_name, :passages
    
    # Automatically populates passages if populate parameters set to true
    #
    def initialize( meeting_individual_result, populate = false )

      @meeting_individual_result = meeting_individual_result
      
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

      populate_passages( meeting_individual_result ) if populate
    end
    
    # Populates the meeting individual result passages, if any
    #
    def populate_passages( meeting_individual_result = @meeting_individual_result )
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
    attr_reader :passage

    # These can be edited later on:
    attr_accessor :timing
    
    #
    def initialize( passage )

      @passage = passage.id

      @timing  = passage.get_timing
      
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # These must be initialized on creation:
  attr_reader :meeting

  # These can be edited later on:
  attr_accessor :id, :events, :has_start_list
  
  #
  def initialize( meeting, populate = false )
    
    @meeting        = meeting

    @id             = meeting.id
    @events         = []
    @has_start_list = meeting.meeting_entries.exists?

    populate_events( meeting, has_start_list, populate ) if populate
  end

  # Populates the meeting events
  #
  def populate_events( meeting = @meeting, has_start_list = @has_start_list, populate = false )
    added = 0
    meeting.meeting_events.each do |meeting_event|
      @events << MeetingResultEventDAO.new( meeting_event, has_start_list, populate )
      added += 1
    end
    added
  end
end
