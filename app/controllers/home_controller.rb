# encoding: utf-8
require 'common/format'


class HomeController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!, only: [:associate, :dissociate]
  before_filter :authenticate_entity!, only: [:associate, :dissociate] # Devise HTTP log-in strategy
  # ---------------------------------------------------------------------------


  def index
    @articles = Article.find(
      :all,
      :order => "is_sticky DESC, updated_at DESC",
      :limit => AppParameter.get_default_pagination_rows_for( :articles )
    )
  end
  # ----------------------------------------------------------------------------


  def about
    @versioning = AppParameter.find_by_code( AppParameter::PARAM_VERSIONING_CODE )
                                                    # Retrieve, cleanse and pre-format gem info:
    @gem_info = []
    %x{gem list -l --no-details}.split("\n").each{ |row|
      @gem_info << row if row =~ / \([0-9]/
    }
  end


  def contact_us
  end


  # Associate action for a logged-in user. Handles both GET + POST
  def associate
    if request.post?                                # === POST: ===
      if params[:id]                                # Save the association both ways:
        current_user.update_attribute( :swimmer_id, params[:id].to_i )
        Swimmer.where( id: params[:id].to_i ).update_all( associated_user_id: current_user.id )
        swimmer = Swimmer.find_by_id( params[:id].to_i )
        if swimmer
          current_user.update_attribute( :year_of_birth, swimmer.year_of_birth )
          current_user.update_attribute( :first_name, swimmer.first_name.titleize ) unless swimmer.first_name.empty?
          current_user.update_attribute( :last_name, swimmer.last_name.titleize ) unless swimmer.last_name.empty?
        end
        current_user.reload
        flash[:notice] = I18n.t('home_controller.association_successful')
      end
      redirect_to( root_path() ) and return
                                                    # === GET: ===
    else                                            # Scompose the description in tokens:
      first_name, last_name = current_user.get_first_and_last_name()
      first_list  = Swimmer.where( ["complete_name LIKE ?", "%#{first_name.upcase}%"] )
      second_list = Swimmer.where( ["complete_name LIKE ?", "%#{last_name.upcase}%"] )
      if current_user.year_of_birth
        first_list.where( :year_of_birth => current_user.year_of_birth )
        second_list.where( :year_of_birth => current_user.year_of_birth )
      end
                                                    # Choose only the list with less results:
      @possible_swimmers = first_list.size < second_list.size ? first_list : second_list
      @possible_swimmers.delete_if { |swimmer_row|  # Filter out the worst results:
        (swimmer_row.complete_name =~ Regexp.new(first_name.upcase)).nil? || 
        (swimmer_row.complete_name =~ Regexp.new(last_name.upcase)).nil?
      }
    end
  end


  # POST-only action that removes an association to a swimmer for the current user.
  def dissociate
    if request.post?                                # === POST: ===
      Swimmer.where( id: current_user.swimmer_id ).update_all( associated_user_id: nil ) if current_user.swimmer_id
      current_user.update_attribute( :swimmer_id, nil )
      current_user.reload
      flash[:notice] = I18n.t('home_controller.dissociation_successful')
    end
    redirect_to( root_path() ) and return
  end
  # ----------------------------------------------------------------------------


  # "Work In Progress"/"Routing error" action rendering
  def wip
  end
  # ----------------------------------------------------------------------------
  #++
end
