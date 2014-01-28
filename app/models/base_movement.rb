class BaseMovement < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :movement_type
  belongs_to :stroke_type
  belongs_to :movement_scope_type
  validates_associated :movement_type
  # [Steve, 20140108] Update: some movements may not be linked to a stroke_type at all
#  validates_associated :stroke_type
  validates_associated :movement_scope_type

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..6, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists


  # ---------------------------------------------------------------------------
  # Base methods:
  # ---------------------------------------------------------------------------


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code }".to_sym, {:scope=>[:base_movements]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code }".to_sym, {:scope=>[:base_movements]} )
  end


  # Computes a run-time description for the name associated with this data
  #
  # Please note that due to the current [20140108] DB structure, this method doesn't take
  # into account that there are several base movements that may have different codes but
  # may actually refer to different exercise components having the same movements parts.
  #
  # For example, a free-style full-swimming exercise using breath count may have just the
  # same components (thus issuing the same description with this run-time method), but
  # requiring a different description for the breath count used (3, 4, 5, ...).
  #
  # For this reason, the standard, localized <tt>#i18n_short</tt> and <tt>#i18n_description</tt>
  # are the preferred methods of obtaining unique descriptions for any data row.
  #
  # === Params:
  # - verbose_level: either :short, :full or :verbose; default: :full
  # - swimmer_level_type_id: the id of the user's swimmer level type (or its preferred swimmer level type ID); NOT the code, NOT the level: the *ID*; it can be 0 if it must be ignored
  #
  def get_full_name( verbose_level = :full, swimmer_level_type_id = 0 )
    case verbose_level.to_sym
    when :short
      [ 
        get_stroke_type_name( verbose_level ),
        get_movement_type_name( verbose_level ),
        get_movement_scope_type_name( verbose_level )
      ].delete_if{ |e| e.empty? }.join(' ')
    when :verbose
      [ 
        get_stroke_type_name( verbose_level ),
        get_movement_type_name( verbose_level ),
        get_movement_scope_type_name( verbose_level )
      ].delete_if{ |e| e.empty? }.join(' ')
    else
      [ 
        get_stroke_type_name( verbose_level ),
        get_movement_type_name( verbose_level ),
        get_movement_scope_type_name( verbose_level )
      ].delete_if{ |e| e.empty? }.join(' ')
    end
  end
  # ---------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :i18n_short
  end

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
  def self.to_dropdown( where_condition = nil, key_sym = :id, label_sym = self.get_label_symbol() )
    self.where( where_condition ).map{ |row|
      [row.send(label_sym), row.send(key_sym)]
    }.sort_by{ |ar| ar[0] }
  end
  # ----------------------------------------------------------------------------


  # Retrieves the Movement Type name
  #
  # === Params:
  # - verbose_level: either :short or anything else; default: :short
  #
  def get_movement_type_name( verbose_level = :short )
    if ( movement_type && movement_type.code == MovementType::CODE_FULL )
      ''
    elsif movement_type                       # Retrieve the movement_scope_type only if it is defined and it's not "generic"
      if ( verbose_level.to_sym == :short )
        movement_type.i18n_short
      else
        movement_type.i18n_description
      end
    else
      ''
    end
  end

  # Retrieves the Stroke Type name
  #
  # === Params:
  # - verbose_level: either :short or anything else; default: :short
  #
  def get_stroke_type_name( verbose_level = :short )
    return '' unless stroke_type
    if ( verbose_level.to_sym == :short )
      stroke_type.i18n_short
    else
      stroke_type.i18n_description
    end
  end

  # Retrieves the Movement Scope Type name
  #
  # === Params:
  # - verbose_level: either :short or anything else; default: :short
  #
  def get_movement_scope_type_name( verbose_level = :short )
    if ( movement_scope_type && movement_scope_type.code == MovementScopeType::CODE_GENERIC )
      ''
    elsif movement_scope_type                       # Retrieve the movement_scope_type only if it is defined and it's not "generic"
      if ( verbose_level.to_sym == :short )
        movement_scope_type.i18n_short
      else
        movement_scope_type.i18n_description
      end
    else
      ''
    end
  end
  # ----------------------------------------------------------------------------
  
end
