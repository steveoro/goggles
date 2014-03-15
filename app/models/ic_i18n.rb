=begin
  
= ICI18n

  - version:  4.00.199.20140314
  - author:   Steve A.

  Concrete Interface for I18n helper methods.
  Assumes to be included into an ActiveRecord::Base sibling (it must respond to #table_name)
  and it must have a #code field.

=end
module ICI18n

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ code }".to_sym, {:scope=>[table_name.to_sym]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ code }".to_sym, {:scope=>[table_name.to_sym]} )
  end
  
  # Computes a localized shorter description for the value/code associated with this data
  def i18n_alternate
    I18n.t( "i18n_alternate_#{ code }".to_sym, {:scope=>[table_name.to_sym]} )
  end
  # ----------------------------------------------------------------------------

end