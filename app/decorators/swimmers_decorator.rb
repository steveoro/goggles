class SwimmersDecorator < Draper::Decorator
  delegate_all
  
  # TODO REFACTOR USING SwimmerUserStrategy.new( object ) for action enable !!


  # Returns true if this swimmer instance can support the "social/confirm"
  # action links or buttons. False otherwise.
  #
  def is_confirmable_by( another_user )
    !!(
      is_associated_to_somebody_else_than( another_user ) &&
      another_user.find_any_confirmation_given_to( object.associated_user ).nil?
    )
  end

  # Returns true if this swimmer instance can support the "social/unconfirm"
  # action links or buttons. False otherwise.
  #
  def is_unconfirmable_by( another_user )
    !!(
      is_associated_to_somebody_else_than( another_user ) &&
      !another_user.find_any_confirmation_given_to( object.associated_user ).nil?
    )
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns true if this swimmer instance can support the "social/invite friend"
  # action links or buttons. False otherwise.
  #
  def is_invitable_by( another_user )
    !!(
      is_associated_to_somebody_else_than( another_user ) &&
      object.associated_user.find_any_friendship_with( another_user ).nil?
    )
  end


  # Returns true if this swimmer instance cannot "invite socially" another friend
  # because the invite has already been sent and it is pending for acceptance.
  # False otherwise.
  #
  # "Pending" friendships are the only "approvable" ones.
  #
  def is_pending_by( another_user )
    return false unless is_associated_to_somebody_else_than( another_user )
    existing_friendship = object.associated_user.find_any_friendship_with( another_user )
    !!(
      existing_friendship &&
      existing_friendship.pending? &&
      (existing_friendship.friendable_id == object.associated_user_id)
    )
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns true if this swimmer instance can support the "social/block friendship"
  # action links or buttons. False otherwise.
  #
  def is_blockable_by( another_user )
    return false unless is_associated_to_somebody_else_than( another_user )
    existing_friendship = object.associated_user.find_any_friendship_with( another_user )
    !!(
      existing_friendship &&
      existing_friendship.can_block?( another_user )
    )
  end


  # Returns true if this swimmer instance can support the "social/unblock friendship"
  # action links or buttons. False otherwise.
  #
  def is_unblockable_by( another_user )
    return false unless is_associated_to_somebody_else_than( another_user )
    existing_friendship = object.associated_user.find_any_friendship_with( another_user )
    !!(
      existing_friendship &&
      existing_friendship.can_unblock?( another_user )
    )
  end


  # Returns true if this swimmer instance can support the "social/edit (or remove) friendship"
  # action links or buttons. False otherwise.
  #
  def is_editable_by( another_user )
    !!(
      is_associated_to_somebody_else_than( another_user ) &&
      !object.associated_user.find_any_friendship_with( another_user ).nil?
    )
  end
  #-- --------------------------------------------------------------------------
  #++


  # Check if this Swimmer object is correctly associated to a user and if it's a
  # different user from the one specified. Returns true if the associated user is
  # different from +another_user+. False otherwise.
  def is_associated_to_somebody_else_than( another_user )
    !!(
      another_user &&
      object &&
      object.associated_user &&
      ( object.associated_user_id != another_user.id )
    )
  end
  #-- --------------------------------------------------------------------------
  #++
end
