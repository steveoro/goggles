require 'active_support'


# This module adds the capability to display an "includee" Model as a filtered drop-down
# list, by adding a method that returns an Array that can be subsequently a& easily
# decorated as a drop-down list by using a single HTML select statement.
#
module DropDownListable
  extend ActiveSupport::Concern

  module ClassMethods
    # Label symbol corresponding to either a column name or a model method to be used
    # mainly in generating DropDown option lists.
    # For ActiveRecord::Base defaults to :i18n_short. To be overridden in siblings that
    # need to use different label methods.
    #
    def get_label_symbol
      :i18n_short
    end
    # --------------------------------------------------------------------------

# TODO ADD support for verbosity level as in exercise_row.rb & exercise.rb
# (& remove overrides from those methods)


    # Returns an Array of 2-items Arrays, in which each item is the ID of the record
    # and the other is assumed to be its label
    #
    # == Parameters:
    #
    # - where_condition: an ActiveRecord::Relation WHERE-clause; defaults to +nil+ (returns all records)
    # - key_sym: the key symbol/column name (defaults to :id)
    # - label_sym: the key symbol/column name (defaults to self.get_label_symbol())
    #
    # == Returns:
    # - an Array of arrays having the structure [ [label1, key_value1], [label2, key_value2], ... ]
    #
    def to_dropdown( where_condition = nil, key_sym = :id, label_sym = get_label_symbol() )
      self.where( where_condition ).map{ |row|
        [row.send(label_sym), row.send(key_sym)]
      }.sort_by{ |ar| ar[0] }
    end
  end
  # ----------------------------------------------------------------------------
end
