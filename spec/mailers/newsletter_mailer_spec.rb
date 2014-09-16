require 'spec_helper'
require 'ffaker'


describe NewsletterMailer, :type => :mailer do
  let(:user) { create(:user) }

  context "#data_updates_mail()" do
    let(:meeting_array) { create_list( :meeting, 3 ) }
    subject { NewsletterMailer.data_updates_mail( user, meeting_array ) }

    it 'renders the receiver email' do
      expect( subject.to.first ).to include( user.email )
    end

    it 'renders the title in the subject' do
      expect( subject.subject ).to match( I18n.t('newsletter_mailer.data_updates.generic_title') )
    end

    it 'renders the hostname in the subject' do
      expect( subject.subject ).to match( ENV['HOSTNAME'] )
    end

    it 'renders for each specified meeting its description and header_year' do
      meeting_array.each do |meeting|
        expect( subject.body.encoded ).to include( meeting.description )
        expect( subject.body.encoded ).to include( meeting.header_year )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
