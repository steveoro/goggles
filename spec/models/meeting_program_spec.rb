require 'spec_helper'
require 'date'


describe MeetingProgram do
  shared_examples "shared_method_existance_examples"
  shared_examples "shared_meeting_accountable_examples"

# FIXME
#  it_behaves_like "MeetingAccountable"


  describe "not valid istance of meeting program" do
    it_behaves_like( "(not a valid istance without required values)", [ 
      :event_order
    ])    
  end

  describe "well formed meeting program" do
    subject {
      FactoryGirl.create( :meeting_program )
    }
  
    context "[well formed meeting program instance]" do
      it "is a valid istance" do
        subject.should be_valid
      end

      it "it belongs to a valid meeting event" do
        expect( subject.meeting_event ).to be_a( MeetingEvent )
      end

      it "it belongs to a valid gender type" do
        expect( subject.gender_type ).to be_a( GenderType )
      end

      it "it belongs to a valid category type" do
        expect( subject.category_type ).to be_a( CategoryType )
      end
    end

    context "[meeting session general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_short_name,
        :get_full_name,
        :get_verbose_name,
        :get_event_name,
        :get_verbose_event_name,
# FIXME this one returns a date instance:
#        :get_scheduled_date,
        :get_category_and_gender_short
      ])
      # Leega. TODO
      # More methods to check and classify

      xit "REFACTOR THIS USING MeetingAccountable CONCERN" do
        it_behaves_like( "(the existance of a method returning numeric values)", [ 
          :get_entries_count,
          :get_results_count
        ])
      end
    end
  end
end
