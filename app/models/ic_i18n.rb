=begin
  
= ICI18n

  - version:  4.00.215.20140411
  - author:   Steve A.

  Concrete Interface for I18n helper methods.
  Assumes to be included into an ActiveRecord::Base sibling (it must respond to #table_name)
  and it must have a #code field.

=end
module ICI18n

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    # FIXME table_name is defined on the class not on the instances
    I18n.t( "i18n_short_#{ code }".to_sym, {:scope=>[klass.table_name.to_sym]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    # FIXME table_name is defined on the class not on the instances
    I18n.t( "i18n_description_#{ code }".to_sym, {:scope=>[klass.table_name.to_sym]} )
  end

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_alternate
    # FIXME table_name is defined on the class not on the instances
    I18n.t( "i18n_alternate_#{ code }".to_sym, {:scope=>[klass.table_name.to_sym]} )
  end
  # ----------------------------------------------------------------------------

end