# encoding: utf-8


=begin

= PassagesController

  - version:  4.00.367.20140724
  - author:   Leega

=end
class PassagesController < ApplicationController
  respond_to :html

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!
  before_filter :authenticate_entity!                # Devise "standard" HTTP log-in strategy
  
  # Leega
  # FIXME Check those filters!
  before_filter :current_user_have_enough_confirmations! 
  before_filter :verify_swimmer_ownership, except: [:new, :create]
  #-- -------------------------------------------------------------------------
  #++


  # Index/Search action.
  #
  def index
    @title = I18n.t('passages.index_title')
    @passages_grid = initialize_grid(
      Passage,
      include: [:meeting_individual_result, :meeting_program, :meeting_event, :event_type],
      order: :scheduled_date,
      order_direction: 'asc',
      per_page: 25
    )
  end
  # ----------------------------------------------------------------------------


  # Returns the passage found for a specific passage id.
  #
  # === Params:
  # - id: the Passage.id
  #
  def show
    @passage = Passage.find_by_id(params[:id])
    if @passage.nil?
      redirect_to( passages_path() ) and return
    end
    @title = I18n.t('passages.title_show')
    respond_with( @passage )
  end
  # ----------------------------------------------------------------------------


  # Returns the passages found for a specific meeting individual result id.
  #
  # === Params:
  # - id: the MeetingIndividualResult.id
  #
  def for_meeting_individual_result
    @passages = MeetingIndividualResult.find_by_id(params[:id]).get_passages
    @title = I18n.t('passages.title_show')
    respond_with( @passages )
  end
  # ----------------------------------------------------------------------------


  # Prepares the form for the creation of a new Passage.
  #
  # === Params:
  # - :meeting_individual_result_id
  #
  def new
    @meeting_individual_result = MeetingIndividualResult.find_by_id(params[:meeting_individual_result_id])
    if @meeting_individual_result.nil?
      redirect_to( passages_path() ) and return
    end
    
    @passage = Passage.new
    @passage.user_id = current_user.id
    @passage.swimmer_id = current_user.swimmer_id
    @passage.meeting_individual_result_id = @meeting_individual_result.id 
    @passage.meeting_program_id = @meeting_individual_result.meeting_program_id 
    @passage.team_id = @meeting_individual_result.team_id 
    @title = I18n.t('passages.title_show')
    respond_with( @passage )
  end
  # ---------------------------------------------------------------------------


  # Creates a new Passage.
  # Assumes user, swimmer and meeting_individual_result was set by the new action
  #
  # === Params:
  # - :meeting_individual_result => the hash of attributes for the creation
  #
  def create
    @passage = Passage.create(params[:passage])
    respond_with( @passage )
  end
  # ---------------------------------------------------------------------------


  # Prepares the form for the editing of a new Passage.
  #
  # === Params:
  # - id: the Passage.id
  #
  def edit
    @passage = Passage.find_by_id(params[:id])
    redirect_to( passages_path() ) and return if @passage.nil?
    @title = I18n.t('passages.title_show')
    respond_with( @passage )
  end
  # ---------------------------------------------------------------------------


  # Updates an existing Passage.
  #
  # === Params:
  # - id: the Passage.id
  # - passage: the hash of attributes for the update
  #
  def update
    @passage = Passage.find_by_id(params[:id])
    redirect_to( passages_path() ) and return if @passage.nil?
    @passage.update_attributes(params[:passage])
    respond_with( @passage )
  end
  # ---------------------------------------------------------------------------


  # Deletes an existing Passage.
  #
  # === Params:
  # - id: the Passage.id
  #
  def destroy
    @passage = Passage.find_by_id(params[:id])
    if @passage
      if @passage.destroy
        flash[:info] = I18n.t('passages.passage_deleted')
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
    end
    redirect_to( passages_path() ) and return
  end
  # ---------------------------------------------------------------------------
  
  
  private

  # Verifies that a passage id is provided as a parameter to this controller.
  # Assigns the @passage instance when successful.
  #
  # == Controller Params:
  # id: the passage id to be processed by most of the methods (see before filter above)
  #
  def set_passage
    @passage = Passage.find_by_id( params[:id].to_i )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Verifies that the passage id is provided as a parameter
  # and that the corresponding passage is referred to the current swimmer.
  # Otherwise, it redirects to the home page.
  # Assigns the @passage when successful.
  # (Assumes log-in has been enforced elsewhere.)
  #
  # == Controller Params:
  # id: the passage id to be processed by most of the methods (see before filter above)
  #
  def verify_swimmer_ownership
    set_passage
    if swimmer_id = current_user.swimmer_id
      return
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( root_path() ) and return
    end
  end
  # ----------------------------------------------------------------------------

  # Leega: FIXME
  # Does that method really needed?
  # This method should be globalized. It was now duplicated from swimmng_pool_review
  #  
  # Returns true if the user doesn't meet the
  # criteria for creating a Review or false otherwise.
  #
  def current_user_have_enough_confirmations!
    # Only a confirmed swimmer-user can start the creation of a swimming-pool review:
    if current_user.has_swimmer_confirmations?
      true
    else
      flash[:error] = I18n.t(:invalid_action_request)
      false
    end
  end
  # ----------------------------------------------------------------------------

  # Leega: FIXME
  # This method should be globalized even if we would check something more or different.
  # It was now duplicated from swimmng_pool_review
  #  
  # Returns true if the user doesn't meet the
  # criteria for creating a Review or false otherwise.
  #
  def current_user_does_not_have_enough_confirmations?
    # Only a confirmed swimmer-user can start the creation of a swimming-pool review:
    if current_user.has_swimmer_confirmations?
      false
    else
      flash[:error] = I18n.t(:invalid_action_request)
      true
    end
  end
  # ----------------------------------------------------------------------------
end
