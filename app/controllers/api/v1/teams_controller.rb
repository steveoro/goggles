#
# R/O RESTful API controller
#
class Api::V1::TeamsController < Api::BaseController

  respond_to :json
  before_action :ensure_format

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!, except: [:get_affiliation, :current_swimmers, :index]
  #-- -------------------------------------------------------------------------
  #++


  # Return the number of meetings attended by a Team instance
  # Usage: count_meetings_team_path( id: team_id_to_be_searched )
  #
  # === Params:
  # - id: the Team.id
  #
  def count_meetings
    team = Team.find_by_id( params[:id] )
    if team
      render( json: team.meetings.collect{|row| row.id}.uniq.size )
    else
      render( json: 0 )
    end
  end

  # Return the number of individual + relay results obtained by a Team instance
  # Usage: count_results_team_path( id: team_id_to_be_searched )
  #
  # === Params:
  # - id: the Team.id
  #
  def count_results
    team = Team.find_by_id( params[:id] )
    if team
      render( json: ( team.meeting_individual_results.count + team.meeting_relay_results.count ) )
    else
      render( json: 0 )
    end
  end

  # Combines both methods above to return a composed string
  # Usage: count_details_team_path( id: team_id_to_be_searched )
  #
  # === Params:
  # - id: the Team.id
  #
  def count_details
    team = Team.find_by_id( params[:id] )
    if team
      render(
        json: "#{I18n.t('meeting.total_attended_meetings')}: " +
              team.meetings.collect{|row| row.id}.uniq.size.to_s +
              ", #{I18n.t('meeting.total_results_short')}: " +
              ( team.meeting_individual_results.count + team.meeting_relay_results.count ).to_s
      )
    else
      render( json: '' )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the JSON array of all the Swimmers found for the specified Team id.
  # (The JSON array contains all the swimmers found for all the badges, indipendently
  # from the season.)
  #
  # == Params:
  # id: the team id to be processed
  #
  def current_swimmers
    team = Team.find_by_id( params[:id] )
    if team
      render( json: team.swimmers.uniq.to_a )
    else
      render( json: [] )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the +TeamAffiliation+ JSON-ified for the specified :season_id & (team):id.
  # Simply returns "null" when not found (valid JSON for +nil+).
  #
  def get_affiliation
    render( json: TeamAffiliation.find_by(season_id: params[:season_id], team_id: params[:id]) )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns a JSON-encoded Array of all the rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # This action is not restricted by authorization because is capped to
  # return 20 rows max.
  #
  # === Additional params:
  # - 'q': a matching (sub)string for the Team.name
  #
  def index
# DEBUG
#    puts "\r\n**** Api::V1::SwimmersController #index ****"
#    puts "- PARAMS: " << params.inspect
    # (This uses Squeel DSL syntax for where clauses)
    if params['q']
      filter = "%#{params['q']}%"
      @teams = Team.where( ["name LIKE ?", filter] )
          .order(:name).limit(20)
    else
      @teams = Team.order(:name).limit(20)
    end
    render status: 200, json: @teams
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded hash of the specified row data.
  # The keys of the Hash are the attributes as string.
  #
  # === Params:
  # - id: the Team.id
  #
  def show
    render status: 200, json: Team.find(params[:id])
  end
  #-- -------------------------------------------------------------------------
  #++
end
