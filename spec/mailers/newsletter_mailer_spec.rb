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
      expect( subject.subject ).to match( NewsletterMailer::HOSTNAME )
    end
    it 'renders for each specified meeting its description and header_year' do
      meeting_array.each do |meeting|
        expect( subject.body.encoded ).to include( meeting.description )
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

  context "#achievements_mail()" do
    let(:achievements_array) do
      unique_achievement_ids = (1..12).to_a.sort{ rand() - 0.5 }[ 0..2 ]
      Achievement.where( id: unique_achievement_ids )
    end
    subject { NewsletterMailer.achievements_mail( user, achievements_array ) }

    it 'renders the receiver email' do
      expect( subject.to.first ).to include( user.email )
    end
    it 'renders the title in the subject' do
      expect( subject.subject ).to match( I18n.t('newsletter_mailer.achievements.generic_title') )
    end
    it 'renders the hostname in the subject' do
      expect( subject.subject ).to match( NewsletterMailer::HOSTNAME )
    end

    xit 'renders for each specified achievement its localized name and description' do
      achievements_array.each do |achievement|
        # FIXME Missing something like a "get_full_name" w/ localization support
#        expect( subject.body.encoded ).to include( achievement.code )
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

  context "#application_mail()" do
    let(:contents) { "<p><b>#{FFaker::Lorem.paragraph}</b></p><p>#{FFaker::Lorem.paragraph}</p>" }
    subject { NewsletterMailer.application_mail( user, contents ) }

    it 'renders the receiver email' do
      expect( subject.to.first ).to include( user.email )
    end
    it 'renders the title in the subject' do
      expect( subject.subject ).to match( I18n.t('newsletter_mailer.application.generic_title') )
    end
    it 'renders the hostname in the subject' do
      expect( subject.subject ).to match( NewsletterMailer::HOSTNAME )
    end
    it 'renders the specified contents in its body' do
      expect( subject.body.encoded ).to include( contents )
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

  context "#community_mail()" do
    let(:newsfeed_array) { create_list( :news_feed, 5, user: user ) }
    subject { NewsletterMailer.community_mail( user, newsfeed_array ) }

    it 'renders the receiver email' do
      expect( subject.to.first ).to include( user.email )
    end
    it 'renders the title in the subject' do
      expect( subject.subject ).to match( I18n.t('newsletter_mailer.community.generic_title') )
    end
    it 'renders the hostname in the subject' do
      expect( subject.subject ).to match( NewsletterMailer::HOSTNAME )
    end

    it 'renders for each specified news_feed its title and body' do
      newsfeed_array.each do |feed|
        expect( subject.body.encoded ).to include( feed.title )
        expect( subject.body.encoded ).to include( feed.body )
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
end
