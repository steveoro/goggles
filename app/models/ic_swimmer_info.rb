=begin
  
= ICSwimmerInfo

  - version:  4.00.195.20140228
  - author:   Leega

  Container module for interfacing common "swimming-related" info (name, year of birth)
  and method functions.

  *ASSUMES existance of the fields:*
  - last_name
  - first_name
  - year_of_birth

=end
module ICSwimmerInfo

  # Retrieves the associated Swimmer full name
  def get_swimmer_name
    swimmer ? swimmer.get_full_name() : '?'
  end

  # Retrieves the associated Swimmer's year_of_birth
  def get_year_of_birth
    swimmer ? swimmer.year_of_birth : '?'
  end
  #-----------------------------------------------------------------------------

  # Leega. TODO Calculate the current age

  # Leega. TODO Retrieves the current category type. Require season (default current FIN)
end