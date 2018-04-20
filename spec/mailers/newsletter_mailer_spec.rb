require 'rails_helper'
require 'ffaker'


describe NewsletterMailer, type: :mailer do
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
    it 'renders the application name (was host name) in the subject' do
      #expect( subject.subject ).to match( GogglesCore::AppConstants::WEB_MAIN_DOMAIN_NAME )
      expect( subject.subject ).to match( GogglesCore::AppConstants::WEB_APP_NAME )
    end
    it 'renders for each specified meeting its description and header_year' do
      meeting_array.each do |meeting|
        expect( subject.body.encoded ).to include( ERB::Util.h(meeting.description) )
        expect( subject.body.encoded ).to include( meeting.header_year )
      end
    end

    describe "#deliver" do
      it "sends an e-mail" do
        expect{ subject.deliver }.to change{ NewsletterMailer.deliveries.size }
      end
      it "delivers the generated message" do
        subject.deliver
        expect(
          NewsletterMailer.deliveries.last.body.encoded
        ).to match( subject.body.encoded )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "#custom_mail()" do
    let(:contents) { FFaker::Lorem.paragraph }
    let(:mail_subject)  { "A TEST subject" }
    let(:mail_title)    { "A TEST title" }
    subject { NewsletterMailer.custom_mail( user, mail_subject, mail_title, contents ) }

    it 'renders the receiver email' do
      expect( subject.to.first ).to include( user.email )
    end
    it 'renders the title in the subject' do
      expect( subject.subject ).to include( mail_subject )
    end
    it 'renders the specified title in its body' do
      expect( subject.body.encoded ).to include( mail_title )
    end
    it 'renders the specified contents in its body' do
      expect( subject.body.encoded ).to include( ERB::Util.h(contents) )
    end

    describe "#deliver" do
      it "sends an e-mail" do
        expect{ subject.deliver }.to change{ NewsletterMailer.deliveries.size }
      end
      it "delivers the generated message" do
        subject.deliver
        expect(
          NewsletterMailer.deliveries.last.body.encoded
        ).to match( subject.body.encoded )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
