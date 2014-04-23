class UserSwimmerConfirmation < ActiveRecord::Base
#  attr_accessible :confirmator_id, :swimmer, :user
  belongs_to :user
  belongs_to :swimmer
  validates_associated :swimmer

  belongs_to :confirmator,
    :class_name => User,
    :foreign_key => "confirmator_id"
  # ---------------------------------------------------------------------------


  # Confirms the association for a user to a swimmer, given another
  # user that acts as a "confirmator".
  #
  # The parameters can either be model instances or simple IDs.
  # 
  def self.confirm_for( user, swimmer, confirmator )
    user_id, swimmer_id, confirmator_id = self.parse_parameters( user, swimmer, confirmator )
    return false unless self.validate_parameters( user_id, swimmer_id, confirmator_id )

    begin
      UserSwimmerConfirmation.create!(
        user_id: user_id,
        swimmer_id: swimmer_id,
        confirmator_id: confirmator_id
      )
      true
    rescue
      false
    end
  end
  # ---------------------------------------------------------------------------


  # Removes the single confirmation row for the association between a user and a swimmer,
  # given another user that acts as a "confirmator" (in this case, the "un-confirmator").
  #
  # Only coherent tuples can be deleted. That is, only the rows having the same ID values
  # as the specified parameters will be removed.
  #
  # The parameters can either be model instances or simple IDs (Fixnum).
  # 
  def self.unconfirm_for( user, swimmer, confirmator )
    user_id, swimmer_id, confirmator_id = self.parse_parameters( user, swimmer, confirmator )
    return false unless self.validate_parameters( user_id, swimmer_id, confirmator_id )

    unconfirmable_row = UserSwimmerConfirmation.where(
      user_id: user_id,
      swimmer_id: swimmer_id,
      confirmator_id: confirmator_id
    ).first

    if unconfirmable_row
      begin
        unconfirmable_row.destroy()
        true
      rescue
        false
      end
    else
      false
    end
  end
  # ---------------------------------------------------------------------------


  private


  # Parses the parameters for self.confirm_for() or self.unconfirm_for().
  # Returns the array of parameters.
  def self.parse_parameters( user, swimmer, confirmator )
    user_id        = user.instance_of?( User ) ? user.id : user
    swimmer_id     = swimmer.instance_of?( Swimmer ) ? swimmer.id : swimmer
    confirmator_id = confirmator.instance_of?( User ) ? confirmator.id : confirmator
    [ user_id, swimmer_id, confirmator_id ]
  end


  # Returns true if all the parameters are valid for a self.confirm_for/() or
  # self.unconfirm_for() call.
  def self.validate_parameters( user_id, swimmer_id, confirmator_id )
    (
      user_id.kind_of?( Fixnum )        && user_id.to_i > 0 &&
      swimmer_id.kind_of?( Fixnum )     && swimmer_id.to_i > 0 &&
      confirmator_id.kind_of?( Fixnum ) && confirmator_id.to_i > 0
    )
  end
  # ---------------------------------------------------------------------------
end
