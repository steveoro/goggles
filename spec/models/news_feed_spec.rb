require 'spec_helper'


shared_examples_for "generic create news-feed row creation" do
  it "raises ActiveRecord::RecordNotSaved when the parameters are not valid" do
    expect( NewsFeed.send(@class_method_to_call, nil, 1, 'title', 'body') ).to raise_exception
    expect( NewsFeed.send(@class_method_to_call, 1, nil, 'title', 'body') ).to raise_exception
    expect( NewsFeed.send(@class_method_to_call, 1, 1, nil, 'body') ).to raise_exception
    expect( NewsFeed.send(@class_method_to_call, 1, 1, 'title', nil) ).to raise_exception
  end

  it "adds a row when successful" do
    expect{
      NewsFeed.send(@class_method_to_call, 1, 1, 'title', 'body' )
    }.to change{ NewsFeed.count }.by(1)
  end
end
# -----------------------------------------------------------------------------


shared_examples_for "generic achievement news-feed creation" do
  before( :each ) do
    @user = create(:user)
    @friend = create(:user)
  end

  it "adds a row when successful" do
    expect{
      NewsFeed.send(@class_method_to_call, @user, @friend, 1 )
    }.to change{ NewsFeed.count }.by(1)
  end
end
# -----------------------------------------------------------------------------


describe NewsFeed do
  context "[class]" do
    it "has a method to create a generic social feed" do
      expect( NewsFeed ).to respond_to( :create_social_feed )
    end

    it "has a method to create a social/approve feed" do
      expect( NewsFeed ).to respond_to( :create_social_approve_feed )
    end

    it "has a method to create a social/remove feed" do
      expect( NewsFeed ).to respond_to( :create_social_remove_feed )
    end


    it "has a method to create a generic achievement feed" do
      expect( NewsFeed ).to respond_to( :create_achievement_feed )
    end

    it "has a method to create an achievement/approve feed" do
      expect( NewsFeed ).to respond_to( :create_achievement_approve_feed )
    end

    it "has a method to create an achievement/confirm feed" do
      expect( NewsFeed ).to respond_to( :create_achievement_confirm_feed )
    end
    # -------------------------------------------------------------------------


    describe "self.create_social_feed()" do
      before( :each ) { @class_method_to_call = :create_social_feed }
      it_behaves_like "generic create news-feed row creation"
    end

    describe "self.create_social_approve_feed()" do
      before( :each ) do
        @user = create(:user)
        @friend = create(:user)
      end
      it "adds 2 rows when successful" do
        expect{
          NewsFeed.send(:create_social_approve_feed, @user, @friend )
        }.to change{ NewsFeed.count }.by(2)
      end
    end

    describe "self.create_social_remove_feed()" do
      before( :each ) do
        @user = create(:user)
        @friend = create(:user)
      end
      it "adds 1 row when successful" do
        expect{
          NewsFeed.send(:create_social_remove_feed, @user, @friend )
        }.to change{ NewsFeed.count }.by(1)
      end
    end


    describe "self.create_achievement_feed()" do
      before( :each ) { @class_method_to_call = :create_achievement_feed }
      it_behaves_like "generic create news-feed row creation"
    end

    describe "self.create_achievement_approve_feed()" do
      before( :each ) { @class_method_to_call = :create_achievement_approve_feed }
      it_behaves_like "generic achievement news-feed creation"
    end

    describe "self.create_achievement_confirm_feed()" do
      before( :each ) { @class_method_to_call = :create_achievement_confirm_feed }
      it_behaves_like "generic achievement news-feed creation"
    end
    # -------------------------------------------------------------------------
  end
  # ---------------------------------------------------------------------------


  context "[a well formed instance]" do
    it "is a valid istance" do
      news_feed = create( :news_feed )
      expect( news_feed ).to be_valid
      expect( news_feed.title ).not_to be_nil
      expect( news_feed.title ).not_to be_empty
      expect( news_feed.user ).to be_valid
      expect( news_feed.friend ).to be_valid
    end
  end
  # ----------------------------------------------------------------------------

end
