FactoryGirl.define do
  factory :answer do
    title "MyString"
    content "MyText"\
    # N.B.  This loaded question (in questions.rb) as the associated question for this answer
    # http://www.slideshare.net/gabevanslv/factory-girl-15924188
    question
  end

end
