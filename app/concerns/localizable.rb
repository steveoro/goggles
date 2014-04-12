require 'active_support'

=begin
  
= Localizable

  - version:  4.00.217.20140412
  - author:   Steve A.

  Concrete Interface for I18n helper methods.
  Assumes to be included into an ActiveRecord::Base sibling (it must respond to #table_name)
  and it must have a #code field.

=end
module Localizable
  extend ActiveSupport::Concern

# TODO Make sure includee responds_to base_class.table_name
# TODO Make sure includee responds_to #code


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ code }".to_sym, {:scope=>[self.class.get_scope_sym]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ code }".to_sym, {:scope=>[self.class.get_scope_sym]} )
  end

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_alternate
    I18n.t( "i18n_alternate_#{ code }".to_sym, {:scope=>[self.class.get_scope_sym]} )
  end
  # ----------------------------------------------------------------------------

  module ClassMethods
    # Returns the scope symbol used for grouping the localization strings.
    def get_scope_sym
      table_name.to_sym
    end
  end
  # ----------------------------------------------------------------------------
end
