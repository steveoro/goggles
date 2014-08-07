=begin

= TeamDecorator

  - version:  4.00.420
  - author:   Leega

  Decorator for the Team model.
  Contains all presentation-logic centered methods.

=end
class TeamDecorator < Draper::Decorator
  delegate_all
  include Rails.application.routes.url_helpers

  # Returns the list of season types the teams was affiliate
  #
  def get_season_type_list()
    season_types ? season_types.uniq.map{ |row| row.get_full_name }.join(', ') : I18n.t('none')
  end
  #-- --------------------------------------------------------------------------

  # Returns the formatted list of contacts
  # TODO Add the link to email address
  #
  def get_contacts()
    contacts = [] 
    contacts.append(contact_name) if contact_name
    contacts.append("#{I18n.t('mobile')} #{phone_mobile}") if phone_mobile
    contacts.append("#{I18n.t('phone')} #{phone_number}") if phone_number
    contacts.append("#{I18n.t('fax')} #{fax_number}") if fax_number
    contacts.append("#{I18n.t('email')} " + h.mail_to(e_mail)) if e_mail
    contacts.join(', ') 
  end
  #-- --------------------------------------------------------------------------

  # Returns the complete team address with address, city, country
  #
  def get_complete_address()
    "#{address} #{city ? ' - ' + city.get_full_name + ' - ' + city.country : ''}"
  end
  #-- --------------------------------------------------------------------------

  # Returns the Team's home site if present
  #
  def get_home_site()
    home_page_url ? h.link_to( home_page_url, home_page_url, { target: "blank" } ) : I18n.t('unknown')
  end
  #-- --------------------------------------------------------------------------

  # Returns the Team's last meeting name (and header date)
  #
  def get_last_meeting_name()
    meeting = meetings.sort_by_date(:desc).first
    meeting ? h.link_to( meeting.get_full_name, meeting_show_full_path( id: meeting.id, team_id: id ) ) : I18n.t('none')
  end
  #-- --------------------------------------------------------------------------
end
