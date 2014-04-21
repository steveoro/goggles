require 'spec_helper'
require 'date'

describe Meeting do
  
  describe "not valid istance of meeting" do
    it "not a valid meeting without description" do
      FactoryGirl.build( :meeting, description: nil ).should_not be_valid
    end    

    it "not a valid meeting without code" do
      FactoryGirl.build( :meeting, code: nil ).should_not be_valid
    end    

  end

  describe "well formed meeting" do
    before( :each ) do
      @meeting1 = FactoryGirl.create( :meeting )
    end
  
    context "[well formed meeting instance]" do
      it "is a valid istance" do
        @meeting1.should be_valid
        expect( @meeting1.season ).to be_a( Season )
      end
    end
    
    context "[meeting general methods]" do
      it "has a method to return short description of the meeting" do
        expect( @meeting1 ).to respond_to( :get_short_name )
      end
  
      it "#get_full_name should return correct full description" do
        expect( @meeting1.get_short_name ).to be_an_instance_of( String )
        expect( @meeting1.get_short_name ).not_to eq( '' )
        expect( @meeting1.get_short_name ).not_to eq( '?' )
      end
  
      it "has a method to return full description of the meeting" do
        expect( @meeting1 ).to respond_to( :get_full_name )
      end
  
      it "#get_full_name should return correct full description" do
        expect( @meeting1.get_full_name ).to be_an_instance_of( String )
        expect( @meeting1.get_full_name ).not_to eq( '' )
        expect( @meeting1.get_full_name ).not_to eq( '?' )
      end

      it "has a method to return verbose description of the meeting" do
        expect( @meeting1 ).to respond_to( :get_verbose_name )
      end
  
      it "#get_verbose_name should return correct verbose description" do
        expect( @meeting1.get_verbose_name ).to be_an_instance_of( String )
        expect( @meeting1.get_verbose_name ).not_to eq( '' )
        expect( @meeting1.get_verbose_name ).not_to eq( '?' )
      end

      it "has a method to return short list of meeting events" do
        expect( @meeting1 ).to respond_to( :get_short_events )
      end

      it "#get_short_events should return correct short event list" do
        expect( @meeting1.get_short_events ).to be_an_instance_of( String )
        expect( @meeting1.get_short_events ).not_to eq( '' )
      end

      it "has a method to return complete list of meeting events with session info" do
        expect( @meeting1 ).to respond_to( :get_complete_events )
      end

      it "#get_complete_events should return correct event list with session info" do
        expect( @meeting1.get_complete_events ).to be_an_instance_of( String )
        expect( @meeting1.get_complete_events ).not_to eq( '' )
      end
    end
    
    context "[meeting result methods]" do      
      it "has a method to determine whether the results are acquired"

      it "has a method to determine how many male and female athletes swam"

      it "has a method to determine how many male and female athletes/programs swam"

      it "has a method to determine the meeting team charts"
      
      it "has a method to determine the meeting oldest male and female athletes"
      
      it "has a method to determine the meeting best male and female techinical results"
    end
  end
end
