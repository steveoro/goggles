require 'wrappers/timing'

=begin
  
= ICSEventTypeInfo

  - version:  4.00.195.20140228
  - author:   Leega

  Container module for interfacing common "event_type-related" info (description, code)
  and method functions.

  *ASSUMES existance of event_type reference

=end
module ICEventTypeInfo

  # Retrieves the localized Event Type ID as it is; returns 0 in case of an invalid record
  def get_event_type_id
    self.event_type ? self.event_type.id : 0
  end

  # Retrieves the localized Event Type code (short)
  def get_event_type
    self.event_type ? self.event_type.i18n_short : '?'
  end

  # Retrieves the localized Event Type code (full description)
  def get_event_type_description
    self.event_type ? self.event_type.i18n_description : '?'
  end

  # Retrieves the Event Type code as it is
  def get_event_type_code
    self.event_type ? self.event_type.code : '?'
  end

  # Retrieves the Event Type stroke (short)
  def get_event_type_stroke
    self.event_type ? self.stroke_type.i18n_short : '?'
  end
  # ----------------------------------------------------------------------------
end