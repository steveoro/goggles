# encoding: utf-8

require 'spec_helper'
require 'ffaker'

require 'user_content_logger'


describe UserContentLogger, type: :strategy do
  let(:table_name)  { 'swimming_pool_reviews' }
  let(:user)        { create( :user ) }
  let(:record)      { create( :swimming_pool_review, user: user ) }

  subject { UserContentLogger.new( table_name ) }

  after(:each) do
    # Remove the log file after the test:
    FileUtils.rm( subject.log_filename ) if FileTest.exists?( subject.log_filename )
  end

  context "as a new instance," do
    it "accepts a string name as parameter" do
      expect( subject ).to be_an_instance_of( UserContentLogger )
    end

    it_behaves_like( "(the existance of a method)", [
      :table_name, :log_filename, :email_on_create, :email_on_destroy,
      :after_create, :after_update, :before_destroy,
      :to_sql_insert, :to_sql_update, :to_sql_delete
    ] )

    it "raises an error if the parameter is not a String" do
      expect{ UserContentLogger.new(nil) }.to raise_error( ArgumentError )
      expect{ UserContentLogger.new(SwimmingPoolReview) }.to raise_error( ArgumentError )
    end

    describe "#table_name" do
      it "is a String" do
        expect( subject.table_name ).to be_an_instance_of(String)
      end
      it "is the same model name specified in the constructor" do
        expect( subject.table_name ).to eq( table_name )
      end
    end

    describe "#log_filename" do
      it "is a String" do
        expect( subject.log_filename ).to be_an_instance_of(String)
      end
      it "contains the model name specified in the constructor" do
        expect( subject.log_filename ).to include( table_name )
      end
    end

    describe "#email_on_create" do
      it "is false if not specified in the constructor" do
        expect( subject.email_on_create ).to be false
      end
    end

    describe "#email_on_destroy" do
      it "is false if not specified in the constructor" do
        expect( subject.email_on_destroy ).to be false
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#to_sql_insert" do
      it "returns a String" do
        expect( subject.to_sql_insert(record) ).to be_an_instance_of(String)
      end
      it "contains the list of values of the record (expcept :lock_version)" do
        required_attributes = record.attributes.reject{ |key| key == 'lock_version' }
        quoted_values       = required_attributes.values.map{ |value| record.connection.quote(value) }
        sql_text            = subject.to_sql_insert(record)
        expect( sql_text ).to include( quoted_values.join(', ') )
      end
    end

    describe "#to_sql_update" do
      it "returns a String" do
        expect( subject.to_sql_update(record) ).to be_an_instance_of(String)
      end
      it "contains the list of values of the record (expcept :id & :lock_version)" do
        required_attributes = record.attributes.reject{ |key| key == 'id' || key == 'lock_version' }
        quoted_values       = required_attributes.values.map{ |value| record.connection.quote(value) }
        sql_text            = subject.to_sql_update(record)
        quoted_values.each do |value|
          expect( sql_text ).to include( value )
        end
      end
    end

    describe "#to_sql_delete" do
      it "returns a String" do
        expect( subject.to_sql_delete(record) ).to be_an_instance_of(String)
      end
      it "contains the ID value of the record" do
        sql_text = subject.to_sql_delete(record)
        expect( sql_text ).to include( record.id.to_s )
      end
    end


    describe "#to_logfile" do
      let(:contents) { Faker::Lorem.paragraph }

      it "writes the contents to a logfile" do
        subject.to_logfile( contents )
        read_file = File.read( subject.log_filename )
        expect( read_file ).to include( contents )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "when callback methods are activated," do
      subject       { UserContentLogger.new( table_name, email_on_create: true, email_on_destroy: true ) }

      before(:each) do
        ActionMailer::Base.delivery_method = :test
        ActionMailer::Base.perform_deliveries = true
        ActionMailer::Base.deliveries = []
      end

      describe "#email_on_create" do
        it "is true when specified in the constructor" do
          expect( subject.email_on_create ).to be true
        end
      end

      describe "#email_on_destroy" do
        it "is true when specified in the constructor" do
          expect( subject.email_on_destroy ).to be true
        end
      end


      describe "#after_create" do
        let(:sql_contents)  { subject.to_sql_insert(record) }
        before(:each)       { subject.after_create(record) }

        it "updates the log file" do
          read_file = File.read( subject.log_filename )
          expect( read_file ).to include( sql_contents )
        end
        it "sends a creation alert e-mail" do
          creation_mail = AgexMailer.deliveries.select do |mail|
            mail.subject =~ /row CREATED/
          end
          expect( creation_mail ).not_to be_empty
        end
        it "includes an SQL log in the message" do
          expect(
            AgexMailer.deliveries.last.body.encoded
          ).to include( sql_contents )
        end
      end


      describe "#after_update" do
        let(:sql_contents)  { subject.to_sql_update(record) }
        before(:each)       { subject.after_update(record) }

        it "updates the log file" do
          read_file = File.read( subject.log_filename )
          expect( read_file ).to include( sql_contents )
        end
      end


      describe "#before_destroy" do
        let(:sql_contents)  { subject.to_sql_delete(record) }
        before(:each)       { subject.before_destroy(record) }

        it "updates the log file" do
          read_file = File.read( subject.log_filename )
          expect( read_file ).to include( sql_contents )
        end
        it "sends a destroy alert e-mail" do
          destroy_mail = AgexMailer.deliveries.select do |mail|
            mail.subject =~ /row DELETED/
          end
          expect( destroy_mail ).not_to be_empty
        end
        it "includes an SQL log in the message" do
          expect(
            AgexMailer.deliveries.last.body.encoded
          ).to include( sql_contents )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
