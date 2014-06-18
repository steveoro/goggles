module UserTrainingStoriesHelper

  # Returns the HTML for the UserTrainingStoryController#show() action of the specified
  # UserTrainingStory instance.
  #
  # Assumes user_training_story is a valid UserTrainingStory instance.
  #
  def link_to_user_training_story_show( user_training_story )
    link_to( user_training_story.notes, user_training_story_path(id: user_training_story.id) )
  end


  # Returns the HTML for the UserTrainingController#show() action linked to the
  # specified UserTrainingStory instance. 
  #
  # Assumes user_training_story is a valid UserTrainingStory instance.
  #
  def link_to_user_training_show( user_training_story )
    if user_training_story.user_training_id
      link_to(
          UserTrainingStoryDecorator.decorate(user_training_story).get_user_training_name,
          user_training_path( id: user_training_story.user_training_id )
      )
    end
  end


  # Returns the HTML for the UserTrainingStoryController#edit() action of the specified
  # UserTrainingStory instance.
  #
  # Assumes user_training_story is a valid UserTrainingStory instance.
  #
  def link_to_user_training_story_edit( user_training_story )
    link_to( edit_user_training_story_path(id: user_training_story.id) ) do
        image_tag('page_edit.png') << " #{I18n.t(:edit)}"
    end
  end


  # Returns the HTML for the UserTrainingStoryController#delete() action of the specified
  # UserTrainingStory instance.
  #
  # Assumes user_training_story is a valid UserTrainingStory instance.
  #
  def link_to_user_training_story_delete( user_training_story )
    link_to(
      I18n.t(:delete),
      user_training_story_path(id: user_training_story.id),
      method: :delete,
      confirm: I18n.t('netzke.basepack.grid_panel.are_you_sure')
    )
  end
end
