class FriendshipDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end


  # Renders the sharing options for verbose display.
  def to_verbose_sharing
    "#{object.friend.get_full_name} #{ I18n.t('social.shares') }: " <<
    [
      ( object.shares_passages  ? "#{ I18n.t('social.passages') }"  : '' ),
      ( object.shares_trainings ? "#{ I18n.t('social.trainings') }" : '' ),
      ( object.shares_calendars ? "#{ I18n.t('social.calendars') }" : '' )
    ].join(', ')
  end

end
