=begin
  
= ICUser

  - version:  4.00.210.20140402
  - author:   Leega

  Concrete Interface for User helper methods.
  Assumes to be included into a class which belongs to user.

=end
module ICUser

  # Retrieves the user name associated with this instance
  def user_name
    user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

end