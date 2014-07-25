require 'spec_helper'
require 'ffaker'


describe ApplicationHelper do
  include Devise::TestHelpers
  include ERB::Util

  subject { helper }

  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [ 
        :format_longtext,
        :show_tag,
        :count_with_image,
        :count_with_small_star,
        :count_with_award_star,
        :count_with_star,
        :count_with_red_ribbon,
        :count_with_bomb,
        :format_score
      ]
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#format_longtext" do
    let(:long_text)  { Faker::Lorem.paragraph }

    it "returns a String" do
      expect( subject.format_longtext(long_text) ).to be_an_instance_of(String)
    end
    it "includes the specified text" do
      expect( subject.format_longtext(long_text) ).to include(long_text)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#show_tag" do
    it "returns a String" do
      expect( subject.show_tag((rand * 100).to_i.odd?) ).to be_an_instance_of(String)
    end
    it "returns a default 'false' text for a false value" do
      expect( subject.show_tag(false) ).to include('--')
    end
    it "returns an image tag for a true value" do
      expect( subject.show_tag(true) ).to include('tick.png')
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "(a method counting steps of a value with images)" do |method_name, count, step, image_name|
    describe "##{method_name}" do
      let(:result) do
        if method_name.to_sym == :count_with_image
          subject.send(method_name.to_sym, count, step, image_name )
        else
          subject.send(method_name.to_sym, count, step )
        end
      end

      it "returns a String" do
        expect( result ).to be_an_instance_of(String)
      end
      it "returns a non empty string" do
        expect( result.size ).to be >= 1
      end
      it "returns a string containing the undecorated value" do
        expect( result ).to include( count.to_s )
      end
      it "returns a string containing the image for the number of steps required" do
        total_steps = count / step
        expect( result.split(image_name).size ).to be( total_steps + 1 )
      end
    end
  end


  describe "#count_with_image" do
    it_behaves_like(
      "(a method counting steps of a value with images)",
      :count_with_image,
      (rand * 100).to_i,
      10,
      'bullet_star.png'
    )
  end

  describe "#count_with_small_star" do
    it_behaves_like(
      "(a method counting steps of a value with images)",
      :count_with_small_star,
      (rand * 1000).to_i,
      100,
      'bullet_star.png'
    )
  end

  describe "#count_with_award_star" do
    it_behaves_like(
      "(a method counting steps of a value with images)",
      :count_with_award_star,
      (rand * 1000).to_i,
      100,
      'award_star_gold_3.png'
    )
  end

  describe "#count_with_star" do
    it_behaves_like(
      "(a method counting steps of a value with images)",
      :count_with_star,
      (rand * 100000).to_i,
      10000,
      'star.png'
    )
  end

  describe "#count_with_red_ribbon" do
    it_behaves_like(
      "(a method counting steps of a value with images)",
      :count_with_red_ribbon,
      (rand * 100).to_i,
      10,
      'rosette.png'
    )
  end

  describe "#count_with_bomb" do
    it_behaves_like(
      "(a method counting steps of a value with images)",
      :count_with_bomb,
      (rand * 100).to_i,
      10,
      'bomb.png'
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#format_score" do
    let(:score)   { rand * 1000 }
    let(:bias)    { 800 }
    let(:result)  { subject.format_score( score, bias ) }

    it "returns a String" do
      expect( result ).to be_an_instance_of(String)
    end
    it "returns a non empty string" do
      expect( result.size ).to be >= 1
    end
    it "returns a string containing the integer part of the undecorated value" do
      expect( result ).to include( score.to_i.to_s )
    end
    it "returns a string containing the image for the number of steps required" do
      if score > bias
        expect( result ).to include('asterisk_orange.png')
      else
        expect( result ).not_to include('asterisk_orange.png')
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end