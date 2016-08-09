#
# == TrainingsHelper
#
# Assorted helpers for clickable links rendering.
#
# @author   Steve A.
# @version  4.00.451
#
module TrainingsHelper

  # Returns the HTML for the TrainingController#index() action.
  #
  def link_to_trainings()
    link_to( trainings_path() ) do
      image_tag('page_find.png') << I18n.t(:back_to_index_view)
    end
  end


  # Returns the HTML for the TrainingController#show() action linked to the
  # specified Training instance, but only if the current user can access its contents.
  # Otherwise it simply returns the label.
  #
  # Does not return anything if the training is new (with id == nil).
  #
  def link_to_training_show( training )
    link_to( training_path(id: training.id) ) do
      image_tag('page_go.png') << " #{I18n.t(:show)}"
    end if training && check_training_visibility_for( training )
  end


  # Returns the HTML for the TrainingController#show() action of the specified
  # Training instance, using the training description as link label, but only
  # if the current user can access its contents.
  # Otherwise it simply returns the label.
  #
  # Assumes training is a valid Training instance.
  #
  def link_to_training_show_with_label( training )
    label =  training.get_full_name()
    if check_training_visibility_for( training )
      link_to( label, training_path( id: training.id ) )
    else
      label
    end
  end


  # Returns the HTML for the TrainingController#printout() action of the specified
  # Training instance, but only if the current user can access its contents.
  #
  # Assumes training is a valid Training instance.
  #
  def link_to_training_printout( training )
    link_to( training_printout_path(id: training.id) ) do
      image_tag('page_white_acrobat.png') << " PDF" # Too long for grid: I18n.t('agex_action.download_pdf')
    end if check_training_visibility_for( training )
  end


  # Returns the HTML for the TrainingController#duplicate() action of the specified
  # Training instance, but only if the current user can access its contents.
  #
  # Assumes training is a valid Training instance.
  #
  def link_to_training_duplicate( training )
    link_to(
      training_duplicate_path(id: training.id),
      method: :post,
      confirm: I18n.t('netzke.basepack.grid_panel.are_you_sure')
    ) do
      I18n.t(:duplicate)
    end if check_training_visibility_for( training )
  end


  # Returns the HTML for the TrainingController#create_user_training() action of the specified
  # Training instance, but only if the current user can access its contents.
  #
  # Assumes training is a valid Training instance.
  #
  def link_to_training_create_user_training( training )
    link_to(
      I18n.t('trainings.create_user_training'),
      training_create_user_training_path(id: training.id),
      method: :post,
      confirm: I18n.t('trainings.create_user_training_ask_confirm')
    ) if check_training_visibility_for( training )
  end


  # Returns the HTML for the TrainingController#edit() action of the specified
  # Training instance, but only if the current user is its owner.
  # (Only creators can edit their content.)
  #
  # Assumes training is a valid Training instance.
  #
  def link_to_training_edit( training )
    link_to( edit_training_path(id: training.id) ) do
      image_tag('page_edit.png') << " #{I18n.t(:edit)}"
    end if check_training_ownership_for( training )
  end


  # Returns the HTML for the TrainingController#delete() action of the specified
  # Training instance, but only if the current user is its owner.
  # (Only creators can edit their content.)
  #
  # Assumes training is a valid Training instance.
  #
  def link_to_training_delete( training )
    link_to(
      I18n.t(:delete),
      training_path(id: training.id),
      method: :delete,
      confirm: I18n.t('netzke.basepack.grid_panel.are_you_sure')
    ) if check_training_ownership_for( training )
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Checks if the current_user owns the specified training.
  # Returns +true+ when successful.
  def check_training_ownership_for( training )
    TrainingAccessibility.new( current_user, training ).is_owned
  end

  # Checks if the current_user can access (R/O) the specified training
  # Returns +true+ when successful.
  def check_training_visibility_for( training )
    TrainingAccessibility.new( current_user, training ).is_visible
  end
  #-- -------------------------------------------------------------------------
  #++
end
