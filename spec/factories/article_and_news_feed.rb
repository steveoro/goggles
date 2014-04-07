require 'date'


FactoryGirl.define do

  factory :article do
    sequence( :title )    { |n| "Great article title n.#{n}" }
    sequence( :body )     { |n| "Lorem Ipso Decto Facto Suckio Tanto #{n} Voltam." }
    is_sticky             false
    user
  end

  factory :news_feed do
    sequence( :title )    { |n| "Something happened n.#{n}" }
    body                  { "Something happened! #{ (rand * 100).to_i } friends got interested in you, but then cancelled their requests!" }
    is_read               false
    is_friend_activity    true
    is_achievement        false
    user
    friend_id             { user }
  end
  # ---------------------------------------------------------------------------

end
