=begin

= TeamDecorator

  - version:  4.00.420
  - author:   Leega

  Decorator for the Team model.
  Contains all presentation-logic centered methods.

=end
class TeamDecorator < Draper::Decorator
  delegate_all

  # Returns the Array of associated Teams for this Swimmer.
  #
  def get_season_type_list()
    season_types ? season_types.uniq.map{ |row| row.get_full_name }.join(', ') : I18n.t('none')
  end
  #-- --------------------------------------------------------------------------

  # Returns the Array of associated Teams for this Swimmer.
  #
  def get_contacts()
    contacts = [] 
    contacts.append(contact_name) if contact_name
    contacts.append("#{I18n.t('mobile')} #{phone_mobile}") if phone_mobile
    contacts.append("#{I18n.t('phone')} #{phone_number}") if phone_number
    contacts.append("#{I18n.t('fax')} #{fax_number}") if fax_number
    contacts.append("#{I18n.t('email')} #{e_mail}") if e_mail
    contacts.join(', ') 
  end
  #-- --------------------------------------------------------------------------

end
