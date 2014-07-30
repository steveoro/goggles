require 'spec_helper'


describe UserTrainingStoriesHelper, :type => :helper do
  include Devise::TestHelpers

  before :each do
    @request.env["devise.mapping"] = :user
    @current_user = create(:user, swimmer: nil)
    sign_in @current_user                                   # @current_user will be the only one logged-in)
  end
  #-- -------------------------------------------------------------------------
  #++


  # Implicit Params:
  # - fixture: a valid instance of UserTrainingStory
  #
  shared_examples_for "UserTrainingStoriesHelper methods, successful with accessible content" do
    it "has non-nil fixture" do
      expect( fixture ).not_to be_nil
    end

    describe "#link_to_user_training_stories()" do
      it "returns non-nil result" do
        expect( helper.link_to_user_training_stories() ).not_to be_nil
      end
      it "contains a '#{I18n.t(:back_to_index_view)}' label" do
        expect( helper.link_to_user_training_stories() ).to include( I18n.t(:back_to_index_view) )
      end
    end
    describe "#link_to_user_training_from_story()" do
      it "contains the training name as the label" do
        expect( helper.link_to_user_training_from_story(fixture) ).to include(
          UserTrainingStoryDecorator.decorate(fixture).get_user_training_name
        )
      end
    end
    describe "#link_to_user_training_story_show_with_label()" do
      it "contains the story notes as the label" do
        expect( helper.link_to_user_training_story_show_with_label(fixture) ).to include(
          fixture.notes
        )
      end
    end
    describe "#link_to_user_training_story_show()" do
      it "contains a '#{I18n.t(:show)}' label" do
        expect( helper.link_to_user_training_story_show(fixture) ).to include( I18n.t(:show) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any user]" do
    [
      :link_to_user_training_stories,
      :link_to_user_training_from_story,
      :link_to_user_training_story_show_with_label,
      :link_to_user_training_story_show,
      :link_to_user_training_story_edit,
      :link_to_user_training_story_delete
    ].each do |method_name|
      it "responds to ##{method_name}" do
        expect( helper ).to respond_to(method_name)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/o shared content]" do
    let( :non_shared_fixture ) { create(:user_training_story) }

    [
      :link_to_user_training_story_show,
      :link_to_user_training_story_edit,
      :link_to_user_training_story_delete
    ].each do |method_name|
      it "returns always nil" do
        expect( helper.send(method_name.to_sym, non_shared_fixture) ).to be_nil
      end
    end

    describe "#link_to_user_training_stories()" do
      it "returns non-nil result" do
        expect( helper.link_to_user_training_stories() ).not_to be_nil
      end
      it "contains a '#{I18n.t(:back_to_index_view)}' label" do
        expect( helper.link_to_user_training_stories() ).to include( I18n.t(:back_to_index_view) )
      end
    end

    describe "#link_to_user_training_from_story()" do
      it "returns non-nil result" do
        expect( helper.link_to_user_training_from_story(non_shared_fixture) ).not_to be_nil
      end
      it "contains the training name as the label" do
        expect( helper.link_to_user_training_from_story(non_shared_fixture) ).to include(
          UserTrainingStoryDecorator.decorate(non_shared_fixture).get_user_training_name
        )
      end
    end

    describe "#link_to_user_training_story_show_with_label()" do
      it "returns non-nil result" do
        expect( helper.link_to_user_training_story_show_with_label(non_shared_fixture) ).not_to be_nil
      end
      it "contains the story notes as the label" do
        expect( helper.link_to_user_training_story_show_with_label(non_shared_fixture) ).to include(
          non_shared_fixture.notes
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/ owned content]" do
    let!( :owned_fixture ) { create(:user_training_story, user: @current_user) }

    [
      :link_to_user_training_from_story,
      :link_to_user_training_story_show_with_label,
      :link_to_user_training_story_show,
      :link_to_user_training_story_edit,
      :link_to_user_training_story_delete
    ].each do |method_name|
      describe "##{method_name}" do
        it "returns non-nil result" do
          expect( helper.send(method_name.to_sym, owned_fixture) ).not_to be_nil
        end
        it "returns always a non-empty text" do
          expect( helper.send(method_name.to_sym, owned_fixture).size > 0 ).to be true
        end
      end
    end

    describe "#link_to_user_training_story_edit()" do
      it "contains a '#{I18n.t(:edit)}' label" do
        expect( helper.link_to_user_training_story_edit(owned_fixture) ).to include( I18n.t(:edit) )
      end
    end

    describe "#link_to_user_training_story_delete()" do
      it "contains a '#{I18n.t(:delete)}' label" do
        expect( helper.link_to_user_training_story_delete(owned_fixture) ).to include( I18n.t(:delete) )
      end
    end

    it_behaves_like "UserTrainingStoriesHelper methods, successful with accessible content" do
      let(:fixture) { owned_fixture }
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/ shared content]" do
    let!( :shared_fixture ) { create(:user_training_story) }
    before :each do
      shared_fixture.user.invite( @current_user, true, true, true )   # he wants to share everything
      @current_user.approve( shared_fixture.user, true, true, true )  # the current user approves
    end

    [
      :link_to_user_training_story_edit,
      :link_to_user_training_story_delete
    ].each do |method_name|
      it "returns always nil" do
        expect( helper.send(method_name.to_sym, shared_fixture) ).to be_nil
      end
    end

    [
      :link_to_user_training_from_story,
      :link_to_user_training_story_show_with_label,
      :link_to_user_training_story_show
    ].each do |method_name|
      describe "##{method_name}" do
        it "returns non-nil result" do
          expect( helper.send(method_name.to_sym, shared_fixture) ).not_to be_nil
        end
        it "returns always a non-empty text" do
          expect( helper.send(method_name.to_sym, shared_fixture).size > 0 ).to be true
        end
      end
    end

    it_behaves_like "UserTrainingStoriesHelper methods, successful with accessible content" do
      let(:fixture) { shared_fixture }
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
