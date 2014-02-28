class UserTraining < ActiveRecord::Base
  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
  #  validates_associated :user                       # (Do not enable this for User)

  has_many :user_training_rows, :dependent => :delete_all
  accepts_nested_attributes_for :user_training_rows, :allow_destroy => true

  has_many :user_training_stories, :dependent => :delete_all

  has_many :exercises, :through => :user_training_rows
  has_many :training_step_types, :through => :user_training_rows

  validates_presence_of :description
  validates_length_of   :description, :within => 1..250, :allow_nil => false

  attr_accessible :description, 
                  :user_id, :user_training_rows_attributes, # (Needed by the nested_form gem)
                  :user_training_story_attributes


  # ---------------------------------------------------------------------------
  # Base methods:
  # ---------------------------------------------------------------------------

  # Computes a shorter description for the name associated with this data
  def get_full_name
    description
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    # Verbose description should show first user_training_story date and pool
    description
  end
  # ---------------------------------------------------------------------------

  # Retrieves the User short name (the owner of this Training)
  def get_user_name
    user ? user.name : ''
  end

  # Retrieves the Swimmer level type description
  # Allows to specify which label method can be used for the output, defaults to
  # the framework standard :i18n_short.
  # Returns an empty string when not available.
  #
  def get_swimmer_level_type( label_method_sym = :i18n_short )
    user ? user.get_swimmer_level_type( label_method_sym ) : ''
  end
  # ---------------------------------------------------------------------------

  # Computes the total distance in metres for this training.
  #
  def compute_total_distance
    group_list = build_group_list_hash()
    group_distance = 0
    group_list.each{ |group_id, group_hash|         # Sum the total distance for each group, scanning all datarows:
      group_distance += group_hash[ :datarows ].inject(0){ |sum, row|
        sum + ( row.compute_distance().to_i * row.times )
      } * group_hash[:times]
    }
                                                    # Start the sum of the rest of the rows using the previous result:
    self.user_training_rows.without_groups.inject( group_distance ){ |sum, row|
      sum + ( row.compute_distance().to_i * row.times )
    }
  end
  # ---------------------------------------------------------------------------

  # Computes the esteemed total seconds of expected duration for this training
  #
  def compute_total_seconds
    group_list = build_group_list_hash()
    group_secs = 0
    group_list.each{ |group_id, group_hash|         # Sum the total secs for each group:
      group_secs += group_hash[ :datarows ].inject(0){ |sum, row|
        sum + row.compute_total_seconds()
      } * group_hash[:times]
    }
                                                    # Start the sum of the rest of the rows using the previous result:
    self.user_training_rows.without_groups.inject( group_secs ){ |sum, row|
      sum + row.compute_total_seconds()
    }
  end
  # ---------------------------------------------------------------------------


  # Scans all the training rows with groups and builds up a custom hash containing
  # as keys the group_id and as value another hash having all group fields as data members,
  # plus a special :datarows array member, containing all the data rows linked to the same
  # group id.
  #
  # Only the first row found with a valid group id (>0) will be used for group definition;
  # the others will only be checked for group_id consistency. 
  #
  def build_group_list_hash
    row_with_groups = self.user_training_rows.with_groups
    group_list = {}                                 # Collect a custom hash and a list of data rows for each group of rows:
    row_with_groups.each{ |row|                     # If the group id is missing from the hash keys, add it:
      if (! group_list.has_key?( row.group_id ))
        group_list[ row.group_id ] = {
          id: row.group_id,
          times: row.group_times,
          start_and_rest: row.group_start_and_rest,
          pause: row.group_pause,
          datarows: [ row ]
        }
      else                                          # Else, if the group id is among the keys, simply add the datarow to the list:
        group_list[ row.group_id ][ :datarows ] << row
      end
    }
    group_list
  end
  # ---------------------------------------------------------------------------
  
end
