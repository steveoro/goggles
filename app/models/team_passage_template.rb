class TeamPassageTemplate < ActiveRecord::Base
  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
  # validates_associated :user                       # (Do not enable this for User)

  belongs_to :team
  belongs_to :event_type
  belongs_to :pool_type
  belongs_to :passage_type

  validates_associated :team
  validates_associated :event_type
  validates_associated :pool_type
  validates_associated :passage_type

  has_one  :stroke_type,    through: :event_type


  # Returns an array of PassageType rows enlisting the default sequence of
  # passage types for the specified length_in_meters.
  #
  def self.get_default_passage_types_for( total_length_in_meters )
    PassageType.where( ["length_in_meters <= ?", total_length_in_meters] )
      .order( :length_in_meters )
      .to_a
      .delete_if do |row|
        (total_length_in_meters > 100) && (row.length_in_meters % 50 != 0)
      end
  end
end
