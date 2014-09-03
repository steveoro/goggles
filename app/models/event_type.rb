require 'drop_down_listable'

class EventType < ActiveRecord::Base
  include DropDownListable

  belongs_to :stroke_type
  validates_presence_of :stroke_type                # (must be not null)
  validates_associated :stroke_type                 # (foreign key integrity)
  
  delegate :code, :i18n_short, :i18n_description, :to => :stroke_type, :prefix => true 

  validates_presence_of   :code
  validates_length_of     :code, within: 1..10, allow_nil: false
  validates_uniqueness_of :code, message: :already_exists

  validates_length_of     :length_in_meters, maximum: 12
  validates_length_of     :partecipants, maximum: 5
  validates_length_of     :phases, maximum: 5
  validates_length_of     :phase_length_in_meters, maximum: 8

  validates_presence_of     :style_order
  validates_length_of       :style_order, within: 1..3, allow_nil: false
  validates_numericality_of :style_order

  has_many :events_by_pool_types
  has_many :pool_types,       through: :events_by_pool_types

  scope :only_relays,         where(is_a_relay: true)
  scope :are_not_relays,      where(is_a_relay: false)
  scope :for_fin_calculation, where('((length_in_meters % 50) = 0) AND (length_in_meters <= 1500)')
  
  scope :sort_by_style,       order('style_order')
  # ----------------------------------------------------------------------------


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    if self.is_a_relay
      relay_name = I18n.t( (self.is_mixed_gender ? :mixed_relay_short : :relay_short), { scope: [:relay_types] } )
      "#{ self.phases }x#{ self.phase_length_in_meters } #{ self.stroke_type.i18n_short(true) } " +
      ( self.partecipants != self.phases ? "(#{relay_name}/#{self.partecipants})" : "(#{relay_name})" )
    else
      "#{self.length_in_meters} #{self.stroke_type_i18n_short}"
    end
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    if self.is_a_relay
      relay_name = I18n.t( (self.is_mixed_gender ? :mixed_relay : :relay), { scope: [:relay_types] } )
      "#{ self.phases }x#{ self.phase_length_in_meters } #{ self.stroke_type.i18n_description(true) } " +
      ( self.partecipants != self.phases ? "(#{relay_name} #{self.partecipants} #{I18n.t(:athletes)})" : "(#{relay_name})" )
    else
      "#{self.length_in_meters} #{self.stroke_type_i18n_description}"
    end
  end
  # ----------------------------------------------------------------------------


  # Given a localized text description from an imported text plus other key
  # parameters, returns the corresponding RelayType.id; 0 when unable to parse.
  #
  def self.parse_event_type_from_import_text( stroke_type_id, type_text, phase_length_in_meters )
    is_mixed_gender = ( type_text =~ /mistaff/ui ? 1 : 0 )
                                                    # NOTE: assuming type_text has a format like => "mistaffetta NxLLL farf"
    idx = type_text =~ /\dx\d{2,3}\s/ui
    raise "EventType.parse_event_type_from_import_text(): unsupported type_text parameter format!" if idx.nil?
    phases = type_text[ idx ].to_i

    relay_type = EventType.where(
      [
        '(is_a_relay = 1) AND (stroke_type_id = ?) AND ' +
        '(is_mixed_gender = ?) AND (phases = ?) AND (phase_length_in_meters = ?)',
        stroke_type_id, is_mixed_gender, phases, phase_length_in_meters
      ]
    ).first
    relay_type ? relay_type.id : 0
  end
  # ----------------------------------------------------------------------------
  
  # Sorts an array of event codes using the style order
  # 
  # Params
  # - event_list: an array of event codes
  #
  # Return a sorted list
  def self.sort_list_by_style_order( event_list = nil )
    @sorted_full_list = EventType.sort_by_style.map{ |event_type| event_type.code }
    if event_list
      event_list.sort!{ |el_prev, el_next| @sorted_full_list.rindex(el_prev) <=> @sorted_full_list.rindex(el_next) }
    else
      event_list = @sorted_full_list
    end
    event_list
  end
end
