require 'spec_helper'

describe EventType, :type => :model do
  it_behaves_like "DropDownListable"
  
  describe "#sort_list_by_style_order" do
    let( :fix_list ) { ["200MI", "50SL", "50FA", "100SL", "200SL"] }
    
    it "has a class method sort_list_by_style_order" do
      expect( EventType ).to respond_to( :sort_list_by_style_order )
    end
    it "accepts a list as parameter" do
      expect( EventType.sort_list_by_style_order( fix_list ) ).not_to be_nil
    end
    it "returns a list" do
      expect( EventType.sort_list_by_style_order ).to be_a_kind_of( Array )
      expect( EventType.sort_list_by_style_order( fix_list ) ).to be_a_kind_of( Array )
    end
    it "returns full event list sorted if invoked without parameter" do
      expect( EventType.sort_list_by_style_order.join(',') ).to eq(EventType.sort_by_style.map{ |event_type| event_type.code }.join(','))   
    end
    it "returns a list with the same number of element" do
      expect( EventType.sort_list_by_style_order( fix_list ).size ).to eq( fix_list.size )
    end
    it "returns a list correctly sorted if invoked with a list" do
      sorted_list = fix_list.sort{ |el_prev, el_next| EventType.find_by_code(el_prev) <=> EventType.find_by_code(el_next) }
      expect( sorted_list.join(',') ).not_to eq(fix_list.join(','))
      expect( sorted_list.join(',') ).to eq( EventType.sort_list_by_style_order( fix_list ).join(',') )
    end
  end
end
