require 'spec_helper'


describe UserTrainingStoriesHelper do
  include Devise::TestHelpers

  before :each do
    @request.env["devise.mapping"] = :user
    @current_user = create(:user, swimmer: nil)
    sign_in @current_user                                   # @current_user will be the only one logged-in)
    @fixture = create(:user_training_story)
  end


  context "[for any user]" do
    [
      :link_to_user_training_story_show,
      :link_to_user_training_show,
      :link_to_user_training_story_edit,
      :link_to_user_training_story_delete
    ].each do |method_name|
      it "responds to ##{method_name}" do
        expect( helper ).to respond_to(method_name)
      end

      describe "##{method_name}" do
        it "returns non-nil result" do
          expect( helper.send(method_name.to_sym, @fixture) ).not_to be_nil
        end
        it "returns always a non-empty text" do
          expect( helper.send(method_name.to_sym, @fixture).size > 0 ).to be_true
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#link_to_user_training_story_edit()" do
      it "contains a '#{I18n.t(:edit)}' label" do
        expect( helper.link_to_user_training_story_edit(@fixture) ).to include( I18n.t(:edit) )
      end
    end

    describe "#link_to_user_training_story_delete()" do
      it "contains a '#{I18n.t(:delete)}' label" do
        expect( helper.link_to_user_training_story_delete(@fixture) ).to include( I18n.t(:delete) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
