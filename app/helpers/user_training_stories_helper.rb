#
# == UserTrainingStoriesHelper
#
# Assorted helpers for clickable links rendering.
#
# @author   Steve A.
# @version  4.00.451
#
module UserTrainingStoriesHelper

  # Returns the HTML for the UserTrainingStoryController#index() action.
  #
  def link_to_user_training_stories()
    link_to( user_training_stories_path() ) do
      image_tag('page_find.png') << I18n.t(:back_to_index_view)
    end
  end


  # Returns the HTML for the UserTrainingController#show() action linked to the
  # specified UserTrainingStory instance, but only if the current user can access its contents.
  # Otherwise it simply returns the label.
  #
  # Does not return anything if the training is nil.
  #
  def link_to_user_training_from_story( user_training_story )
    label =  UserTrainingStoryDecorator.decorate(user_training_story).get_user_training_name
    if user_training_story && user_training_story.user_training && user_training_story.user_training.visible_to_user(current_user)
      link_to(
          label,
          user_training_path( id: user_training_story.user_training_id )
      )
    else
      label
    end
  end


  # Returns the HTML for the UserTrainingStoryController#show() action of the specified
  # UserTrainingStory instance, using the training story notes as link label, but only
  # if the current user can access its contents.
  # Otherwise it simply returns the label.
  #
  # Assumes user_training_story is a valid UserTrainingStory instance.
  #
  def link_to_user_training_story_show_with_label( user_training_story )
    if check_story_visibility_for( user_training_story )
      link_to(
        user_training_story.notes,
        user_training_story_path(id: user_training_story.id)
      )
    else
      user_training_story.notes
    end
  end


  # Returns the HTML for the UserTrainingStoryController#show() action of the specified
  # UserTrainingStory instance, but only if the current user can access its contents.
  #
  # Assumes user_training_story is a valid UserTrainingStory instance.
  #
  def link_to_user_training_story_show( user_training_story )
    link_to( user_training_story_path(id: user_training_story.id) ) do
      image_tag('page_go.png') << " #{I18n.t(:show)}"
    end if check_story_visibility_for( user_training_story )
  end


  # Returns the HTML for the UserTrainingStoryController#edit() action of the specified
  # UserTrainingStory instance, but only if the current user is its owner.
  # (Only creators can edit their content.)
  #
  # Assumes user_training_story is a valid UserTrainingStory instance.
  #
  def link_to_user_training_story_edit( user_training_story )
    link_to( edit_user_training_story_path(id: user_training_story.id) ) do
        image_tag('page_edit.png') << " #{I18n.t(:edit)}"
    end if check_story_ownership_for( user_training_story )
  end


  # Returns the HTML for the UserTrainingStoryController#delete() action of the specified
  # UserTrainingStory instance, but only if the current user is its owner.
  # (Only creators can edit their content.)
  #
  # Assumes user_training_story is a valid UserTrainingStory instance.
  #
  def link_to_user_training_story_delete( user_training_story )
    link_to(
      I18n.t(:delete),
      user_training_story_path(id: user_training_story.id),
      method: :delete,
      confirm: I18n.t('netzke.basepack.grid_panel.are_you_sure')
    ) if check_story_ownership_for( user_training_story )
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Checks if the current_user owns the specified user_training_story
  # Returns +true+ when successful.
  def check_story_ownership_for( user_training_story )
    UserTrainingStoryAccessibility.new(current_user, user_training_story, admin_signed_in?).is_owned
  end

  # Checks if the current_user can access (R/O) the specified user_training_story
  # Returns +true+ when successful.
  def check_story_visibility_for( user_training_story )
    UserTrainingStoryAccessibility.new(current_user, user_training_story, admin_signed_in?).is_visible
  end
  #-- -------------------------------------------------------------------------
  #++
end
