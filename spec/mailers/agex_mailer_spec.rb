require 'spec_helper'
require 'ffaker'


describe AgexMailer, :type => :mailer do
  let(:user)  { create(:user) }
  let(:admin) { Admin.find_by_name('steve') }

  context "#exception_mail()" do
    let(:description) { "#{Faker::Lorem.paragraph} error intercepted!" }
    let(:backtrace)   { ["#{Faker::Lorem.paragraph} row1", "#{Faker::Lorem.paragraph} row2", "#{Faker::Lorem.paragraph} row3"] }
    subject           { AgexMailer.exception_mail( user, description, backtrace ) }

    it 'renders the receiver email' do
      expect( subject.to.first ).to include( admin.email )
    end

    it 'renders the description in the subject' do
      expect( subject.subject ).to match( description )
    end

    it 'renders the hostname in the subject' do
      expect( subject.subject ).to match( ENV['HOSTNAME'] )
    end

    it 'renders the user_name in the message' do
      expect( subject.body.encoded ).to match( user.name )
    end

    it 'renders the backtrace in the message' do
      backtrace.each do |row|
        expect( subject.body.encoded ).to include(row)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "#action_notify_mail()" do
    let(:action_name)         { "#{Faker::Lorem.paragraph} action" }
    let(:action_description)  { "#{Faker::Lorem.paragraph} description" }
    subject                   { AgexMailer.action_notify_mail( user, action_name, action_description ) }

    it 'renders the receiver email' do
      expect( subject.to.first ).to include( admin.email )
      # Default string constant is longer before email address parsing, thus we expect
      # the un-parsed value to include the parsed one:
#      expect(AgexMailer::AGEX_ADMIN_EMAIL).to include( notify_mail.to.first )
    end

    it 'renders the action_name in the subject' do
      expect( subject.subject ).to match(action_name)
    end

    it 'renders the hostname in the subject' do
      expect( subject.subject ).to match( ENV['HOSTNAME'] )
    end

    it 'renders the user_name in the message' do
      expect( subject.body.encoded ).to match( user.name )
    end

    it 'renders the action_description in the message' do
      expect( subject.body.encoded ).to match( action_description )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "#report_abuse_mail()" do
    let(:user_involved) { create(:user) }
    let(:entity_name)   { "#{Faker::Lorem.word}EntityName" }
    let(:entity_id)     { ((rand * 100) % 100).to_i + 1 }
    let(:entity_title)  { "#{Faker::Lorem.paragraph} title" }
    subject             { AgexMailer.report_abuse_mail( user, user_involved, entity_name, entity_id, entity_title ) }

    it 'renders the receiver email' do
      expect( subject.to.first ).to include( admin.email )
      # Default string constant is longer before email address parsing, thus we expect
      # the un-parsed value to include the parsed one:
#      expect(AgexMailer::AGEX_ADMIN_EMAIL).to include( abuse_mail.to.first )
    end

    it 'renders the entity_name in the subject' do
      expect( subject.subject ).to match( entity_name )
    end

    it 'renders ID:entity_id in the subject' do
      expect( subject.subject ).to match( "ID:#{entity_id}" )
    end

    it 'renders the hostname in the subject' do
      expect( subject.subject ).to match( ENV['HOSTNAME'] )
    end

    it 'renders the name of the sender user in the message' do
      expect( subject.body.encoded ).to match( user.name )
    end

    it 'renders the name of the involved user in the message' do
      expect( subject.body.encoded ).to match( user_involved.name )
    end

    it 'renders the entity_title in the message' do
      expect( subject.body.encoded ).to match( entity_title )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end