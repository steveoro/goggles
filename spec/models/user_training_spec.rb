require 'spec_helper'


describe UserTraining do
  context "[a well formed instance]" do
    before( :each ) do
      @user_training_1 = create( :user_training_with_rows )
    end

    subject { @user_training_1 }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end

    it "has a scope self.visible_to_user()" do
      expect( subject.class ).to respond_to( :visible_to_user )
    end

    context "[implemented instance methods]" do
      it_behaves_like( "(the existance of a method)",
        [
          :get_full_name, 
          :get_verbose_name,
          :get_user_name,
          :get_swimmer_level_type,
          :compute_total_distance,
          :compute_total_seconds,
          :build_group_list_hash
        ]
      )
    end
    # -------------------------------------------------------------------------


    describe "self.visible_to_user()" do
      before(:each) do
        @user_training_2 = create( :user_training_with_rows )
        @user_training_3 = create( :user_training_with_rows, user: @user_training_2.user )
      end

      context "with stored trainings, as a user with no available shared trainings" do
        it "returns an empty list of rows" do
          result = UserTraining.visible_to_user( create(:user) )
          expect( result ).not_to be_nil
          expect( result ).to respond_to( :size )
          expect( result ).to respond_to( :each )
          expect( result.size ).to eq(0)
        end
      end

      context "with stored trainings, as a user with shared trainings" do
        before(:each) do
          @user_training_1.user.invite( @user_training_2.user, true, true, true )   # he wants to share everything
          @user_training_2.user.approve( @user_training_1.user, true, true, true )  # the other one approves
        end
        it "returns a non-empty list of rows" do
          result = UserTraining.visible_to_user( @user_training_1.user )
          expect( result ).not_to be_nil
          expect( result.size > 0 ).to be_true
        end
        it "returns a same.sized list of results for all the sharing friends" do
          result_1 = UserTraining.visible_to_user( @user_training_1.user )
          result_2 = UserTraining.visible_to_user( @user_training_2.user )
          expect( result_1 ).not_to be_nil
          expect( result_2 ).not_to be_nil
          expect( result_1.size ).to eq( result_2.size )
        end
        xit "returns same-item lists for all the sharing friends" do
          result_1 = UserTraining.visible_to_user( @user_training_1.user )
          result_2 = UserTraining.visible_to_user( @user_training_2.user )
          result_1.each do |row|
            expect( result_2.has_member?(row) ).to be_true
          end
        end
        it "returns only rows that are shared and visibile for both" do
          result = UserTraining.visible_to_user( @user_training_1.user )
          result.each do |row|
            expect( [@user_training_1.user_id, @user_training_2.user_id].include?(row.user_id) ).to be_true
          end
        end
      end
    end
    # -------------------------------------------------------------------------
  end
  # ---------------------------------------------------------------------------
end
