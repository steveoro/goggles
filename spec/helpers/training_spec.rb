require 'rails_helper'


describe TrainingsHelper, :type => :helper do
  include Devise::Test::ControllerHelpers
  include ERB::Util

  before :each do
    @request.env["devise.mapping"] = :user
    @current_user = create(:user, swimmer: nil)
    sign_in @current_user                                   # @current_user will be the only one logged-in)
  end
  #-- -------------------------------------------------------------------------
  #++


  # Implicit Params:
  # - fixture: a valid instance of Training
  #
  shared_examples_for "TrainingsHelper methods, successful with accessible content" do
    it "has non-nil fixture" do
      expect( fixture ).not_to be_nil
    end

    describe "#link_to_trainings()" do
      it "returns non-nil result" do
        expect( helper.link_to_trainings() ).not_to be_nil
      end
      it "contains a '#{I18n.t(:back_to_index_view)}' label" do
        expect( helper.link_to_trainings() ).to include( "".html_safe << I18n.t(:back_to_index_view) )
      end
    end
    describe "#link_to_training_show()" do
      it "contains a '#{I18n.t(:show)}' label" do
        expect( helper.link_to_training_show(fixture) ).to include( "".html_safe << I18n.t(:show) )
      end
    end
    describe "#link_to_training_show_with_label()" do
      it "contains the training name as the label" do
        expect( helper.link_to_training_show_with_label(fixture) ).to include(
          fixture.get_full_name()
        )
      end
    end
    describe "#link_to_training_printout()" do
      it "contains a 'PDF' label" do
        expect( helper.link_to_training_printout(fixture) ).to include( 'PDF' )
      end
    end
    describe "#link_to_training_duplicate()" do
      it "contains a '#{I18n.t(:duplicate)}' label" do
        expect( helper.link_to_training_duplicate(fixture) ).to include( "".html_safe << I18n.t(:duplicate) )
      end
    end
    describe "#link_to_training_create_user_training()" do
      it "contains a '#{I18n.t('trainings.create_user_training')}' label" do
        expect( helper.link_to_training_create_user_training(fixture) ).to include(
          html_escape( I18n.t('trainings.create_user_training') )
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any user]" do
    [
      :link_to_trainings,
      :link_to_training_show,
      :link_to_training_show_with_label,
      :link_to_training_printout,
      :link_to_training_duplicate,
      :link_to_training_create_user_training,
      :link_to_training_edit,
      :link_to_training_delete
    ].each do |method_name|
      it "responds to ##{method_name}" do
        expect( helper ).to respond_to(method_name)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/o shared content]" do
    let( :non_shared_fixture ) { create(:training) }

    [
      :link_to_training_edit,
      :link_to_training_delete
    ].each do |method_name|
      describe "##{method_name}" do
        it "returns always nil" do
          expect( helper.send(method_name.to_sym, non_shared_fixture) ).to be_nil
        end
      end
    end

    [
      :link_to_training_show,
      :link_to_training_show_with_label,
      :link_to_training_printout,
      :link_to_training_duplicate,
      :link_to_training_create_user_training,
    ].each do |method_name|
      describe "##{method_name}" do
        it "returns non-nil result" do
          expect( helper.send(method_name.to_sym, non_shared_fixture) ).not_to be_nil
        end
        it "returns always a non-empty text" do
          expect( helper.send(method_name.to_sym, non_shared_fixture).size > 0 ).to be true
        end
      end
    end

    it_behaves_like "TrainingsHelper methods, successful with accessible content" do
      let( :fixture ) { non_shared_fixture }
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "[any logged-in user, w/ owned content]" do
    let!( :owned_fixture ) { create(:training, user: @current_user) }

    [
      :link_to_training_show,
      :link_to_training_show_with_label,
      :link_to_training_printout,
      :link_to_training_duplicate,
      :link_to_training_create_user_training,
      :link_to_training_edit,
      :link_to_training_delete
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

    describe "#link_to_training_edit()" do
      it "contains a '#{I18n.t(:edit)}' label" do
        expect( helper.link_to_training_edit(owned_fixture) ).to include( I18n.t(:edit) )
      end
    end
    describe "#link_to_training_delete()" do
      it "contains a '#{I18n.t(:delete)}' label" do
        expect( helper.link_to_training_delete(owned_fixture) ).to include( I18n.t(:delete) )
      end
    end

    it_behaves_like "TrainingsHelper methods, successful with accessible content" do
      let(:fixture) { owned_fixture }
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
