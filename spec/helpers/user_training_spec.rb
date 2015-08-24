require 'spec_helper'


describe UserTrainingsHelper, :type => :helper do
  include Devise::TestHelpers
  include ERB::Util

  before :each do
    @request.env["devise.mapping"] = :user
    @current_user = create(:user, swimmer: nil)
    sign_in @current_user                                   # @current_user will be the only one logged-in)
  end
  #-- -------------------------------------------------------------------------
  #++


  # Implicit Params:
  # - fixture: a valid instance of UserTraining
  #
  shared_examples_for "UserTrainingsHelper methods, successful with accessible content" do
    it "has non-nil fixture" do
      expect( fixture ).not_to be_nil
    end

    describe "#link_to_user_trainings()" do
      it "returns non-nil result" do
        expect( helper.link_to_user_trainings() ).not_to be_nil
      end
      it "contains a '#{I18n.t(:back_to_index_view)}' label" do
        expect( helper.link_to_user_trainings() ).to include( "".html_safe << I18n.t(:back_to_index_view) )
      end
    end
    describe "#link_to_user_training_show()" do
      it "contains a '#{I18n.t(:show)}' label" do
        expect( helper.link_to_user_training_show(fixture) ).to include( "".html_safe << I18n.t(:show) )
      end
    end
    describe "#link_to_user_training_show_with_label()" do
      it "contains the training name as the label" do
        expect( helper.link_to_user_training_show_with_label(fixture) ).to include(
          fixture.get_full_name()
        )
      end
    end
    describe "#link_to_user_training_printout()" do
      it "contains a 'PDF' label" do
        expect( helper.link_to_user_training_printout(fixture) ).to include( 'PDF' )
      end
    end
    describe "#link_to_user_training_duplicate()" do
      it "contains a '#{I18n.t(:duplicate)}' label" do
        expect( helper.link_to_user_training_duplicate(fixture) ).to include( "".html_safe << I18n.t(:duplicate) )
      end
    end
    describe "#link_to_user_training_create_user_story()" do
      it "contains a '#{I18n.t('user_trainings.create_user_story')}' label" do
        expect( helper.link_to_user_training_create_user_story(fixture) ).to include(
          html_escape( I18n.t('user_trainings.create_user_story') )
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any user]" do
    [
      :link_to_user_trainings,
      :link_to_user_training_show,
      :link_to_user_training_show_with_label,
      :link_to_user_training_printout,
      :link_to_user_training_duplicate,
      :link_to_user_training_create_user_story,
      :link_to_user_training_edit,
      :link_to_user_training_delete
    ].each do |method_name|
      it "responds to ##{method_name}" do
        expect( helper ).to respond_to(method_name)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/o shared content]" do
    let( :non_shared_fixture ) { create(:user_training) }

    [
      :link_to_user_training_show,
      :link_to_user_training_printout,
      :link_to_user_training_duplicate,
      :link_to_user_training_create_user_story,
      :link_to_user_training_edit,
      :link_to_user_training_delete
    ].each do |method_name|
      describe "##{method_name}" do
        it "returns always nil" do
          expect( helper.send(method_name.to_sym, non_shared_fixture) ).to be_nil
        end
      end
    end

    describe "#link_to_user_trainings()" do
      it "returns non-nil result" do
        expect( helper.link_to_user_trainings() ).not_to be_nil
      end
      it "contains a '#{I18n.t(:back_to_index_view)}' label" do
        expect( helper.link_to_user_trainings() ).to include( "".html_safe << I18n.t(:back_to_index_view) )
      end
    end

    describe "#link_to_user_training_show_with_label()" do
      it "returns non-nil result" do
        expect( helper.link_to_user_training_show_with_label(non_shared_fixture) ).not_to be_nil
      end
      it "contains the training name as the label" do
        expect( helper.link_to_user_training_show_with_label(non_shared_fixture) ).to include(
          non_shared_fixture.get_full_name()
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/ owned content]" do
    let!( :owned_fixture ) { create(:user_training, user: @current_user) }

    [
      :link_to_user_training_show,
      :link_to_user_training_show_with_label,
      :link_to_user_training_printout,
      :link_to_user_training_duplicate,
      :link_to_user_training_create_user_story,
      :link_to_user_training_edit,
      :link_to_user_training_delete
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

    describe "#link_to_user_training_edit()" do
      it "contains a '#{I18n.t(:edit)}' label" do
        expect( helper.link_to_user_training_edit(owned_fixture) ).to include( "".html_safe << I18n.t(:edit) )
      end
    end
    describe "#link_to_user_training_delete()" do
      it "contains a '#{I18n.t(:delete)}' label" do
        expect( helper.link_to_user_training_delete(owned_fixture) ).to include( "".html_safe << I18n.t(:delete) )
      end
    end

    it_behaves_like "UserTrainingsHelper methods, successful with accessible content" do
      let(:fixture) { owned_fixture }
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/ shared content]" do
    let!( :shared_fixture ) { create(:user_training) }
    before :each do
      shared_fixture.user.invite( @current_user, true, true, true )   # he wants to share everything
      @current_user.approve( shared_fixture.user, true, true, true )  # the current user approves
    end

    [
      :link_to_user_training_edit,
      :link_to_user_training_delete
    ].each do |method_name|
      describe "##{method_name}" do
        it "returns always nil" do
          expect( helper.send(method_name.to_sym, shared_fixture) ).to be_nil
        end
      end
    end

    [
      :link_to_user_training_show,
      :link_to_user_training_show_with_label,
      :link_to_user_training_printout,
      :link_to_user_training_duplicate,
      :link_to_user_training_create_user_story
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

    it_behaves_like "UserTrainingsHelper methods, successful with accessible content" do
      let( :fixture ) { shared_fixture }
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
