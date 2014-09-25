# encoding: utf-8

require 'spec_helper'
require 'user_content_logger'


describe UserContentLogger, type: :strategy do
  subject { UserContentLogger }

  context "as a new instance," do
    it "accepts a string name as parameter" do
      expect( subject.new('SwimmingPoolReview') ).to be_an_instance_of( UserContentLogger )
    end

    it "raises an error if the parameter is not a String" do
      expect{ subject.new(nil) }.to raise_error( ArgumentError )
      expect{ subject.new(SwimmingPoolReview) }.to raise_error( ArgumentError )
    end
    #-- -----------------------------------------------------------------------
    #++

    context "when callback methods are activated," do
      let(:user)    { create( :user ) }
      let(:record)  { create( :swimming_pool_review, user: user ) }

      before(:each) do
        ActionMailer::Base.delivery_method = :test
        ActionMailer::Base.perform_deliveries = true
        ActionMailer::Base.deliveries = []
      end

      describe "#after_create" do
        before(:each) { subject.new('SwimmingPoolReview').after_create(record) }
        # TODO
        it "sends an e-mail" do
          expect( AgexMailer.deliveries ).not_to be_empty
        end
        it "includes an SQL log in the message" do
          expect(
            AgexMailer.deliveries.last.body.encoded
          ).to include( "PLACEHOLDER for SQL log" )
        end
      end

      describe "#after_save" do
        # TODO
        it "sends an e-mail" do
          subject.new('SwimmingPoolReview').after_save( record )
          expect( AgexMailer.deliveries ).not_to be_empty
        end
      end

      describe "#before_destroy" do
        # TODO
        it "sends an e-mail" do
          subject.new('SwimmingPoolReview').before_destroy( record )
          expect( AgexMailer.deliveries ).not_to be_empty
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
