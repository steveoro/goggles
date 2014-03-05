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
    # FIXME [Steve] if we want to make 'required' the association used by the interface,
    # maybe we should consider doing something like this in all these methods:
#    raise "Missing Association 'swimmer'" unless swimmer 
    swimmer ? self.swimmer.get_full_name() : '?'
  end

  # Retrieves the associated Swimmer's year_of_birth
  def get_year_of_birth
    # FIXME [Steve] if we want to make 'required' the association used by the interface,
    # maybe we should consider doing something like this in all these methods:
#    raise "Missing Association 'swimmer'" unless swimmer 
    swimmer ? self.swimmer.year_of_birth : 0
  end
  #-----------------------------------------------------------------------------

  # Computes current swimmer age
  def get_swimmer_age
    # FIXME [Steve] if we want to make 'required' the association used by the interface,
    # maybe we should consider doing something like this in all these methods:
#    raise "Missing Association 'swimmer'" unless swimmer 
    swimmer ? Date.today.year - swimmer.year_of_birth : 0 # this will fail the tests if association in not defined
  end

  # Retrieves all the current category type codes for the swimmer association of this interface.
  # Returns an empty array when none is found or the association is missing.
  def get_swimmer_current_category_type_codes
    # FIXME [Steve] if we want to make 'required' the association used by the interface,
    # maybe we should consider doing something like this in all these methods:
#    raise "Missing Association 'swimmer'" unless swimmer

    # TODO [Steve] Check out how this is defined in the Swimmer class
    # (it retrieves category type codes using only the swimmer year of birth):
    swimmer ? swimmer.get_current_category_type_codes() : []
  end

  # Retrieves the last-defined 'current' category type
  # Returns nil when none is found or the association is missing.
  def get_swimmer_current_category
    # FIXME [Steve] if we want to make 'required' the association used by the interface,
    # maybe we should consider doing something like this in all these methods:
#    raise "Missing Association 'swimmer'" unless swimmer

    # TODO [Steve] It could also be possible to call swimmer.get_current_category_type_from_badges()
    # but it would also assume the badges association as valid.
    swimmer ? get_swimmer_current_category_type_codes.last : nil
  end
end