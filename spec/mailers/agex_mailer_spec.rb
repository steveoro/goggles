require 'spec_helper'


describe AgexMailer, :type => :mailer do
  let(:user) { create(:user) }

  context "#exception_mail()" do
    let(:description)     { 'fake error message' }
    let(:backtrace)       { ['fake error_backtrace row1', 'fake error_backtrace row2'] }
    let(:exception_mail)  { AgexMailer.exception_mail(nil, user.name, description, backtrace) }

    it 'renders the receiver email' do
      # The default string constant is longer than the email address after parsing.
      # Thus we expect the un-parsed value to include the parsed one:
      expect(AgexMailer::AGEX_ADMIN_EMAIL).to include( exception_mail.to.first )
    end

    it 'renders the description in the subject' do
      expect(exception_mail.subject).to match(description)
    end

    it 'renders the hostname in the subject' do
      expect(exception_mail.subject).to match(ENV['HOSTNAME'])
    end

    it 'renders the user_name in the message' do
      expect(exception_mail.body.encoded).to match(user.name)
    end

    it 'renders the backtrace in the message' do
      backtrace.each do |row|
        expect(exception_mail.body.encoded).to include(row)
      end
    end
  end
  # ----------------------------------------------------------------------------


  context "#action_notify_mail()" do
    let(:action_name)         { 'fake action' }
    let(:action_description)  { 'this is a fake action description' }
    let(:notify_mail)         { AgexMailer.action_notify_mail(user.name, action_name, action_description) }

    it 'renders the receiver email' do
      # Default string constant is longer before email address parsing, thus we expect
      # the un-parsed value to include the parsed one:
      expect(AgexMailer::AGEX_ADMIN_EMAIL).to include( notify_mail.to.first )
    end

    it 'renders the action_name in the subject' do
      expect(notify_mail.subject).to match(action_name)
    end

    it 'renders the hostname in the subject' do
      expect(notify_mail.subject).to match(ENV['HOSTNAME'])
    end

    it 'renders the user_name in the message' do
      expect(notify_mail.body.encoded).to match(user.name)
    end

    it 'renders the action_description in the message' do
      expect(notify_mail.body.encoded).to match(action_description)
    end
  end
  # ----------------------------------------------------------------------------


  context "#report_abuse_mail()" do
    let(:user_involved) { create(:user) }
    let(:entity_name)   { 'DummyEntityName' }
    let(:entity_id)     { ((rand * 100) % 100).to_i + 1 }
    let(:entity_title)  { 'Any fake title will do' }
    let(:abuse_mail)    { AgexMailer.report_abuse_mail(user, user_involved, entity_name, entity_id, entity_title) }

    it 'renders the receiver email' do
      # Default string constant is longer before email address parsing, thus we expect
      # the un-parsed value to include the parsed one:
      expect(AgexMailer::AGEX_ADMIN_EMAIL).to include( abuse_mail.to.first )
    end

    it 'renders the entity_name in the subject' do
      expect(abuse_mail.subject).to match(entity_name)
    end

    it 'renders ID:entity_id in the subject' do
      expect(abuse_mail.subject).to match("ID:#{entity_id}")
    end

    it 'renders the hostname in the subject' do
      expect(abuse_mail.subject).to match(ENV['HOSTNAME'])
    end

    it 'renders the name of the sender user in the message' do
      expect(abuse_mail.body.encoded).to match(user.name)
    end

    it 'renders the name of the involved user in the message' do
      expect(abuse_mail.body.encoded).to match(user_involved.name)
    end

    it 'renders the entity_title in the message' do
      expect(abuse_mail.body.encoded).to match(entity_title)
    end
  end
end