FactoryGirl.define do
  factory :question do
    title "MyString"
    content "MyText"
    # Not setting votecount (set by default to 0), rather using 2 upvotes or downvotes
    # vote_count 10
  end

end
