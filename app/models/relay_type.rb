class RelayType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..10
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :mixed_gender, :maximum => 1
  validates_length_of     :partecipants, :maximum => 2
  validates_length_of     :phases, :maximum => 2
  validates_length_of     :phase_length_in_meters, :maximum => 3

  belongs_to :stroke_type
  validates_presence_of :stroke_type                # (must be not null)
  validates_associated :stroke_type                 # (foreign key integrity)

  # ----------------------------------------------------------------------------
  #++

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    relay_name = I18n.t( (self.mixed_gender.to_i > 0 ? :mixed_relay_short : :relay_short), {:scope=>[:relay_types]} )
    "#{ relay_name }#{ self.phases }x#{ self.phase_length_in_meters } #{ self.stroke_type.i18n_short() }"
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    relay_name = I18n.t( (self.mixed_gender.to_i > 0 ? :mixed_relay : :relay), {:scope=>[:relay_types]} )
    "#{ relay_name } #{ self.phases }x#{ self.phase_length_in_meters } #{ self.stroke_type.i18n_short() }" +
    ( self.partecipants != self.phases ? "(#{self.partecipants} #{I18n.t(athletes)})" : '' )
  end
  # ----------------------------------------------------------------------------


  # Given a localized text description from an imported text plus other key
  # parameters, returns the corresponding RelayType.id; 0 when unable to parse.
  #
  def self.parse_relay_type_from_import_text( stroke_type_id, type_text, phase_length_in_meters )
    mixed_gender = ( type_text =~ /mistaff/ui ? 1 : 0 )
                                                    # NOTE: assuming type_text has a format like => "mistaffetta NxLLL farf"
    idx = type_text =~ /\dx\d{2,3}\s/ui
    raise "RelayType.parse_relay_type_from_import_text(): unsupported type_text parameter format!" if idx.nil?
    phases = type_text[ idx ].to_i

    relay_type = RelayType.where(
      [
        '(stroke_type_id = ?) AND (mixed_gender = ?) AND (phases = ?) AND (phase_length_in_meters = ?)',
        stroke_type_id, mixed_gender, phases, phase_length_in_meters
      ]
    ).first
    relay_type ? relay_type.id : 0
  end
  # ----------------------------------------------------------------------------
end
