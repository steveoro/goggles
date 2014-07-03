#
# == UserTrainingStoriesHelper
#
# Assorted helpers for clickable links rendering.
#
# @author   Steve A.
# @version  4.00.335
#
module UserTrainingsHelper

  # Returns the HTML for the UserTrainingController#index() action.
  #
  def link_to_user_trainings()
    link_to( user_trainings_path() ) do
      image_tag('page_find.png') << I18n.t(:back_to_index_view)
    end
  end


  # Returns the HTML for the UserTrainingController#show() action linked to the
  # specified UserTraining instance, but only if the current user can access its contents.
  # Otherwise it simply returns the label.
  #
  # Assumes user_training is a valid UserTraining instance.
  #
  def link_to_user_training_show( user_training )
    link_to( user_training_path(id: user_training.id) ) do
      image_tag('page_go.png') << " #{I18n.t(:show)}"
    end if check_user_training_visibility_for( user_training )
  end


  # Returns the HTML for the UserTrainingController#show() action of the specified
  # UserTraining instance, using the training description as link label, but only
  # if the current user can access its contents.
  # Otherwise it simply returns the label.
  #
  # Assumes user_training is a valid UserTraining instance.
  #
  def link_to_user_training_show_with_label( user_training )
    label =  user_training.get_full_name()
    if check_user_training_visibility_for( user_training )
      link_to( label, user_training_path( id: user_training.id ) )
    else
      label
    end
  end


  # Returns the HTML for the UserTrainingController#printout() action of the specified
  # UserTraining instance, but only if the current user can access its contents.
  #
  # Assumes user_training is a valid UserTraining instance.
  #
  def link_to_user_training_printout( user_training )
    link_to( user_training_printout_path(id: user_training.id) ) do
      image_tag('page_white_acrobat.png') << " PDF" # Too long for grid: I18n.t('agex_action.download_pdf')
    end if check_user_training_visibility_for( user_training )
  end


  # Returns the HTML for the UserTrainingController#duplicate() action of the specified
  # UserTraining instance, but only if the current user can access its contents.
  #
  # Assumes user_training is a valid UserTraining instance.
  #
  def link_to_user_training_duplicate( user_training )
    link_to(
      user_training_duplicate_path(id: user_training.id),
      method: :post,
      confirm: I18n.t('netzke.basepack.grid_panel.are_you_sure')
    ) do
      I18n.t(:duplicate)
    end if check_user_training_visibility_for( user_training )
  end


  # Returns the HTML for the UserTrainingController#create_user_story() action of the specified
  # UserTraining instance, but only if the current user can access its contents.
  #
  # Assumes user_training is a valid UserTraining instance.
  #
  def link_to_user_training_create_user_story( user_training )
    link_to(
      I18n.t('user_trainings.create_user_story'),
      user_training_create_user_story_path(id: user_training.id),
      method: :post,
      confirm: I18n.t('user_trainings.create_user_story_ask_confirm')
    ) if check_user_training_visibility_for( user_training )
  end


  # Returns the HTML for the UserTrainingController#edit() action of the specified
  # UserTraining instance, but only if the current user is its owner.
  # (Only creators can edit their content.)
  #
  # Assumes user_training is a valid UserTraining instance.
  #
  def link_to_user_training_edit( user_training )
    link_to( edit_user_training_path(id: user_training.id) ) do
      image_tag('page_edit.png') << " #{I18n.t(:edit)}"
    end if check_user_training_ownership_for( user_training )
  end


  # Returns the HTML for the UserTrainingController#delete() action of the specified
  # UserTraining instance, but only if the current user is its owner.
  # (Only creators can edit their content.)
  #
  # Assumes user_training is a valid UserTraining instance.
  #
  def link_to_user_training_delete( user_training )
    link_to(
      I18n.t(:delete),
      user_training_path(id: user_training.id),
      method: :delete,
      confirm: I18n.t('netzke.basepack.grid_panel.are_you_sure')
    ) if check_user_training_ownership_for( user_training )
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Checks if the current_user owns the specified user_training
  # Returns +true+ when successful.
  def check_user_training_ownership_for( user_training )
    UserTrainingAccessibility.new(current_user, user_training, admin_signed_in?).is_owned
  end

  # Checks if the current_user can access (R/O) the specified user_training
  # Returns +true+ when successful.
  def check_user_training_visibility_for( user_training )
    UserTrainingAccessibility.new(current_user, user_training, admin_signed_in?).is_visible
  end
  #-- -------------------------------------------------------------------------
  #++
end
